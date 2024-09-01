local global = require("config.global")

---@type string
local win_cmd = "." .. global.path_sep .. "build.bat"

---@type string
local other_cmd = "." .. global.path_sep .. "build"

---@type string
local build = global.is_windows and win_cmd or other_cmd

---@type table
local cmds = {
    "CordConnect",
    "CordReconnect",
    "CordDisconnect",
    "CordTogglePresence",
    "CordShowPresence",
    "CordHidePresence",
    "CordToggleIdle",
    "CordIdle",
    "CordUnidle",
    "CordWorkspace",
}

---@type boolean NOT WSL and HAS human rights
local cond = not global.is_wsl and global.is_human_rights

---@type LazySpec
local spec = {
    "vyfor/cord.nvim",
    build = build,
    --lazy = false,
    cmd = cmds,
    event = "VeryLazy",
    opts = {},
    cond = cond,
    enabled = cond,
}

return spec
