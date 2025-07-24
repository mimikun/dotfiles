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
    "ecolog",
    "nerdfont",
    "spell",
    "yank",
    -- NOTE: blink-compat sources
}

if settings.use_github_copilot then
    table.insert(default, "copilot")
end

if settings.use_avante then
    table.insert(default, "avante")
end

return default
