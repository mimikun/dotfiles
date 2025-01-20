---@type snacks.dashboard.Item[]
local keys = {
    -- New file
    {
        icon = "",
        key = "n",
        desc = "New File",
        action = ":ene | startinsert",
    },
    -- Utilities
    {
        icon = "󰒲",
        key = "L",
        desc = "Lazy",
        action = function()
            require("lazy").home()
        end,
        enabled = package.loaded.lazy ~= nil,
    },
    {
        icon = "󰐅",
        key = "T",
        desc = "Treesitter",
        action = ":Telescope treesitter_info",
    },
    {
        icon = "󰭠",
        key = "M",
        desc = "Mason",
        action = function()
            require("mason.ui").open()
        end,
    },
    -- Updates
    {
        icon = "",
        key = "u",
        desc = "Update",
        action = function()
            require("plugins.hydra-nvim.update-menu"):activate()
        end,
    },
    --[[
    {
        icon = "",
        key = "l",
        desc = "Update Plugins",
        action = function()
            require("lazy").sync()
        end,
    },
    {
        icon = "",
        key = "t",
        desc = "Update Treesitter",
        action = function()
            vim.cmd(":TSUpdate")
        end,
    },
    {
        icon = "",
        key = "m",
        desc = "Update Mason",
        action = function()
            vim.cmd(":MasonUpdateAll")
        end,
    },
    ]]
    -- telekasten
    {
        icon = "󰃶",
        key = "t",
        desc = "Open DailyNote",
        action = function()
            require("telekasten").goto_today()
        end,
    },
    -- checkhealth
    {
        icon = "󰿶",
        key = "c",
        desc = "Checkhealth",
        action = ":checkhealth",
    },
    -- dotfyle-metadata.nvim
    {
        icon = "",
        key = "d",
        desc = "DotfyleMetaData",
        action = function()
            require("dotfyle_metadata").generate({ "--keymaps" })
        end,
    },
    -- Quit
    {
        icon = " ",
        key = "q",
        desc = "Quit",
        action = ":qa",
    },
}

return keys
