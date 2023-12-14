local iconsets = require("utils.icons")
local icons = {
    ui = iconsets.get("ui", true),
    dap = iconsets.get("dap", true),
}
local recent_files = icons.ui.History .. " Recent files"
local quick_links = icons.ui.List .. "Quick links"
local new_file = icons.ui.NewFile .. " New file"
local update_plugins = icons.dap.RunLast .. "  Update plugins"
local open_mason_window = icons.ui.Gear .. " Open Mason Window"
local run_checkhealth = icons.ui.Accepted .. " Run checkhealth"
local quit_nvim = icons.ui.Close_alt .. " Quit NVIM"

return {
    "goolord/alpha-nvim",
    lazy = false,
    event = "VimEnter",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local theta = require("alpha.themes.theta")
        local bannars = require("utils.bannars")
        local bannar = bannars.get("covid_19").Japan

        local header = {
            type = "text",
            val = bannar,
            opts = {
                position = "center",
                hl = "Type",
            },
        }

        local section_mru = {
            type = "group",
            val = {
                {
                    type = "text",
                    val = recent_files,
                    opts = {
                        hl = "SpecialComment",
                        shrink_margin = false,
                        position = "center",
                    },
                },
                {
                    type = "padding",
                    val = 1,
                },
                {
                    type = "group",
                    val = function()
                        return { theta.mru(0, vim.fn.getcwd(), 10) }
                    end,
                    opts = {
                        shrink_margin = false,
                    },
                },
            },
        }

        local buttons = {
            type = "group",
            val = {
                { type = "text", val = quick_links, opts = { hl = "SpecialComment", position = "center" } },
                { type = "padding", val = 1 },
                dashboard.button("e", new_file, ":ene <BAR> startinsert <CR>"),
                dashboard.button("u", update_plugins, "<cmd>Lazy sync<CR>"),
                dashboard.button("m", open_mason_window, "<cmd>Mason<CR>"),
                dashboard.button("c", run_checkhealth, "<cmd>checkhealth<CR>"),
                dashboard.button("q", quit_nvim, ":qa<CR>"),
            },
            position = "center",
        }

        local config = {
            layout = {
                { type = "padding", val = 1 },
                header,
                { type = "padding", val = 1 },
                buttons,
                { type = "padding", val = 1 },
                section_mru,
            },
            opts = {
                margin = 5,
                setup = function()
                    vim.api.nvim_create_autocmd("DirChanged", {
                        pattern = "*",
                        group = "alpha_temp",
                        callback = function()
                            require("alpha").redraw()
                        end,
                    })
                end,
            },
        }
        alpha.setup(config)
    end,
    --cond = false,
}
