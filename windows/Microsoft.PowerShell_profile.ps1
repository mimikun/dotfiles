using namespace System.Management.Automation
using namespace System.Management.Automation.Language


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


# starship init powershell --print-full-init Result:
$null = New-Module starship {
    function Get-Cwd {
        $cwd = Get-Location
        $provider_prefix = "$($cwd.Provider.ModuleName)\$($cwd.Provider.Name)::"
        return @{
            # Resolve the actual/physical path
            # NOTE: ProviderPath is only a physical filesystem path for the "FileSystem" provider
            # E.g. `Dev:\` -> `C:\Users\Joe Bloggs\Dev\`
            Path = $cwd.ProviderPath;
            # Resolve the provider-logical path
            # NOTE: Attempt to trim any "provider prefix" from the path string.
            # E.g. `Microsoft.PowerShell.Core\FileSystem::Dev:\` -> `Dev:\`
            LogicalPath =
                if ($cwd.Path.StartsWith($provider_prefix)) {
                    $cwd.Path.Substring($provider_prefix.Length)
                } else {
                    $cwd.Path
                };
        }
    }

    function Invoke-Native {
        param($Executable, $Arguments)
        $startInfo = New-Object System.Diagnostics.ProcessStartInfo -ArgumentList $Executable -Property @{
            StandardOutputEncoding = [System.Text.Encoding]::UTF8;
            RedirectStandardOutput = $true;
            RedirectStandardError = $true;
            CreateNoWindow = $true;
            UseShellExecute = $false;
        };
        if ($startInfo.ArgumentList.Add) {
            # PowerShell 6+ uses .NET 5+ and supports the ArgumentList property
            # which bypasses the need for manually escaping the argument list into
            # a command string.
            foreach ($arg in $Arguments) {
                $startInfo.ArgumentList.Add($arg);
            }
        }
        else {
            # Build an arguments string which follows the C++ command-line argument quoting rules
            # See: https://docs.microsoft.com/en-us/previous-versions//17w5ykft(v=vs.85)?redirectedfrom=MSDN
            $escaped = $Arguments | ForEach-Object {
                $s = $_ -Replace '(\\+)"','$1$1"'; # Escape backslash chains immediately preceding quote marks.
                $s = $s -Replace '(\\+)$','$1$1';  # Escape backslash chains immediately preceding the end of the string.
                $s = $s -Replace '"','\"';         # Escape quote marks.
                "`"$s`""                           # Quote the argument.
            }
            $startInfo.Arguments = $escaped -Join ' ';
        }
        $process = [System.Diagnostics.Process]::Start($startInfo)

        # Read the output and error streams asynchronously
        # Avoids potential deadlocks when the child process fills one of the buffers
        # https://docs.microsoft.com/en-us/dotnet/api/system.diagnostics.process.standardoutput?view=net-6.0#remarks
        $stdout = $process.StandardOutput.ReadToEndAsync()
        $stderr = $process.StandardError.ReadToEndAsync()
        [System.Threading.Tasks.Task]::WaitAll(@($stdout, $stderr))

        # stderr isn't displayed with this style of invocation
        # Manually write it to console
        if ($stderr.Result.Trim() -ne '') {
            # Write-Error doesn't work here
            $host.ui.WriteErrorLine($stderr)
        }

        $stdout.Result;
    }

    function Enable-TransientPrompt {
        Set-PSReadLineKeyHandler -Key Enter -ScriptBlock {
            $previousOutputEncoding = [Console]::OutputEncoding
            try {
                $parseErrors = $null
                [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$null, [ref]$null, [ref]$parseErrors, [ref]$null)
                if ($parseErrors.Count -eq 0) {
                    $script:TransientPrompt = $true
                    [Console]::OutputEncoding = [Text.Encoding]::UTF8
                    [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
                }
            } finally {
                if ($script:DoesUseLists) {
                    # If PSReadline is set to display suggestion list, this workaround is needed to clear the buffer below
                    # before accepting the current commandline. The max amount of items in the list is 10, so 12 lines
                    # are cleared (10 + 1 more for the prompt + 1 more for current commandline).
                    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("`n" * [math]::Min($Host.UI.RawUI.WindowSize.Height - $Host.UI.RawUI.CursorPosition.Y - 1, 12))
                    [Microsoft.PowerShell.PSConsoleReadLine]::Undo()
                }
                [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
                [Console]::OutputEncoding = $previousOutputEncoding
            }
        }
    }

    function Disable-TransientPrompt {
        Set-PSReadLineKeyHandler -Key Enter -Function AcceptLine
        $script:TransientPrompt = $false
    }

    function global:prompt {
        $origDollarQuestion = $global:?
        $origLastExitCode = $global:LASTEXITCODE

        # Invoke precmd, if specified
        try {
            if (Test-Path function:Invoke-Starship-PreCommand) {
                Invoke-Starship-PreCommand
            }
        } catch {}

        # @ makes sure the result is an array even if single or no values are returned
        $jobs = @(Get-Job | Where-Object { $_.State -eq 'Running' }).Count

        $cwd = Get-Cwd
        $arguments = @(
            "prompt"
            "--path=$($cwd.Path)",
            "--logical-path=$($cwd.LogicalPath)",
            "--terminal-width=$($Host.UI.RawUI.WindowSize.Width)",
            "--jobs=$($jobs)"
        )

        # We start from the premise that the command executed correctly, which covers also the fresh console.
        $lastExitCodeForPrompt = 0
        if ($lastCmd = Get-History -Count 1) {
            # In case we have a False on the Dollar hook, we know there's an error.
            if (-not $origDollarQuestion) {
                # We retrieve the InvocationInfo from the most recent error using $global:error[0]
                $lastCmdletError = try { $global:error[0] |  Where-Object { $_ -ne $null } | Select-Object -ExpandProperty InvocationInfo } catch { $null }
                # We check if the last command executed matches the line that caused the last error, in which case we know
                # it was an internal Powershell command, otherwise, there MUST be an error code.
                $lastExitCodeForPrompt = if ($null -ne $lastCmdletError -and $lastCmd.CommandLine -eq $lastCmdletError.Line) { 1 } else { $origLastExitCode }
            }
            $duration = [math]::Round(($lastCmd.EndExecutionTime - $lastCmd.StartExecutionTime).TotalMilliseconds)

            $arguments += "--cmd-duration=$($duration)"
        }

        $arguments += "--status=$($lastExitCodeForPrompt)"

        # Invoke Starship
        $promptText = if ($script:TransientPrompt) {
            $script:TransientPrompt = $false
            if (Test-Path function:Invoke-Starship-TransientFunction) {
                Invoke-Starship-TransientFunction
            } else {
                "$([char]0x1B)[1;32m❯$([char]0x1B)[0m "
            }
        } else {
            Invoke-Native -Executable 'C:\ProgramData\chocolatey\lib\starship\tools\starship.exe' -Arguments $arguments
        }

        # Set the number of extra lines in the prompt for PSReadLine prompt redraw.
        Set-PSReadLineOption -ExtraPromptLineCount ($promptText.Split("`n").Length - 1)

        # Return the prompt
        $promptText

        # Propagate the original $LASTEXITCODE from before the prompt function was invoked.
        $global:LASTEXITCODE = $origLastExitCode

        # Propagate the original $? automatic variable value from before the prompt function was invoked.
        #
        # $? is a read-only or constant variable so we can't directly override it.
        # In order to propagate up its original boolean value we will take an action
        # which will produce the desired value.
        #
        # This has to be the very last thing that happens in the prompt function
        # since every PowerShell command sets the $? variable.
        if ($global:? -ne $origDollarQuestion) {
            if ($origDollarQuestion) {
                 # Simple command which will execute successfully and set $? = True without any other side affects.
                1+1
            } else {
                # Write-Error will set $? to False.
                # ErrorAction Ignore will prevent the error from being added to the $Error collection.
                Write-Error '' -ErrorAction 'Ignore'
            }
        }

    }

    # Disable virtualenv prompt, it breaks starship
    $ENV:VIRTUAL_ENV_DISABLE_PROMPT=1

    $script:TransientPrompt = $false
    $script:DoesUseLists = (Get-PSReadLineOption).PredictionViewStyle -eq 'ListView'

    if ($PSVersionTable.PSVersion.Major -gt 5) {
        $ENV:STARSHIP_SHELL = "pwsh"
    } else {
        $ENV:STARSHIP_SHELL = "powershell"
    }

    # Set up the session key that will be used to store logs
    $ENV:STARSHIP_SESSION_KEY = -join ((48..57) + (65..90) + (97..122) | Get-Random -Count 16 | ForEach-Object { [char]$_ })

    # Invoke Starship and set continuation prompt
    Set-PSReadLineOption -ContinuationPrompt (
        Invoke-Native -Executable 'C:\ProgramData\chocolatey\lib\starship\tools\starship.exe' -Arguments @(
            "prompt",
            "--continuation"
        )
    )

    Export-ModuleMember -Function @(
        "Enable-TransientPrompt"
        "Disable-TransientPrompt"
    )
}
# starship init powershell --print-full-init Result end.
# starship completions powershell Result:
Register-ArgumentCompleter -Native -CommandName 'starship' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'starship'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'starship' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Print version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version information')
            [CompletionResult]::new('bug-report', 'bug-report', [CompletionResultType]::ParameterValue, 'Create a pre-populated GitHub issue with information about your configuration')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate starship shell completions for your shell to stdout')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'Edit the starship configuration')
            [CompletionResult]::new('explain', 'explain', [CompletionResultType]::ParameterValue, 'Explains the currently showing modules')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Prints the shell function used to execute starship')
            [CompletionResult]::new('module', 'module', [CompletionResultType]::ParameterValue, 'Prints a specific prompt module')
            [CompletionResult]::new('preset', 'preset', [CompletionResultType]::ParameterValue, 'Prints a preset config')
            [CompletionResult]::new('print-config', 'print-config', [CompletionResultType]::ParameterValue, 'Prints the computed starship configuration')
            [CompletionResult]::new('prompt', 'prompt', [CompletionResultType]::ParameterValue, 'Prints the full starship prompt')
            [CompletionResult]::new('session', 'session', [CompletionResultType]::ParameterValue, 'Generate random session key')
            [CompletionResult]::new('time', 'time', [CompletionResultType]::ParameterValue, 'Prints time in milliseconds')
            [CompletionResult]::new('timings', 'timings', [CompletionResultType]::ParameterValue, 'Prints timings of all active modules')
            [CompletionResult]::new('toggle', 'toggle', [CompletionResultType]::ParameterValue, 'Toggle a given starship module')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'starship;bug-report' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;completions' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;config' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;explain' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--status', 'status', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--pipestatus', 'pipestatus', [CompletionResultType]::ParameterName, 'Bash, Fish and Zsh support returning codes for each process in a pipeline')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('--terminal-width', 'terminal-width', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('-P', 'P', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('--logical-path', 'logical-path', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('--cmd-duration', 'cmd-duration', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('-k', 'k', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('--keymap', 'keymap', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('-j', 'j', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('--jobs', 'jobs', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;init' {
            [CompletionResult]::new('--print-full-init', 'print-full-init', [CompletionResultType]::ParameterName, 'print-full-init')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;module' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--status', 'status', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--pipestatus', 'pipestatus', [CompletionResultType]::ParameterName, 'Bash, Fish and Zsh support returning codes for each process in a pipeline')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('--terminal-width', 'terminal-width', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('-P', 'P', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('--logical-path', 'logical-path', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('--cmd-duration', 'cmd-duration', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('-k', 'k', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('--keymap', 'keymap', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('-j', 'j', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('--jobs', 'jobs', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('-l', 'l', [CompletionResultType]::ParameterName, 'List out all supported modules')
            [CompletionResult]::new('--list', 'list', [CompletionResultType]::ParameterName, 'List out all supported modules')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;preset' {
            [CompletionResult]::new('-l', 'l', [CompletionResultType]::ParameterName, 'List out all preset names')
            [CompletionResult]::new('--list', 'list', [CompletionResultType]::ParameterName, 'List out all preset names')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;print-config' {
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Print the default instead of the computed config')
            [CompletionResult]::new('--default', 'default', [CompletionResultType]::ParameterName, 'Print the default instead of the computed config')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;prompt' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--status', 'status', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--pipestatus', 'pipestatus', [CompletionResultType]::ParameterName, 'Bash, Fish and Zsh support returning codes for each process in a pipeline')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('--terminal-width', 'terminal-width', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('-P', 'P', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('--logical-path', 'logical-path', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('--cmd-duration', 'cmd-duration', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('-k', 'k', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('--keymap', 'keymap', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('-j', 'j', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('--jobs', 'jobs', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('--right', 'right', [CompletionResultType]::ParameterName, 'Print the right prompt (instead of the standard left prompt)')
            [CompletionResult]::new('--continuation', 'continuation', [CompletionResultType]::ParameterName, 'Print the continuation prompt (instead of the standard left prompt)')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;session' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;time' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;timings' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--status', 'status', [CompletionResultType]::ParameterName, 'The status code of the previously run command as an unsigned or signed 32bit integer')
            [CompletionResult]::new('--pipestatus', 'pipestatus', [CompletionResultType]::ParameterName, 'Bash, Fish and Zsh support returning codes for each process in a pipeline')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('--terminal-width', 'terminal-width', [CompletionResultType]::ParameterName, 'The width of the current interactive terminal')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'The path that the prompt should render for')
            [CompletionResult]::new('-P', 'P', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('--logical-path', 'logical-path', [CompletionResultType]::ParameterName, 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument')
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('--cmd-duration', 'cmd-duration', [CompletionResultType]::ParameterName, 'The execution duration of the last command, in milliseconds')
            [CompletionResult]::new('-k', 'k', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('--keymap', 'keymap', [CompletionResultType]::ParameterName, 'The keymap of fish/zsh/cmd')
            [CompletionResult]::new('-j', 'j', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('--jobs', 'jobs', [CompletionResultType]::ParameterName, 'The number of currently running jobs')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;toggle' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'starship;help' {
            [CompletionResult]::new('bug-report', 'bug-report', [CompletionResultType]::ParameterValue, 'Create a pre-populated GitHub issue with information about your configuration')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate starship shell completions for your shell to stdout')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'Edit the starship configuration')
            [CompletionResult]::new('explain', 'explain', [CompletionResultType]::ParameterValue, 'Explains the currently showing modules')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Prints the shell function used to execute starship')
            [CompletionResult]::new('module', 'module', [CompletionResultType]::ParameterValue, 'Prints a specific prompt module')
            [CompletionResult]::new('preset', 'preset', [CompletionResultType]::ParameterValue, 'Prints a preset config')
            [CompletionResult]::new('print-config', 'print-config', [CompletionResultType]::ParameterValue, 'Prints the computed starship configuration')
            [CompletionResult]::new('prompt', 'prompt', [CompletionResultType]::ParameterValue, 'Prints the full starship prompt')
            [CompletionResult]::new('session', 'session', [CompletionResultType]::ParameterValue, 'Generate random session key')
            [CompletionResult]::new('time', 'time', [CompletionResultType]::ParameterValue, 'Prints time in milliseconds')
            [CompletionResult]::new('timings', 'timings', [CompletionResultType]::ParameterValue, 'Prints timings of all active modules')
            [CompletionResult]::new('toggle', 'toggle', [CompletionResultType]::ParameterValue, 'Toggle a given starship module')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'starship;help;bug-report' {
            break
        }
        'starship;help;completions' {
            break
        }
        'starship;help;config' {
            break
        }
        'starship;help;explain' {
            break
        }
        'starship;help;init' {
            break
        }
        'starship;help;module' {
            break
        }
        'starship;help;preset' {
            break
        }
        'starship;help;print-config' {
            break
        }
        'starship;help;prompt' {
            break
        }
        'starship;help;session' {
            break
        }
        'starship;help;time' {
            break
        }
        'starship;help;timings' {
            break
        }
        'starship;help;toggle' {
            break
        }
        'starship;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
# starship completions powershell Result end.

# rustup completions powershell Result:
Register-ArgumentCompleter -Native -CommandName 'rustup' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'rustup'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-')) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'rustup' {
            [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Enable verbose output')
            [CompletionResult]::new('--verbose', 'verbose', [CompletionResultType]::ParameterName, 'Enable verbose output')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Disable progress output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Disable progress output')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('dump-testament', 'dump-testament', [CompletionResultType]::ParameterValue, 'Dump information about the build')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show the active and installed toolchains or profiles')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Update Rust toolchains')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall Rust toolchains')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Update Rust toolchains and rustup')
            [CompletionResult]::new('check', 'check', [CompletionResultType]::ParameterValue, 'Check for updates to Rust toolchains and rustup')
            [CompletionResult]::new('default', 'default', [CompletionResultType]::ParameterValue, 'Set the default toolchain')
            [CompletionResult]::new('toolchain', 'toolchain', [CompletionResultType]::ParameterValue, 'Modify or query the installed toolchains')
            [CompletionResult]::new('target', 'target', [CompletionResultType]::ParameterValue, 'Modify a toolchain''s supported targets')
            [CompletionResult]::new('component', 'component', [CompletionResultType]::ParameterValue, 'Modify a toolchain''s installed components')
            [CompletionResult]::new('override', 'override', [CompletionResultType]::ParameterValue, 'Modify directory toolchain overrides')
            [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterValue, 'Run a command with an environment configured for a given toolchain')
            [CompletionResult]::new('which', 'which', [CompletionResultType]::ParameterValue, 'Display which binary will be run for a given command')
            [CompletionResult]::new('doc', 'doc', [CompletionResultType]::ParameterValue, 'Open the documentation for the current toolchain')
            [CompletionResult]::new('self', 'self', [CompletionResultType]::ParameterValue, 'Modify the rustup installation')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Alter rustup settings')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate tab-completion scripts for your shell')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;dump-testament' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;show' {
            [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Enable verbose output with rustc information for all installed toolchains')
            [CompletionResult]::new('--verbose', 'verbose', [CompletionResultType]::ParameterName, 'Enable verbose output with rustc information for all installed toolchains')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('active-toolchain', 'active-toolchain', [CompletionResultType]::ParameterValue, 'Show the active toolchain')
            [CompletionResult]::new('home', 'home', [CompletionResultType]::ParameterValue, 'Display the computed value of RUSTUP_HOME')
            [CompletionResult]::new('profile', 'profile', [CompletionResultType]::ParameterValue, 'Show the current profile')
            [CompletionResult]::new('keys', 'keys', [CompletionResultType]::ParameterValue, 'Display the known PGP keys')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;show;active-toolchain' {
            [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Enable verbose output with rustc information')
            [CompletionResult]::new('--verbose', 'verbose', [CompletionResultType]::ParameterName, 'Enable verbose output with rustc information')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;show;home' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;show;profile' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;show;keys' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;show;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;install' {
            [CompletionResult]::new('--profile', 'profile', [CompletionResultType]::ParameterName, 'profile')
            [CompletionResult]::new('--no-self-update', 'no-self-update', [CompletionResultType]::ParameterName, 'Don''t perform self-update when running the `rustup install` command')
            [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Force an update, even if some components are missing')
            [CompletionResult]::new('--force-non-host', 'force-non-host', [CompletionResultType]::ParameterName, 'Install toolchains that require an emulator. See https://github.com/rust-lang/rustup/wiki/Non-host-toolchains')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;uninstall' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;update' {
            [CompletionResult]::new('--no-self-update', 'no-self-update', [CompletionResultType]::ParameterName, 'Don''t perform self update when running the `rustup update` command')
            [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Force an update, even if some components are missing')
            [CompletionResult]::new('--force-non-host', 'force-non-host', [CompletionResultType]::ParameterName, 'Install toolchains that require an emulator. See https://github.com/rust-lang/rustup/wiki/Non-host-toolchains')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;check' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;default' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;toolchain' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List installed toolchains')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Install or update a given toolchain')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall a toolchain')
            [CompletionResult]::new('link', 'link', [CompletionResultType]::ParameterValue, 'Create a custom toolchain by symlinking to a directory')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;toolchain;list' {
            [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Enable verbose output with toolchain information')
            [CompletionResult]::new('--verbose', 'verbose', [CompletionResultType]::ParameterName, 'Enable verbose output with toolchain information')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;toolchain;install' {
            [CompletionResult]::new('--profile', 'profile', [CompletionResultType]::ParameterName, 'profile')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Add specific components on installation')
            [CompletionResult]::new('--component', 'component', [CompletionResultType]::ParameterName, 'Add specific components on installation')
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'Add specific targets on installation')
            [CompletionResult]::new('--target', 'target', [CompletionResultType]::ParameterName, 'Add specific targets on installation')
            [CompletionResult]::new('--no-self-update', 'no-self-update', [CompletionResultType]::ParameterName, 'Don''t perform self update when running the`rustup toolchain install` command')
            [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Force an update, even if some components are missing')
            [CompletionResult]::new('--allow-downgrade', 'allow-downgrade', [CompletionResultType]::ParameterName, 'Allow rustup to downgrade the toolchain to satisfy your component choice')
            [CompletionResult]::new('--force-non-host', 'force-non-host', [CompletionResultType]::ParameterName, 'Install toolchains that require an emulator. See https://github.com/rust-lang/rustup/wiki/Non-host-toolchains')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;toolchain;uninstall' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;toolchain;link' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;toolchain;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;target' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List installed and available targets')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a target to a Rust toolchain')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a target from a Rust toolchain')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;target;list' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('--installed', 'installed', [CompletionResultType]::ParameterName, 'List only installed targets')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;target;add' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;target;remove' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;target;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;component' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List installed and available components')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a component to a Rust toolchain')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a component from a Rust toolchain')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;component;list' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('--installed', 'installed', [CompletionResultType]::ParameterName, 'List only installed components')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;component;add' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('--target', 'target', [CompletionResultType]::ParameterName, 'target')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;component;remove' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('--target', 'target', [CompletionResultType]::ParameterName, 'target')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;component;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;override' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List directory toolchain overrides')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the override toolchain for a directory')
            [CompletionResult]::new('unset', 'unset', [CompletionResultType]::ParameterValue, 'Remove the override toolchain for a directory')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;override;list' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;override;set' {
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'Path to the directory')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;override;unset' {
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'Path to the directory')
            [CompletionResult]::new('--nonexistent', 'nonexistent', [CompletionResultType]::ParameterName, 'Remove override toolchain for all nonexistent directories')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;override;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;run' {
            [CompletionResult]::new('--install', 'install', [CompletionResultType]::ParameterName, 'Install the requested toolchain if needed')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;which' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;doc' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'Only print the path to the documentation')
            [CompletionResult]::new('--alloc', 'alloc', [CompletionResultType]::ParameterName, 'The Rust core allocation and collections library')
            [CompletionResult]::new('--book', 'book', [CompletionResultType]::ParameterName, 'The Rust Programming Language book')
            [CompletionResult]::new('--cargo', 'cargo', [CompletionResultType]::ParameterName, 'The Cargo Book')
            [CompletionResult]::new('--core', 'core', [CompletionResultType]::ParameterName, 'The Rust Core Library')
            [CompletionResult]::new('--edition-guide', 'edition-guide', [CompletionResultType]::ParameterName, 'The Rust Edition Guide')
            [CompletionResult]::new('--nomicon', 'nomicon', [CompletionResultType]::ParameterName, 'The Dark Arts of Advanced and Unsafe Rust Programming')
            [CompletionResult]::new('--proc_macro', 'proc_macro', [CompletionResultType]::ParameterName, 'A support library for macro authors when defining new macros')
            [CompletionResult]::new('--reference', 'reference', [CompletionResultType]::ParameterName, 'The Rust Reference')
            [CompletionResult]::new('--rust-by-example', 'rust-by-example', [CompletionResultType]::ParameterName, 'A collection of runnable examples that illustrate various Rust concepts and standard libraries')
            [CompletionResult]::new('--rustc', 'rustc', [CompletionResultType]::ParameterName, 'The compiler for the Rust programming language')
            [CompletionResult]::new('--rustdoc', 'rustdoc', [CompletionResultType]::ParameterName, 'Generate documentation for Rust projects')
            [CompletionResult]::new('--std', 'std', [CompletionResultType]::ParameterName, 'Standard library API documentation')
            [CompletionResult]::new('--test', 'test', [CompletionResultType]::ParameterName, 'Support code for rustc''s built in unit-test and micro-benchmarking framework')
            [CompletionResult]::new('--unstable-book', 'unstable-book', [CompletionResultType]::ParameterName, 'The Unstable Book')
            [CompletionResult]::new('--embedded-book', 'embedded-book', [CompletionResultType]::ParameterName, 'The Embedded Rust Book')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;self' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Download and install updates to rustup')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall rustup.')
            [CompletionResult]::new('upgrade-data', 'upgrade-data', [CompletionResultType]::ParameterValue, 'Upgrade the internal data format.')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;self;update' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;self;uninstall' {
            [CompletionResult]::new('-y', 'y', [CompletionResultType]::ParameterName, 'y')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;self;upgrade-data' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;self;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;set' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('default-host', 'default-host', [CompletionResultType]::ParameterValue, 'The triple used to identify toolchains when not specified')
            [CompletionResult]::new('profile', 'profile', [CompletionResultType]::ParameterValue, 'The default components installed')
            [CompletionResult]::new('auto-self-update', 'auto-self-update', [CompletionResultType]::ParameterValue, 'The rustup auto self update mode')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;set;default-host' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;set;profile' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;set;auto-self-update' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;set;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;completions' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
# rustup completions powershell Result end.

# wezterm shell-completion --shell power-shell Result start
Register-ArgumentCompleter -Native -CommandName 'wezterm' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'wezterm'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'wezterm' {
            [CompletionResult]::new('--config-file', 'config-file', [CompletionResultType]::ParameterName, 'Specify the configuration file to use, overrides the normal configuration file resolution')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Override specific configuration values')
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Skip loading wezterm.lua')
            [CompletionResult]::new('--skip-config', 'skip-config', [CompletionResultType]::ParameterName, 'Skip loading wezterm.lua')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('start', 'start', [CompletionResultType]::ParameterValue, 'Start the GUI, optionally running an alternative program')
            [CompletionResult]::new('ssh', 'ssh', [CompletionResultType]::ParameterValue, 'Establish an ssh session')
            [CompletionResult]::new('serial', 'serial', [CompletionResultType]::ParameterValue, 'Open a serial port')
            [CompletionResult]::new('connect', 'connect', [CompletionResultType]::ParameterValue, 'Connect to wezterm multiplexer')
            [CompletionResult]::new('ls-fonts', 'ls-fonts', [CompletionResultType]::ParameterValue, 'Display information about fonts')
            [CompletionResult]::new('show-keys', 'show-keys', [CompletionResultType]::ParameterValue, 'Show key assignments')
            [CompletionResult]::new('cli', 'cli', [CompletionResultType]::ParameterValue, 'Interact with experimental mux server')
            [CompletionResult]::new('imgcat', 'imgcat', [CompletionResultType]::ParameterValue, 'Output an image to the terminal')
            [CompletionResult]::new('set-working-directory', 'set-working-directory', [CompletionResultType]::ParameterValue, 'Advise the terminal of the current working directory by emitting an OSC 7 escape sequence')
            [CompletionResult]::new('record', 'record', [CompletionResultType]::ParameterValue, 'Record a terminal session as an asciicast')
            [CompletionResult]::new('replay', 'replay', [CompletionResultType]::ParameterValue, 'Replay an asciicast terminal session')
            [CompletionResult]::new('shell-completion', 'shell-completion', [CompletionResultType]::ParameterValue, 'Generate shell completion information')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'wezterm;start' {
            [CompletionResult]::new('--cwd', 'cwd', [CompletionResultType]::ParameterName, 'Specify the current working directory for the initially spawned program')
            [CompletionResult]::new('--class', 'class', [CompletionResultType]::ParameterName, 'Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs')
            [CompletionResult]::new('--workspace', 'workspace', [CompletionResultType]::ParameterName, 'Override the default workspace with the provided name. The default is "default"')
            [CompletionResult]::new('--position', 'position', [CompletionResultType]::ParameterName, 'Override the position for the initial window launched by this process.')
            [CompletionResult]::new('--domain', 'domain', [CompletionResultType]::ParameterName, 'Name of the multiplexer domain section from the configuration to which you''d like to connect. If omitted, the default domain will be used')
            [CompletionResult]::new('--no-auto-connect', 'no-auto-connect', [CompletionResultType]::ParameterName, 'If true, do not connect to domains marked as connect_automatically in your wezterm configuration file')
            [CompletionResult]::new('--always-new-process', 'always-new-process', [CompletionResultType]::ParameterName, 'If enabled, don''t try to ask an existing wezterm GUI instance to start the command.  Instead, always start the GUI in this invocation of wezterm so that you can wait for the command to complete by waiting for this wezterm process to finish')
            [CompletionResult]::new('-e', 'e', [CompletionResultType]::ParameterName, 'Dummy argument that consumes "-e" and does nothing. This is meant as a compatibility layer for supporting the widely adopted standard of passing the command to execute to the terminal via a "-e" option. This works because we then treat the remaining cmdline as trailing options, that will automatically be parsed via the existing "prog" option. This option exists only as a fallback. It is recommended to pass the command as a normal trailing command instead if possible')
            [CompletionResult]::new('--attach', 'attach', [CompletionResultType]::ParameterName, 'When used with --domain, if the domain already has running panes, wezterm will simply attach and will NOT spawn the specified PROG. If you omit --attach when using --domain, wezterm will attach AND then spawn PROG')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;ssh' {
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Override specific SSH configuration options. `wezterm ssh` is able to parse some (but not all!) options from your `~/.ssh/config` and `/etc/ssh/ssh_config` files. This command line switch allows you to override or otherwise specify ssh_config style options')
            [CompletionResult]::new('--ssh-option', 'ssh-option', [CompletionResultType]::ParameterName, 'Override specific SSH configuration options. `wezterm ssh` is able to parse some (but not all!) options from your `~/.ssh/config` and `/etc/ssh/ssh_config` files. This command line switch allows you to override or otherwise specify ssh_config style options')
            [CompletionResult]::new('--class', 'class', [CompletionResultType]::ParameterName, 'Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs')
            [CompletionResult]::new('--position', 'position', [CompletionResultType]::ParameterName, 'Override the position for the initial window launched by this process.')
            [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Enable verbose ssh protocol tracing. The trace information is printed to the stderr stream of the process')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;serial' {
            [CompletionResult]::new('--baud', 'baud', [CompletionResultType]::ParameterName, 'Set the baud rate.  The default is 9600 baud')
            [CompletionResult]::new('--class', 'class', [CompletionResultType]::ParameterName, 'Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs')
            [CompletionResult]::new('--position', 'position', [CompletionResultType]::ParameterName, 'Override the position for the initial window launched by this process.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;connect' {
            [CompletionResult]::new('--class', 'class', [CompletionResultType]::ParameterName, 'Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs')
            [CompletionResult]::new('--workspace', 'workspace', [CompletionResultType]::ParameterName, 'Override the default workspace with the provided name. The default is "default"')
            [CompletionResult]::new('--position', 'position', [CompletionResultType]::ParameterName, 'Override the position for the initial window launched by this process.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;ls-fonts' {
            [CompletionResult]::new('--text', 'text', [CompletionResultType]::ParameterName, 'Explain which fonts are used to render the supplied text string')
            [CompletionResult]::new('--codepoints', 'codepoints', [CompletionResultType]::ParameterName, 'Explain which fonts are used to render the specified unicode code point sequence. Code points are comma separated hex values')
            [CompletionResult]::new('--list-system', 'list-system', [CompletionResultType]::ParameterName, 'Whether to list all fonts available to the system')
            [CompletionResult]::new('--rasterize-ascii', 'rasterize-ascii', [CompletionResultType]::ParameterName, 'Show rasterized glyphs for the text in --text or --codepoints using ascii blocks')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;show-keys' {
            [CompletionResult]::new('--key-table', 'key-table', [CompletionResultType]::ParameterName, 'In lua mode, show only the named key table')
            [CompletionResult]::new('--lua', 'lua', [CompletionResultType]::ParameterName, 'Show the keys as lua config statements')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli' {
            [CompletionResult]::new('--class', 'class', [CompletionResultType]::ParameterName, 'When connecting to a gui instance, if you started the gui with `--class SOMETHING`, you should also pass that same value here in order for the client to find the correct gui instance')
            [CompletionResult]::new('--no-auto-start', 'no-auto-start', [CompletionResultType]::ParameterName, 'Don''t automatically start the server')
            [CompletionResult]::new('--prefer-mux', 'prefer-mux', [CompletionResultType]::ParameterName, 'Prefer connecting to a background mux server. The default is to prefer connecting to a running wezterm gui instance')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list windows, tabs and panes')
            [CompletionResult]::new('list-clients', 'list-clients', [CompletionResultType]::ParameterValue, 'list clients')
            [CompletionResult]::new('proxy', 'proxy', [CompletionResultType]::ParameterValue, 'start rpc proxy pipe')
            [CompletionResult]::new('tlscreds', 'tlscreds', [CompletionResultType]::ParameterValue, 'obtain tls credentials')
            [CompletionResult]::new('move-pane-to-new-tab', 'move-pane-to-new-tab', [CompletionResultType]::ParameterValue, 'Move a pane into a new tab')
            [CompletionResult]::new('split-pane', 'split-pane', [CompletionResultType]::ParameterValue, 'split the current pane.
Outputs the pane-id for the newly created pane on success')
            [CompletionResult]::new('spawn', 'spawn', [CompletionResultType]::ParameterValue, 'Spawn a command into a new window or tab
Outputs the pane-id for the newly created pane on success')
            [CompletionResult]::new('send-text', 'send-text', [CompletionResultType]::ParameterValue, 'Send text to a pane as though it were pasted. If bracketed paste mode is enabled in the pane, then the text will be sent as a bracketed paste')
            [CompletionResult]::new('get-text', 'get-text', [CompletionResultType]::ParameterValue, 'Retrieves the textual content of a pane and output it to stdout')
            [CompletionResult]::new('activate-pane-direction', 'activate-pane-direction', [CompletionResultType]::ParameterValue, 'Activate an adjacent pane in the specified direction')
            [CompletionResult]::new('kill-pane', 'kill-pane', [CompletionResultType]::ParameterValue, 'Kill a pane')
            [CompletionResult]::new('activate-pane', 'activate-pane', [CompletionResultType]::ParameterValue, 'Activate (focus) a pane')
            [CompletionResult]::new('activate-tab', 'activate-tab', [CompletionResultType]::ParameterValue, 'Activate a tab')
            [CompletionResult]::new('set-tab-title', 'set-tab-title', [CompletionResultType]::ParameterValue, 'Change the title of a tab')
            [CompletionResult]::new('set-window-title', 'set-window-title', [CompletionResultType]::ParameterValue, 'Change the title of a window')
            [CompletionResult]::new('rename-workspace', 'rename-workspace', [CompletionResultType]::ParameterValue, 'Rename a workspace')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'wezterm;cli;list' {
            [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Controls the output format. "table" and "json" are possible formats')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;list-clients' {
            [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Controls the output format. "table" and "json" are possible formats')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;proxy' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;tlscreds' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;move-pane-to-new-tab' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the pane that should be moved. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('--window-id', 'window-id', [CompletionResultType]::ParameterName, 'Specify the window into which the new tab will be created. If omitted, the window associated with the current pane is used')
            [CompletionResult]::new('--workspace', 'workspace', [CompletionResultType]::ParameterName, 'If creating a new window, override the default workspace name with the provided name.  The default name is "default"')
            [CompletionResult]::new('--new-window', 'new-window', [CompletionResultType]::ParameterName, 'Create tab in a new window, rather than the window currently containing the pane')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;split-pane' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the pane that should be split. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('--cells', 'cells', [CompletionResultType]::ParameterName, 'The number of cells that the new split should have. If omitted, 50% of the available space is used')
            [CompletionResult]::new('--percent', 'percent', [CompletionResultType]::ParameterName, 'Specify the number of cells that the new split should have, expressed as a percentage of the available space')
            [CompletionResult]::new('--cwd', 'cwd', [CompletionResultType]::ParameterName, 'Specify the current working directory for the initially spawned program')
            [CompletionResult]::new('--move-pane-id', 'move-pane-id', [CompletionResultType]::ParameterName, 'Instead of spawning a new command, move the specified pane into the newly created split')
            [CompletionResult]::new('--horizontal', 'horizontal', [CompletionResultType]::ParameterName, 'Equivalent to `--right`. If neither this nor any other direction is specified, the default is equivalent to `--bottom`')
            [CompletionResult]::new('--left', 'left', [CompletionResultType]::ParameterName, 'Split horizontally, with the new pane on the left')
            [CompletionResult]::new('--right', 'right', [CompletionResultType]::ParameterName, 'Split horizontally, with the new pane on the right')
            [CompletionResult]::new('--top', 'top', [CompletionResultType]::ParameterName, 'Split vertically, with the new pane on the top')
            [CompletionResult]::new('--bottom', 'bottom', [CompletionResultType]::ParameterName, 'Split vertically, with the new pane on the bottom')
            [CompletionResult]::new('--top-level', 'top-level', [CompletionResultType]::ParameterName, 'Rather than splitting the active pane, split the entire window')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;spawn' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE. The pane is used to determine the current domain and window')
            [CompletionResult]::new('--domain-name', 'domain-name', [CompletionResultType]::ParameterName, 'domain-name')
            [CompletionResult]::new('--window-id', 'window-id', [CompletionResultType]::ParameterName, 'Specify the window into which to spawn a tab. If omitted, the window associated with the current pane is used. Cannot be used with `--workspace` or `--new-window`')
            [CompletionResult]::new('--cwd', 'cwd', [CompletionResultType]::ParameterName, 'Specify the current working directory for the initially spawned program')
            [CompletionResult]::new('--workspace', 'workspace', [CompletionResultType]::ParameterName, 'When creating a new window, override the default workspace name with the provided name.  The default name is "default". Requires `--new-window`')
            [CompletionResult]::new('--new-window', 'new-window', [CompletionResultType]::ParameterName, 'Spawn into a new window, rather than a new tab')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;send-text' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('--no-paste', 'no-paste', [CompletionResultType]::ParameterName, 'Send the text directly, rather than as a bracketed paste')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;get-text' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('--start-line', 'start-line', [CompletionResultType]::ParameterName, 'The starting line number. 0 is the first line of terminal screen. Negative numbers proceed backwards into the scrollback. The default value is unspecified is 0, the first line of the terminal screen')
            [CompletionResult]::new('--end-line', 'end-line', [CompletionResultType]::ParameterName, 'The ending line number. 0 is the first line of terminal screen. Negative numbers proceed backwards into the scrollback. The default value if unspecified is the bottom of the the terminal screen')
            [CompletionResult]::new('--escapes', 'escapes', [CompletionResultType]::ParameterName, 'Include escape sequences that color and style the text. If omitted, unattributed text will be returned')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;activate-pane-direction' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;kill-pane' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;activate-pane' {
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;cli;activate-tab' {
            [CompletionResult]::new('--tab-id', 'tab-id', [CompletionResultType]::ParameterName, 'Specify the target tab by its id')
            [CompletionResult]::new('--tab-index', 'tab-index', [CompletionResultType]::ParameterName, 'Specify the target tab by its index within the window that holds the current pane. Indices are 0-based, with 0 being the left-most tab. Negative numbers can be used to reference the right-most tab, so -1 is the right-most tab, -2 is the penultimate tab and so on')
            [CompletionResult]::new('--tab-relative', 'tab-relative', [CompletionResultType]::ParameterName, 'Specify the target tab by its relative offset. -1 selects the tab to the left. -2 two tabs to the left. 1 is one tab to the right and so on')
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('--no-wrap', 'no-wrap', [CompletionResultType]::ParameterName, 'When used with tab-relative, prevents wrapping around and will instead clamp to the left-most when moving left or right-most when moving right')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;cli;set-tab-title' {
            [CompletionResult]::new('--tab-id', 'tab-id', [CompletionResultType]::ParameterName, 'Specify the target tab by its id')
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;cli;set-window-title' {
            [CompletionResult]::new('--window-id', 'window-id', [CompletionResultType]::ParameterName, 'Specify the target window by its id')
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;cli;rename-workspace' {
            [CompletionResult]::new('--workspace', 'workspace', [CompletionResultType]::ParameterName, 'Specify the workspace to rename')
            [CompletionResult]::new('--pane-id', 'pane-id', [CompletionResultType]::ParameterName, 'Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'wezterm;cli;help' {
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list windows, tabs and panes')
            [CompletionResult]::new('list-clients', 'list-clients', [CompletionResultType]::ParameterValue, 'list clients')
            [CompletionResult]::new('proxy', 'proxy', [CompletionResultType]::ParameterValue, 'start rpc proxy pipe')
            [CompletionResult]::new('tlscreds', 'tlscreds', [CompletionResultType]::ParameterValue, 'obtain tls credentials')
            [CompletionResult]::new('move-pane-to-new-tab', 'move-pane-to-new-tab', [CompletionResultType]::ParameterValue, 'Move a pane into a new tab')
            [CompletionResult]::new('split-pane', 'split-pane', [CompletionResultType]::ParameterValue, 'split the current pane.
Outputs the pane-id for the newly created pane on success')
            [CompletionResult]::new('spawn', 'spawn', [CompletionResultType]::ParameterValue, 'Spawn a command into a new window or tab
Outputs the pane-id for the newly created pane on success')
            [CompletionResult]::new('send-text', 'send-text', [CompletionResultType]::ParameterValue, 'Send text to a pane as though it were pasted. If bracketed paste mode is enabled in the pane, then the text will be sent as a bracketed paste')
            [CompletionResult]::new('get-text', 'get-text', [CompletionResultType]::ParameterValue, 'Retrieves the textual content of a pane and output it to stdout')
            [CompletionResult]::new('activate-pane-direction', 'activate-pane-direction', [CompletionResultType]::ParameterValue, 'Activate an adjacent pane in the specified direction')
            [CompletionResult]::new('kill-pane', 'kill-pane', [CompletionResultType]::ParameterValue, 'Kill a pane')
            [CompletionResult]::new('activate-pane', 'activate-pane', [CompletionResultType]::ParameterValue, 'Activate (focus) a pane')
            [CompletionResult]::new('activate-tab', 'activate-tab', [CompletionResultType]::ParameterValue, 'Activate a tab')
            [CompletionResult]::new('set-tab-title', 'set-tab-title', [CompletionResultType]::ParameterValue, 'Change the title of a tab')
            [CompletionResult]::new('set-window-title', 'set-window-title', [CompletionResultType]::ParameterValue, 'Change the title of a window')
            [CompletionResult]::new('rename-workspace', 'rename-workspace', [CompletionResultType]::ParameterValue, 'Rename a workspace')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'wezterm;cli;help;list' {
            break
        }
        'wezterm;cli;help;list-clients' {
            break
        }
        'wezterm;cli;help;proxy' {
            break
        }
        'wezterm;cli;help;tlscreds' {
            break
        }
        'wezterm;cli;help;move-pane-to-new-tab' {
            break
        }
        'wezterm;cli;help;split-pane' {
            break
        }
        'wezterm;cli;help;spawn' {
            break
        }
        'wezterm;cli;help;send-text' {
            break
        }
        'wezterm;cli;help;get-text' {
            break
        }
        'wezterm;cli;help;activate-pane-direction' {
            break
        }
        'wezterm;cli;help;kill-pane' {
            break
        }
        'wezterm;cli;help;activate-pane' {
            break
        }
        'wezterm;cli;help;activate-tab' {
            break
        }
        'wezterm;cli;help;set-tab-title' {
            break
        }
        'wezterm;cli;help;set-window-title' {
            break
        }
        'wezterm;cli;help;rename-workspace' {
            break
        }
        'wezterm;cli;help;help' {
            break
        }
        'wezterm;imgcat' {
            [CompletionResult]::new('--width', 'width', [CompletionResultType]::ParameterName, 'Specify the display width; defaults to "auto" which automatically selects an appropriate size.  You may also use an integer value `N` to specify the number of cells, or `Npx` to specify the number of pixels, or `N%` to size relative to the terminal width')
            [CompletionResult]::new('--height', 'height', [CompletionResultType]::ParameterName, 'Specify the display height; defaults to "auto" which automatically selects an appropriate size.  You may also use an integer value `N` to specify the number of cells, or `Npx` to specify the number of pixels, or `N%` to size relative to the terminal height')
            [CompletionResult]::new('--no-preserve-aspect-ratio', 'no-preserve-aspect-ratio', [CompletionResultType]::ParameterName, 'Do not respect the aspect ratio.  The default is to respect the aspect ratio')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;set-working-directory' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;record' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;replay' {
            [CompletionResult]::new('--explain', 'explain', [CompletionResultType]::ParameterName, 'Explain what is being sent/received')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;shell-completion' {
            [CompletionResult]::new('--shell', 'shell', [CompletionResultType]::ParameterName, 'Which shell to generate for')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'wezterm;help' {
            [CompletionResult]::new('start', 'start', [CompletionResultType]::ParameterValue, 'Start the GUI, optionally running an alternative program')
            [CompletionResult]::new('ssh', 'ssh', [CompletionResultType]::ParameterValue, 'Establish an ssh session')
            [CompletionResult]::new('serial', 'serial', [CompletionResultType]::ParameterValue, 'Open a serial port')
            [CompletionResult]::new('connect', 'connect', [CompletionResultType]::ParameterValue, 'Connect to wezterm multiplexer')
            [CompletionResult]::new('ls-fonts', 'ls-fonts', [CompletionResultType]::ParameterValue, 'Display information about fonts')
            [CompletionResult]::new('show-keys', 'show-keys', [CompletionResultType]::ParameterValue, 'Show key assignments')
            [CompletionResult]::new('cli', 'cli', [CompletionResultType]::ParameterValue, 'Interact with experimental mux server')
            [CompletionResult]::new('imgcat', 'imgcat', [CompletionResultType]::ParameterValue, 'Output an image to the terminal')
            [CompletionResult]::new('set-working-directory', 'set-working-directory', [CompletionResultType]::ParameterValue, 'Advise the terminal of the current working directory by emitting an OSC 7 escape sequence')
            [CompletionResult]::new('record', 'record', [CompletionResultType]::ParameterValue, 'Record a terminal session as an asciicast')
            [CompletionResult]::new('replay', 'replay', [CompletionResultType]::ParameterValue, 'Replay an asciicast terminal session')
            [CompletionResult]::new('shell-completion', 'shell-completion', [CompletionResultType]::ParameterValue, 'Generate shell completion information')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'wezterm;help;start' {
            break
        }
        'wezterm;help;ssh' {
            break
        }
        'wezterm;help;serial' {
            break
        }
        'wezterm;help;connect' {
            break
        }
        'wezterm;help;ls-fonts' {
            break
        }
        'wezterm;help;show-keys' {
            break
        }
        'wezterm;help;cli' {
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list windows, tabs and panes')
            [CompletionResult]::new('list-clients', 'list-clients', [CompletionResultType]::ParameterValue, 'list clients')
            [CompletionResult]::new('proxy', 'proxy', [CompletionResultType]::ParameterValue, 'start rpc proxy pipe')
            [CompletionResult]::new('tlscreds', 'tlscreds', [CompletionResultType]::ParameterValue, 'obtain tls credentials')
            [CompletionResult]::new('move-pane-to-new-tab', 'move-pane-to-new-tab', [CompletionResultType]::ParameterValue, 'Move a pane into a new tab')
            [CompletionResult]::new('split-pane', 'split-pane', [CompletionResultType]::ParameterValue, 'split the current pane.
Outputs the pane-id for the newly created pane on success')
            [CompletionResult]::new('spawn', 'spawn', [CompletionResultType]::ParameterValue, 'Spawn a command into a new window or tab
Outputs the pane-id for the newly created pane on success')
            [CompletionResult]::new('send-text', 'send-text', [CompletionResultType]::ParameterValue, 'Send text to a pane as though it were pasted. If bracketed paste mode is enabled in the pane, then the text will be sent as a bracketed paste')
            [CompletionResult]::new('get-text', 'get-text', [CompletionResultType]::ParameterValue, 'Retrieves the textual content of a pane and output it to stdout')
            [CompletionResult]::new('activate-pane-direction', 'activate-pane-direction', [CompletionResultType]::ParameterValue, 'Activate an adjacent pane in the specified direction')
            [CompletionResult]::new('kill-pane', 'kill-pane', [CompletionResultType]::ParameterValue, 'Kill a pane')
            [CompletionResult]::new('activate-pane', 'activate-pane', [CompletionResultType]::ParameterValue, 'Activate (focus) a pane')
            [CompletionResult]::new('activate-tab', 'activate-tab', [CompletionResultType]::ParameterValue, 'Activate a tab')
            [CompletionResult]::new('set-tab-title', 'set-tab-title', [CompletionResultType]::ParameterValue, 'Change the title of a tab')
            [CompletionResult]::new('set-window-title', 'set-window-title', [CompletionResultType]::ParameterValue, 'Change the title of a window')
            [CompletionResult]::new('rename-workspace', 'rename-workspace', [CompletionResultType]::ParameterValue, 'Rename a workspace')
            break
        }
        'wezterm;help;cli;list' {
            break
        }
        'wezterm;help;cli;list-clients' {
            break
        }
        'wezterm;help;cli;proxy' {
            break
        }
        'wezterm;help;cli;tlscreds' {
            break
        }
        'wezterm;help;cli;move-pane-to-new-tab' {
            break
        }
        'wezterm;help;cli;split-pane' {
            break
        }
        'wezterm;help;cli;spawn' {
            break
        }
        'wezterm;help;cli;send-text' {
            break
        }
        'wezterm;help;cli;get-text' {
            break
        }
        'wezterm;help;cli;activate-pane-direction' {
            break
        }
        'wezterm;help;cli;kill-pane' {
            break
        }
        'wezterm;help;cli;activate-pane' {
            break
        }
        'wezterm;help;cli;activate-tab' {
            break
        }
        'wezterm;help;cli;set-tab-title' {
            break
        }
        'wezterm;help;cli;set-window-title' {
            break
        }
        'wezterm;help;cli;rename-workspace' {
            break
        }
        'wezterm;help;imgcat' {
            break
        }
        'wezterm;help;set-working-directory' {
            break
        }
        'wezterm;help;record' {
            break
        }
        'wezterm;help;replay' {
            break
        }
        'wezterm;help;shell-completion' {
            break
        }
        'wezterm;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
# wezterm shell-completion --shell power-shell Results end.

# posh-git setup
$PoshGitPath = "C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1"
if (Test-Path($PoshGitPath)) {
    Import-Module "$PoshGitPath"
}
else {
    Import-Module posh-git
}

# PSGhq setup
$PSGhqPath = "$env:GHQ_ROOT\github.com\mimikun\PSGhq\Set-GhqLocation.ps1"
if (Test-Path($PSGhqPath)) {
    . $PSGhqPath
    Set-Alias -Name gcd -Value Set-GhqLocation
}

# update_cargo_package setup
$UpdateCargoPackagePath = "$env:GHQ_ROOT\github.com\mimikun\update_cargo_packages\Invoke-UpdateCargoPackage.ps1"
if (Test-Path($UpdateCargoPackagePath)) {
    . $UpdateCargoPackagePath
    Set-Alias -Name update_cargo_package -Value Invoke-UpdateCargoPackage
}

# pueue_update_cargo_package setup
$PueueUpdateCargoPackagePath = "$env:GHQ_ROOT\github.com\mimikun\update_cargo_packages\Invoke-PueueUpdateCargoPackage.ps1"
if (Test-Path($PueueUpdateCargoPackagePath)) {
    . $PueueUpdateCargoPackagePath
    Set-Alias -Name pueue_update_cargo_package -Value Invoke-PueueUpdateCargoPackage
}

# vup setup
$VupPath = "$env:GHQ_ROOT\github.com\mimikun\vup\Invoke-Vup.ps1"
if (Test-Path($VupPath)) {
    . $VupPath
    Set-Alias -Name vup -Value Invoke-Vup
}

# vupueue setup
$VupueuePath = "$env:GHQ_ROOT\github.com\mimikun\vup\Invoke-Vupueue.ps1"
if (Test-Path($VupueuePath)) {
    . $VupueuePath
    Set-Alias -Name vupueue -Value Invoke-Vupueue
}

# neovim setup
$NeovimDirectory = Join-Path $env:USERPROFILE -ChildPath AppData\Local\nvim
if (Test-Path($NeovimDirectory)) {
    Set-Alias -Name vim -Value nvim
}

