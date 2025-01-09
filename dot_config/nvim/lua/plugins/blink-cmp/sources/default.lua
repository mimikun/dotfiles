local s = require("config.settings")

---@type table
local default = {
    "obsidian",
    "obsidian_new",
    "obsidian_tags",
    "lazydev",
    -- TODO: Support markdown_oxide cmp
    "lsp",
    "path",
    "snippets",
    "buffer",
    "ripgrep",
    "emoji",
    "crates",
    "ecolog",
    "render_markdown",
}

if s.use_github_copilot then
    table.insert(default, { "copilot" })
end

if s.use_codecompanion then
    table.insert(default, { "codecompanion" })
end

if s.use_avante then
    table.insert(default, { "avante_commands" })
    table.insert(default, { "avante_mentions" })
    table.insert(default, { "avante_files" })
end

return default
