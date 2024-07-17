---@type LazySpec
local spec = {
    "kylechui/nvim-surround",
    version = "*",
    --lazy = false,
    event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        require("nvim-surround").setup({})
    end,
    --cond = false,
}

return spec
