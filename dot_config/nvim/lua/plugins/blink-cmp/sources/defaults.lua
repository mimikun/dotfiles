---@type table
local sources = {
    "lsp",
    "luasnip",
    "buffer",
    "path",
    "lazydev",
    "ripgrep",
    "crates",
    "yanky",
    "ecolog",
    "emoji",
    "obsidian",
    "obsidian_new",
    "obsidian_tags",
}

if require("config.settings").use_github_copilot then
    table.insert(sources, { "copilot" })
    table.insert(sources, { "codecompanion" })
end

return sources
