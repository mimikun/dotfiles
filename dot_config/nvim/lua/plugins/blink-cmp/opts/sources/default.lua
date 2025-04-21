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
    "nerdfont",
    "spell",
    -- WARN: can't use
    --"css-vars",
    --"pandoc-references",
    --"env",
    -- NOTE: blink-compat sources
    "cmp_yanky",
    "lorem_ipsum",
    -- WARN: can't use
    --"html-css",
}

if settings.use_minuet then
    table.insert(default, "minuet")
end

if settings.use_github_copilot then
    table.insert(default, "copilot")
end

if settings.use_avante then
    table.insert(default, "avante")
end

return default
