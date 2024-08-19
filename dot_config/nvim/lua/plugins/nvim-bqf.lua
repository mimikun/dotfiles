---@type table
local cmds = {
    "BqfEnable",
    "BqfDisable",
    "BqfToggle",
    "BqfAutoToggle",
}

---@type LazySpec[]
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
}

---@type table
local opts = {
    auto_enable = true,
    auto_resize_height = true,
}

---@type LazySpec
local spec = {
    "kevinhwang91/nvim-bqf",
    --lazy = false,
    ft = "qf",
    cmd = cmds,
    --event = "VeryLazy",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
