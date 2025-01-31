---@type LazySpec[]
local dependencies = {
    "windwp/nvim-ts-autotag",
    "RRethy/nvim-treesitter-textsubjects",
    "nvim-treesitter/nvim-treesitter-context",
    "JoosepAlviste/nvim-ts-context-commentstring",
}

if require("config.global").is_linux then
    table.insert(dependencies, {
        {
            "bezhermoso/tree-sitter-ghostty",
            build = "make nvim_install",
        },
    })
end

return dependencies
