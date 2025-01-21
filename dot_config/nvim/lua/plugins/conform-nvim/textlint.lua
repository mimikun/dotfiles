local util = require("conform.util")

---@type string
local binary_name = "textlint"

---@type table
local root_files = {
    "package.json",
    ".textlintrc",
    ".textlintrc.js",
    ".textlintrc.json",
    ".textlintrc.yml",
    ".textlintrc.yaml",
}

---@type table
local args = {
    "--fix",
    "--stdin",
    "--stdin-filename",
    "$FILENAME",
    "--format",
    "fixed-result",
    "--dry-run",
}

---@type conform.FileFormatterConfig
local textlint_config = {
    meta = {
        url = "https://github.com/textlint/textlint",
        description = [[The pluggable natural language linter for text and markdown.]],
    },
    command = util.from_node_modules(require("conform.fs").is_windows and binary_name .. ".cmd" or binary_name),
    stdin = true,
    args = args,
    cwd = util.root_file(root_files),
}

return textlint_config
