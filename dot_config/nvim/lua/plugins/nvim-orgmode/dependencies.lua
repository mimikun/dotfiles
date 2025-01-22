---@type LazySpec[]
local dependencies = {
    "nvim-orgmode/org-bullets.nvim",
    "danilshvalov/org-modern.nvim",
    "chipsenkbeil/org-mouse.nvim",
    {
        "hamidi-dev/org-list.nvim",
        dependencies = {
            "tpope/vim-repeat",
        },
    },
}

return dependencies
