---@type LazySpec
local spec = {
    "sindrets/winshift.nvim",
    --lazy = false,
    cmd = "WinShift",
    opts = require("plugins.winshift-nvim.opts"),
    -- TODO: parts of winbuf-manage head
    cond = false,
    enabled = false,
}

return spec
