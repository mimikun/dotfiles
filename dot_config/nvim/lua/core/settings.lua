local settings = {}

-- Set it to false if you don't use copilot
---@type boolean
settings["use_copilot"] = false

-- Required coc extensions
---@type table
settings["coc_extensions"] = {
    "coc-css",
    "coc-deepl",
    "coc-deno",
    "coc-eslint",
    "coc-explorer",
    "coc-git",
    "coc-highlight",
    "coc-html",
    "coc-html-css-support",
    "coc-jest",
    "coc-json",
    "coc-lists",
    "coc-lua",
    "coc-marketplace",
    "coc-pairs",
    "@raidou/coc-prettier-v3",
    "coc-pyright",
    "coc-rust-analyzer",
    "coc-snippets",
    "coc-solargraph",
    "coc-toml",
    "coc-tsserver",
    "coc-yaml",
    "@yaegassy/coc-black-formatter",
    "@yaegassy/coc-mypy",
    "@yaegassy/coc-nginx",
    "coc-zig",
}

return settings
