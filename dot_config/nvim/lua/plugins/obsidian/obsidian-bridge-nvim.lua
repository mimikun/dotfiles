---@type boolean
local cond = vim.env.OBSIDIAN_REST_API_KEY ~= nil

--[[
NOTE: NEED IT:
set -Ux OBSIDIAN_REST_API_KEY=<YOUR_API_KEY>
]]

---@type table
local dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
}

---@type table
local cmds = {
    "ObsidianBridgeDailyNote",
    "ObsidianBridgeOpenGraph",
    "ObsidianBridgeOpenVaultMenu",
    "ObsidianBridgeTelescopeCommand",
}

---@type table
local events = {
    "BufReadPre *.md",
    "BufNewFile *.md",
}

---@type table
local opts = {
    obsidian_server_address = "http://localhost:27123",
    -- See "Sync of buffer scrolling" section below
    scroll_sync = false,
}

---@type LazySpec
local spec = {
    "oflisback/obsidian-bridge.nvim",
    --lazy = false,
    cmd = cmds,
    event = events,
    dependencies = dependencies,
    opts = opts,
    cond = cond,
}

return spec
