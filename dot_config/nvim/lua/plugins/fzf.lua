return {
    "ibhagwan/fzf-lua",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    --[[keys = {
        { "<C-p>", ":call FzfOmniFiles()<CR>", desc = "Open file search" },
        { "<C-g>", ":Rg<CR>", desc = "Open string search" },
    },]]
    config = function()
        require("fzf-lua").setup({})
    end,
    cond = false,
}
