---@type table
local cmp_config_sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "lazydev" },
    {
        name = "nvim_lsp",
        option = {
            markdown_oxide = {
                keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
            },
        },
    },
    { name = "emoji" },
    { name = "orgmode" },
    { name = "dotenv" },
    { name = "crates" },
}

if require("config.settings").use_github_copilot then
    table.insert(cmp_config_sources, { name = "copilot" })
end

return cmp_config_sources
