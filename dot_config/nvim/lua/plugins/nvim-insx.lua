---@type LazySpec
local spec = {
    "hrsh7th/nvim-insx",
    lazy = false,
    config = function()
        require("insx.preset.standard").setup({})
    end,
    --cond = false,
}

return spec
