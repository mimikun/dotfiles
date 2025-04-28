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
    { name = "crates" },
    { name = "cmp_yanky" },
    { name = "ecolog" },
    { name = "orgmode" },
    { name = "tmux" },
    --{ name = "minuet" },
    --{ name = "papis" },
    { name = "lorem_ipsum" },
    { name = "go_deep" },
}

if require("config.settings").use_github_copilot then
    table.insert(cmp_config_sources, { name = "copilot" })
end

return cmp_config_sources
