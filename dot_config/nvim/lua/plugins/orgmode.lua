---@type LazySpec[]
local dependencies = {
    "danilshvalov/org-modern.nvim",
}

---@type LazySpec
local spec = {
    "nvim-orgmode/orgmode",
    --lazy = false,
    ft = "org",
    event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        local Menu = require("org-modern.menu")
        require("orgmode").setup({
            org_agenda_files = "~/orgfiles/**/*",
            org_default_notes_file = "~/orgfiles/refile.org",
            -- day/week/month/year/number of days
            org_agenda_span = "week",
            org_agenda_start_on_weekday = 1,
            -- start from today + this modifier
            org_agenda_start_day = nil,
            calendar_week_start_day = 1,
            calendar = {
                round_min_with_hours = true,
                min_big_step = 15,
            },
            org_capture_templates = {
                t = {
                    description = "Task",
                    template = "* TODO %?\n  %u",
                },
            },
            emacs_config = {
                executable_path = "emacs",
                config_path = "$HOME/.emacs.d/init.el",
            },
            ui = {
                folds = {
                    colored = true,
                },
                menu = {
                    handler = function(data)
                        Menu:new({
                            window = {
                                margin = { 1, 0, 1, 0 },
                                padding = { 0, 1, 0, 1 },
                                title_pos = "center",
                                border = "single",
                                zindex = 1000,
                            },
                            icons = {
                                separator = "➜",
                            },
                        }):open(data)
                    end,
                },
            },
        })
    end,
    --cond = false,
}

return spec
