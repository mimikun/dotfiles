---@type LazySpec
local spec = {
    "mirhajian/netria",
    --lazy = false,
    cmd = require("plugins.netria.cmds"),
    keys = require("plugins.netria.keys"),
    init = function()
        -- Disable netrw's automatic directory handling
        vim.g.netrw_keepdir = 1
    end,
    opts = require("plugins.netria.opts"),
    cond = false,
    enabled = false,
}

return spec
