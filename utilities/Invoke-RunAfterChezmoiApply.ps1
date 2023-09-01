# Run after chezmoi apply
$home_only_file =@(
    '$env:USERPROFILE\utilities\GamingMode.bat'
    '$env:USERPROFILE\utilities\Mining.bat'
    '$env:USERPROFILE\utilities\MiningMode.bat'
    '$env:USERPROFILE\utilities\StopTrex.bat'
    '$env:USERPROFILE\utilities\StopTrex.ps1'
    '$env:USERPROFILE\utilities\dual-gminer-mining.bat'
    '$env:USERPROFILE\utilities\gminer-flux-mining.bat'
    '$env:USERPROFILE\utilities\gminer-mining.bat'
    '$env:USERPROFILE\utilities\lolminer-mining.bat'
    '$env:USERPROFILE\utilities\miniz-flux-mining.bat'
    '$env:USERPROFILE\utilities\t-rex-mining.bat'
)

function Invoke-RunAfterChezmoiApply() {
    if ($env:COMPUTERNAME -eq "TANAKAPC") {
        $home_only_file |
            ForEach-Object {
                if (Test-Path $_) {
                    Remove-Item $_
                }
            }
    }
}

Invoke-RunAfterChezmoiApply
