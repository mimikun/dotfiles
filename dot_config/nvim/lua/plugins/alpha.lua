-- ref: https://github.com/gennaro-tedesco/dotfiles/blob/70d52bde30b4a7a6f7f788ec24c31f88e8e79a56/nvim/lua/plugins/alpha.lua

local neovim_header = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

local vanitas_header = {
    [[                       ᓀ‸ᓂ                       ]],
    [[                                                 ]],
    [[       Vanitas vanitatum. et omnia vanitas.      ]],
}

local vanitas_header_2 = {
    [[⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀]],
    [[⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀]],
    [[⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀]],
    [[⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀]],
    [[⡀⠿⠿⠿⠿⠿⣿⠿⠿⠿⢿⣷⡄⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⣤⣿⠿⠿⠿⢿⣿⠿⠿⠿⠿⠇⡀]],
    [[⡀⡀⡀⡀⡀⡀⣿⡀⡀⡀⡀⠈⣿⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⣸⡿⡀⡀⡀⡀⢸⣿⡀⡀⡀⡀⡀⡀]],
    [[⡀⡀⡀⡀⡀⡀⣿⡀⡀⡀⡀⡀⣿⠁⡀⡀⡀⡀⡀⡀⡀⡀⡀⢻⣧⡀⡀⡀⡀⣸⡿⡀⡀⡀⡀⡀⡀]],
    [[⡀⡀⡀⡀⡀⡀⠘⣿⣦⣤⣴⣿⠋⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⠿⣷⣤⣤⣾⡿⡀⡀⡀⡀⡀⡀⡀]],
    [[⡀⡀⡀⡀⡀⡀⡀⡀⠈⠉⠁⡀⡀⡀⡀⡀⣴⡿⢿⣦⡀⡀⡀⡀⡀⡀⠉⠉⡀⡀⡀⡀⡀⡀⡀⡀⡀]],
    [[⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⠞⠋⡀⡀⠙⠷⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀]],
    [[                                     ]],
    [[ Vanitas vanitatum. et omnia vanitas.]],
}

local remember_covid_19 = {
    [[================================]],
    [[===== Remember COVID-19!!! =====]],
    [[================================]],
    [[==== コロナを忘れるな！！！ ====]],
    [[================================]],
}

local headers = {
    neovim_header,
    vanitas_header,
    vanitas_header_2,
    remember_covid_19,
}

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

        local header = {
            type = "text",
            -- Set original headers
            -- 1: neovim_header
            -- 2: vanitas_header
            -- 3: vanitas_header_2
            -- 4: remember_covid_19
            val = headers[4],
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
                    val = "  Recent files",
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
                { type = "text", val = "󰍜  Quick links", opts = { hl = "SpecialComment", position = "center" } },
                { type = "padding", val = 1 },
                dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
                dashboard.button("c", "  Run checkhealth", "<cmd>checkhealth<CR>"),
                dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
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
