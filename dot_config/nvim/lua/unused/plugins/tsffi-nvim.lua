---@type LazySpec
local spec = {
    "lewis6991/tsffi.nvim",
    --lazy = false,
    config = function()
        require("tsffi").setup()
    end,
    cond = false,
    enabled = false,
}

return spec
