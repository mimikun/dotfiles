---@type table
local docusaurus = {
    strategy = "chat",
    description = "Write documentation for me",
    opts = {
        index = 11,
        is_slash_cmd = false,
        auto_submit = false,
        short_name = "docs",
    },
    references = {
        {
            type = "file",
            path = {
                "doc/.vitepress/config.mjs",
                "lua/codecompanion/config.lua",
                "README.md",
            },
        },
    },
    prompts = {
        {
            role = "user",
            content = [[I'm rewriting the documentation for my plugin CodeCompanion.nvim, as I'm moving to a vitepress website. Can you help me rewrite it?
    
    I'm sharing my vitepress config file so you have the context of how the documentation website is structured in the `sidebar` section of that file.
    
    I'm also sharing my `config.lua` file which I'm mapping to the `configuration` section of the sidebar.
    ]],
        },
    },
}

return docusaurus
