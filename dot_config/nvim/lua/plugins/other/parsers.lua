local global = require("config.global")

local M = {}

---@type table
local need_parsers = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "djot",
    "dockerfile",
    "fish",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "graphql",
    "html",
    "ini",
    "java",
    "javascript",
    "jq",
    "jsdoc",
    "json",
    "jsonc",
    "json5",
    "kdl",
    "latex",
    "lua",
    "luadoc",
    "luap",
    "luau",
    "make",
    "markdown",
    "markdown_inline",
    "ninja",
    "nix",
    "python",
    "regex",
    "rst",
    "ruby",
    "rust",
    "scala",
    "scss",
    "sql",
    "svelte",
    "swift",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
    "zig",
}

-- Linux or WSL
if global.is_linux or global.is_wsl then
    table.insert(need_parsers, "ocaml")
    table.insert(need_parsers, "ocaml_interface")
end

---@type table
M.parsers = need_parsers

return M
