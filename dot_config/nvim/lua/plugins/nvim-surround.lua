return {
    "kylechui/nvim-surround",
    version = "*",
    --lazy = false,
    event = "VeryLazy",
    dependencies = {
        "roobert/surround-ui.nvim",
        "folke/which-key.nvim",
    },
    config = function()
        -- TODO: setting
        -- https://github.com/kylechui/nvim-surround/blob/main/README.md
        local surround = require("nvim-surround")
        local surround_ui = require("surround-ui")

        surround.setup({})
        surround_ui.setup({
            root_key = "S",
        })
    end,
    -- TODO: enable
    cond = false,
}
