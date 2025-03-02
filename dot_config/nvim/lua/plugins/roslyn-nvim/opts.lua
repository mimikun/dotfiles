---@type string
local stdpath_data = vim.fn.stdpath("data")

---@type table
local config = {
    handlers = require("rzls.roslyn_handlers"),
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,

            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
    },
}

---@type table
local args = {
    "--stdio",
    "--logLevel=Information",
    "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
    "--razorSourceGenerator=" .. vim.fs.joinpath(
        stdpath_data,
        "mason",
        "packages",
        "roslyn",
        "libexec",
        "Microsoft.CodeAnalysis.Razor.Compiler.dll"
    ),
    "--razorDesignTimePath=" .. vim.fs.joinpath(
        stdpath_data,
        "mason",
        "packages",
        "rzls",
        "libexec",
        "Targets",
        "Microsoft.NET.Sdk.Razor.DesignTime.targets"
    ),
}

-- TODO: it
local exe = {
    "dotnet",
    vim.fs.joinpath(stdpath_data, "roslyn", "Microsoft.CodeAnalysis.LanguageServer.dll"),
}

---@type table
local opts = {
    config = config,
    exe = exe,
    args = args,

    -- TODO: if human rights violation, set false
    filewatching = true,

    choose_target = function(target)
        target = nil
        return target
    end,

    ignore_target = function(target)
        target = nil
        return target
    end,

    broad_search = false,

    lock_target = false,
}

return opts
