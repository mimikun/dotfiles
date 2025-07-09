---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    { "rcarriga/nvim-notify", optional = true },
    { "nvim-lualine/lualine.nvim", optional = true },
}

return dependencies
