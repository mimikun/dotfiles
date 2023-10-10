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
                        desc = "New file",
                        group = "@property",
                        action = "enew",
                        key = "e",
                    },
                    {
                        desc = "Update plugins",
                        group = "@property",
                        action = "Lazy update",
                        key = "u",
                    },
                    {
                        desc = "Run checkhealth",
                        group = "@property",
                        action = "checkhealth",
                        key = "c",
                    },
                    {
                        desc = "󰅚Quit NVIM",
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
                    icon = "",
                    label = "Recent files",
                },
            },
        })
    end,
    cond = false,
}
