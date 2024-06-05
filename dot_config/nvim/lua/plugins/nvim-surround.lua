---@type table
local dependencies = {
    "roobert/surround-ui.nvim",
    "folke/which-key.nvim",
}

---@type LazySpec
local spec = {
    "kylechui/nvim-surround",
    version = "*",
    --lazy = false,
    event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        -- TODO: setting
        -- https://github.com/kylechui/nvim-surround/blob/main/README.md
        require("nvim-surround").setup({})
        require("surround-ui").setup({
            root_key = "S",
        })
    end,
    -- TODO: enable
    cond = false,
}

return spec
