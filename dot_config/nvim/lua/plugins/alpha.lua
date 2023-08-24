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

return {
    "goolord/alpha-nvim",
    lazy = false,
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = vanitas_header_2
        dashboard.section.buttons.val = {
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
        }
        alpha.setup(dashboard.config)
    end,
    --cond = false,
}
