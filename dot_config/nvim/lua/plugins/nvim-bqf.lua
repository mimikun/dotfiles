---@type table
local cmds = {
    "BqfEnable",
    "BqfDisable",
    "BqfToggle",
    "BqfAutoToggle",
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
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
