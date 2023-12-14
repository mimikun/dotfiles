local iconsets = require("utils.icons")
local icons = {
    ui = iconsets.get("ui"),
    ui_sep = iconsets.get("ui", true),
    dap = iconsets.get("dap", true),
}

local history = icons.ui.History
local new_file = icons.ui_sep.NewFile .. "New file"
local update_plugins = icons.dap.RunLast .. "Update plugins"
local open_mason_window = icons.ui_sep.Gear .. "Open Mason Window"
local run_checkhealth = icons.ui_sep.Accepted .. "Run checkhealth"
local quit_nvim = icons.ui_sep.Close_alt .. "Quit NVIM"

return {
    "glepnir/dashboard-nvim",
    --lazy = false,
    event = "VimEnter",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local bannars = require("utils.bannars")
        local bannar = bannars.get("covid_19").Japan

        require("dashboard").setup({
            -- https://github.com/nvimdev/dashboard-nvim
            theme = "hyper",
            shortcut_type = "number",
            config = {
                header = bannar,
                week_header = {
                    enable = false,
                },
                shortcut = {
                    {
                        desc = new_file,
                        group = "@property",
                        action = "enew",
                        key = "e",
                    },
                    {
                        desc = update_plugins,
                        group = "@property",
                        action = "Lazy update",
                        key = "u",
                    },
                    {
                        desc = open_mason_window,
                        group = "@property",
                        action = "Mason",
                        key = "m",
                    },
                    {
                        desc = run_checkhealth,
                        group = "@property",
                        action = "checkhealth",
                        key = "c",
                    },
                    {
                        desc = quit_nvim,
                        group = "@property",
                        action = "qa",
                        key = "q",
                    },
                },
                packages = {
                    enable = true,
                },
                project = {
                    enable = false,
                },
                mru = {
                    limit = 10,
                    icon = history,
                    label = "Recent files",
                },
            },
        })
    end,
    cond = false,
}
