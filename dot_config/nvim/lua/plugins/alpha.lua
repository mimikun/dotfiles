return {
    "goolord/alpha-nvim",
    lazy = false,
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("alpha").setup(require("alpha.themes.dashboard").config)
    end,
    --cond = false,
}
