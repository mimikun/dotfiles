---@type LazySpec
local spec = {
    "andersevenrud/nvim_context_vt",
    --lazy = false,
    cmd = "NvimContextVtToggle",
    event = "BufEnter",
    opts = require("plugins.nvim-context-vt.opts"),
    --cond = false,
    --enabled = false,
}

return spec
