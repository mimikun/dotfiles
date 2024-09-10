---@type table
local need_parsers = {}

---@type table
local base_parsers = {
    "bash",
    "dockerfile",
    "fish",
    "gitattributes",
    "gitcommit",
    "git_config",
    "gitignore",
    "git_rebase",
    "html",
    "ini",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "lua",
    "luadoc",
    "luap",
    "luau",
    "make",
    "markdown",
    "markdown_inline",
    "nix",
    "powershell",
    "python",
    "regex",
    "rst",
    "ruby",
    "rust",
    "scss",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
}

---@type table
local linux_only_parsers = {
    "ocaml",
    "ocaml_interface",
}

---@type table
local addisional_parsers = {
    "c",
    "cmake",
    "cpp",
    "c_sharp",
    "css",
    "djot",
    "erlang",
    "gleam",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "graphql",
    "java",
    "jq",
    "just",
    "kdl",
    "latex",
    "ninja",
    "ron",
    "scala",
    "svelte",
    "swift",
    "vhs",
    "vue",
    "zig",
}

need_parsers = vim.list_extend(need_parsers, base_parsers)

if require("config.global").is_linux then
    need_parsers = vim.list_extend(need_parsers, linux_only_parsers)
end

if require("config.settings").need_all_parsers then
    need_parsers = vim.list_extend(need_parsers, addisional_parsers)
end

-- sort list
table.sort(need_parsers)

return need_parsers
