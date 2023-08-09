return {
    "startup-nvim/startup.nvim",
    dependencies = {
        { "nvim-telescope/telescope.nvim" },
        { "nvim-lua/plenary.nvim" },
    },
    config = function()
        require("startup").setup({})
    end,
    cond = false,
}
