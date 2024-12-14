---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
}

---@type LazySpec
local spec = {
    "MagicDuck/grug-far.nvim",
    --lazy = false,
    cmd = "GrugFar",
    dependencies = dependencies,
    opts = require("plugins.configs.grug-far-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
