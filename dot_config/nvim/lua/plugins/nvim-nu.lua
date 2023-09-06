return {
    -- TODO: setup
    -- https://github.com/LhKipp/nvim-nu
    "LhKipp/nvim-nu",
    build = ":TSInstall nu",
    --lazy = false,
    event = "VeryLazy",
    ft = {
        "nu",
    },
    config = function()
        require("nu").setup({})
    end,
    cond = false,
}
