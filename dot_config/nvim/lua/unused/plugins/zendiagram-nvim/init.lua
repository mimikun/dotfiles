---@type LazySpec
local spec = {
    "caliguIa/zendiagram.nvim",
    --lazy = false,
    keys = require("plugins.zendiagram-nvim.keys"),
    opts = require("plugins.zendiagram-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
