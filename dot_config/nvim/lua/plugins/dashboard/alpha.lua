local iconsets = require("utils.icons")
local icons = {
    ui = iconsets.get("ui", true),
    misc = iconsets.get("misc", true),
    kind = iconsets.get("kind", true),
}

---@type string
local quick_links = icons.ui.List .. "Quick links"
---@type string
local new_file = icons.ui.NewFile .. " New file"
---@type string
local update_plugins = icons.misc.Update .. " Update plugins"
---@type string
local open_mason_window = icons.ui.Gear .. " Open Mason Window"
---@type string
local run_checkhealth = icons.ui.Accepted .. " Run checkhealth"
---@type string
local quit_nvim = icons.ui.Close_alt .. " Quit NVIM"
---@type string
local search_files = icons.ui.Search .. "  Files"
---@type string
local run_oil = icons.kind.File .. "  Oil"
---@type string
local show_mru = icons.ui.Package .. " MRU"
---@type string
local dotfyle_generate = icons.ui.Gear .. " Generate Dotfyle"
---@type string
local ts_update = icons.ui.Gear .. " Update TreeSitter parsers"

---@type LazySpec
local spec = {
    "goolord/alpha-nvim",
    lazy = false,
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
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

        local buttons = {
            type = "group",
            val = {
                { type = "text", val = quick_links, opts = { hl = "SpecialComment", position = "center" } },
                { type = "padding", val = 1 },
                dashboard.button("e", new_file, ":ene <BAR> startinsert <CR>"),
                dashboard.button("f", search_files, "<cmd>Telescope smart_open<CR>"),
                dashboard.button("r", show_mru, "<cmd>Telescope oldfiles<CR>"),
                dashboard.button(".", run_oil, "<cmd>Oil<CR>"),
                dashboard.button("u", update_plugins, "<cmd>Lazy sync<CR>"),
                dashboard.button("m", open_mason_window, "<cmd>Mason<CR>"),
                dashboard.button("t", ts_update, "<cmd>TSUpdate<CR>"),
                dashboard.button("c", run_checkhealth, "<cmd>checkhealth<CR>"),
                dashboard.button("d", dotfyle_generate, "<cmd>DotfyleGenerate --keymaps<CR>"),
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

return spec
