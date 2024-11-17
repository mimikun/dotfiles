---@type table
local need_parsers = {
    "c",
    "lua",
    "markdown",
    "markdown_inline",
    "query",
    "vim",
    "vimdoc",
}

---@type table
local base_parsers = {
    "bash",
    "cmake",
    "cpp",
    "c_sharp",
    "css",
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
    "json",
    "json5",
    "jsonc",
    "latex",
    "lua",
    "luadoc",
    "luap",
    "luau",
    "make",
    "markdown",
    "markdown_inline",
    "powershell",
    "python",
    "regex",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "xml",
    "yaml",
}

---@type table
local addisional_parsers = {
    linux_only = {
        "ocaml",
        "ocaml_interface",
    },
    others = {
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
        "jsdoc",
        "just",
        "kdl",
        "ninja",
        "nix",
        "ron",
        "rst",
        "ruby",
        "scala",
        "scss",
        "sql",
        "svelte",
        "swift",
        "vhs",
        "zig",
    },
}

need_parsers = vim.list_extend(need_parsers, base_parsers)

if require("config.global").is_linux then
    need_parsers = vim.list_extend(need_parsers, addisional_parsers.linux_only)
end

-- sort list
table.sort(need_parsers)

return need_parsers
