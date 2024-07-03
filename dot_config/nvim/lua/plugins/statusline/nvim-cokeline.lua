---@type table
local events = {
    "BufReadPre",
    "BufNewFile",
}

---@type table
local dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
}

---@type LazySpec
local spec = {
    "willothy/nvim-cokeline",
    --lazy = false,
    event = events,
    dependencies = dependencies,
    config = true,
    cond = false,
}

return spec
