---@type boolean
local cond = require("config.global").is_human_rights

---@type LazySpec
local spec = {
    "ptdewey/pendulum-nvim",
    --lazy = false,
    cmd = require("plugins.pendulum-nvim.cmds"),
    event = "BufEnter",
    opts = require("plugins.pendulum-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
