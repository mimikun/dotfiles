---@type table
local parsers = {
    must = {
        "csv",
        "diff",
        "dockerfile",
        "editorconfig",
        "gitattributes",
        "gitcommit",
        "git_config",
        "gitignore",
        "git_rebase",
        "html",
        "ini",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "luadoc",
        "luap",
        "luau",
        "powershell",
        "rust",
        "templ",
        "toml",
        "yaml",
        "nu",
    },
    linux = {
        "bash",
        "fish",
        "make",
    },
}

return parsers
