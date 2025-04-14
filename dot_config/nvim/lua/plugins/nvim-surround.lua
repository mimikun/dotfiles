---@type LazySpec[]
local dependencies = {
    "roobert/surround-ui.nvim",
    "folke/which-key.nvim",
}

---@type LazySpec
local spec = {
    "kylechui/nvim-surround",
    --lazy = false,
    event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        require("nvim-surround").setup({})
        require("surround-ui").setup({
            root_key = "S",
        })
    end,
    cond = false,
    enabled = false,
}

return spec
