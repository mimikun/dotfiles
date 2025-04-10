local settings = require("config.settings")

---@type table
local default = {
    "git",
    "dictionary",
    "lazydev",
    "conventional_commits",
    "lsp",
    "snippets",
    "buffer",
    "ripgrep",
    "path",
    "emoji",
    "ecolog",
    --"env",
    "nerdfont",
    "spell",
    -- BUG: can't use
    --"css-vars",
    --"pandoc-references",
    -- NOTE: blink-compat sources
    "cmp_yanky",
    "html-css",
}

if settings.use_minuet then
    default = vim.tbl_extend("force", default, { "minuet" })
end

if settings.use_github_copilot then
    default = vim.tbl_extend("force", default, { "copilot" })
end

if settings.use_avante then
    default = vim.tbl_extend("force", default, { "avante" })
end

return default
