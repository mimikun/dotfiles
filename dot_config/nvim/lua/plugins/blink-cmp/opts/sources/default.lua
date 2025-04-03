local settings = require("config.settings")

---@type table
local default = {
    "lazydev",
    "lsp",
    "snippets",
    "buffer",
    "ripgrep", -- 👈🏻 add "ripgrep" here
    "path",
    -- NOTE: No need to setting it now
    -- markdown_oxide
    "emoji",
    -- NOTE: No need to setting it now
    -- crates
    -- NOTE: Not supported. use blink-compat
    -- cmp_yanky
    "ecolog",
    "nerdfont",
    -- XXX: AI solutions
    --"minuet",
}

if settings.use_github_copilot then
    table.insert(default, { "copilot" })
end

if settings.use_avante then
    table.insert(default, { "avante" })
end

return default
