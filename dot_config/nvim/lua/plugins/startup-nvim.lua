return {
    "startup-nvim/startup.nvim",
    --lazy = false,
    --event = "VeryLazy",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("startup").setup({})
    end,
    cond = false,
}
