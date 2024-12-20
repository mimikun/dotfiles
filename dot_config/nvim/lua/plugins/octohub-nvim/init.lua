---@type LazySpec
local dependencies = {
    "2kabhishek/utils.nvim",
    "nvim-telescope/telescope.nvim",
}

---@type LazySpec
local spec = {
    "2kabhishek/octohub.nvim",
    --lazy = false,
    cmd = require("plugins.octohub-nvim.cmds"),
    keys = require("plugins.octohub-nvim.keys"),
    dependencies = dependencies,
    opts = require("plugins.octohub-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
