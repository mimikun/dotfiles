---@type boolean
local cond = require("config.settings").use_llm

---@type LazySpec
local spec = {
    "yuucu/cursor_open.nvim",
    --lazy = false,
    cmd = "CursorOpen",
    keys = require("plugins.cursor-open-nvim.keys"),
    opts = require("plugins.cursor-open-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
