---@type LazySpec
local spec = {
    "mrjones2014/smart-splits.nvim",
    --lazy = false,
    --keys = require("plugins.smart-splits-nvim.keys"),
    cmds = require("plugins.smart-splits-nvim.cmds"),
    opts = require("plugins.smart-splits-nvim.opts"),
    -- TODO: parts of winbuf-manage head
    --cond = false,
    --enabled = false,
}

return spec
