-- This plugin can't support Windows
---@type boolean
local cond = require("config.global").is_windows

---@type table
local cmds = {
    "SudaRead",
    "SudaWrite",
}

---@type LazySpec
local spec = {
    "lambdalisue/vim-suda",
    --lazy = false,
    cmd = cmds,
    init = function()
        vim.g["suda#executable"] = "sudo"
        vim.g["suda#noninteractive"] = 0
        vim.g["suda#prompt"] = "Password: "
        vim.g.suda_smart_edit = 0
    end,
    cond = cond,
    enabled = cond,
}

return spec
