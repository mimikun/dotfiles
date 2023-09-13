return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Neotree",
    keys = {
        { "<C-n>", ":Neotree . reveal toggle<CR>", desc = "Toggle Neotree" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set("n", "<C-n>", ":Neotree . reveal toggle<CR>")
    end,
    cond = false,
}
