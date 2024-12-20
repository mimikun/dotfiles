---@type LazySpec[]
local dependencies = {
    "nvimdev/lspsaga.nvim",
    --{ "iguanacucumber/magazine.nvim", name = "nvim-cmp" },
}

---@type LazySpec
local spec = {
    "philosofonusus/ecolog.nvim",
    lazy = false,
    cmd = require("plugins.ecolog-nvim.cmds"),
    dependencies = dependencies,
    opts = require("plugins.ecolog-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
