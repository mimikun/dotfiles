---@type LazySpec
local spec = {
    "luukvbaal/statuscol.nvim",
    --lazy = false,
    config = function()
        require("statuscol").setup({})
    end,
    --cond = false,
}

return spec
