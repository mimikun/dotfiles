--[[
---@type LazySpec[]
local dependencies = {
    "nvim-telescope/telescope.nvim",
    "folke/which-key.nvim",
}
]]

---@type LazySpec
local spec = {
    "7sedam7/perec.nvim",
    --lazy = false,
    --ft = "",
    --dependencies = dependencies,
    opts = {},
    cond = false,
    enabled = false,
}

return spec
