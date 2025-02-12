---@type LazySpec[]
local dependencies = {
    "Bilal2453/luvit-meta",
    "justinsgithub/wezterm-types",
}

---@type LazySpec
local spec = {
    "folke/lazydev.nvim",
    --lazy = false,
    ft = "lua",
    cmd = "LazyDev",
    dependencies = dependencies,
    opts = require("plugins.lazydev-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
