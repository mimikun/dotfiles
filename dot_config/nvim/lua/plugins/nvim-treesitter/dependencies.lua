---@type LazySpec[]
local dependencies = {
    "windwp/nvim-ts-autotag",
    "RRethy/nvim-treesitter-textsubjects",
    "nvim-treesitter/nvim-treesitter-context",
    "JoosepAlviste/nvim-ts-context-commentstring",
    {
        "bezhermoso/tree-sitter-ghostty",
        build = "make nvim_install",
    },
}

return dependencies
