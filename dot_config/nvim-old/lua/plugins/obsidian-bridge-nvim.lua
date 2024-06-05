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

local events = {
    "BufReadPre *.md",
    "BufNewFile *.md",
}

---@type LazySpec
local spec = {
    "oflisback/obsidian-bridge.nvim",
    --lazy = false,
    cmd = cmds,
    event = events,
    dependencies = dependencies,
    opts = {
        obsidian_server_address = "http://localhost:27123",
        -- See "Sync of buffer scrolling" section below
        scroll_sync = false,
    },
    cond = false,
}

return spec
