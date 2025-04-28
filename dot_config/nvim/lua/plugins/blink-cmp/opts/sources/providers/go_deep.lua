---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local go_deep = {
    name = "go_deep",
    module = "blink.compat.source",
    opts = {
        -- See below for configuration options
        -- Workspace symbol timeout in milliseconds
        workspace_symbol_timeout_ms = 2000,

        -- Timeout in milliseconds for getting documentation
        -- Note: Only used when `get_documentation_implementation` is not `"regex"`.
        documentation_wait_timeout_ms = 500,

        -- Whether to get documentation with lsp 'textDocument/hover', or extract it with regex
        -- options: "hover" | "regex"
        get_documentation_implementation = "hover",

        -- Whether to add import statement with 'gopls.add_import', or manually with the help of treesitter
        -- options: "gopls" | "treesitter"
        -- Note: The `gopls.add_import` command sometimes noops.
        add_import_statement_implementation = "treesitter",

        -- Whether to get package name with 'treesitter' or 'regex'
        -- Known issue: The `regex` implementation doesn't work for package names declared like: `/* hehe */ package xd`
        get_package_name_implementation = "regex",

        -- Whether to exclude vendored packages from completions
        -- Note: Enabling this option has a negligible effect on performance.
        exclude_vendored_packages = false,
    },
}

return go_deep
