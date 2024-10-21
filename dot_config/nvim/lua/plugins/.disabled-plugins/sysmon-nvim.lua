-- TODO: fork it, and support windows, remove lunarvim depends, and to provide versatility

---@type boolean
local cond = require("config.global").is_linux
cond = false

---@type table
local opts = {
    update_interval = 5000,
    use_icon = true,
}

---@type LazySpec
local spec = {
    "TiaraNivani/sysmon.nvim",
    --lazy = false,
    --event = "VeryLazy",
    opts = opts,
    cond = cond,
    enabled = cond,
}

return spec
