---@type snacks.dashboard.Item[]
local keys = {
    -- New file
    { icon = "", key = "n", desc = "New File", action = ":ene | startinsert" },
    -- Utilities
    { icon = "󰒲", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
    -- TODO: instead telescope command
    { icon = "󰐅", key = "T", desc = "Treesitter", action = ":TSInstallInfo" },
    { icon = "󰭠", key = "M", desc = "Mason", action = ":Mason" },
    -- Updates
    { icon = "", key = "l", desc = "Update Plugins", action = ":Lazy sync" },
    { icon = "", key = "t", desc = "Update Treesitter", action = ":TSUpdate" },
    { icon = "", key = "m", desc = "Update Mason", action = ":MasonUpdateAll" },
    -- checkhealth
    { icon = "󰿶", key = "c", desc = "Checkhealth", action = ":checkhealth" },
    -- dotfyle-metadata.nvim
    { icon = "", key = "d", desc = "DotfyleMetaData", action = ":DotfyleGenerate --keymaps" },
    -- Quit
    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
}

return keys
