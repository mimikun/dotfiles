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
    -- NOTE: No need to setting it now
    -- markdown_oxide
    "emoji",
    -- NOTE: No need to setting it now
    -- crates
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

local use_minuet = false
if use_minuet then
    table.insert(default, { "minuet" })
end

if settings.use_github_copilot then
    table.insert(default, { "copilot" })
end

if settings.use_avante then
    table.insert(default, { "avante" })
end

return default
