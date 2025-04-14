local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

local hint = [[
 ^  󰒲  ^ _l_azy       ^
 ^  󰭠  ^ _m_ason      ^
 ^  󰐅  ^ _t_reesitter ^
]]

local dashboard_menu = Hydra({
    name = "Dashboard Menu",
    hint = hint,
    config = {
        invoke_on_body = true,
        hint = {
            offset = -1,
            float_opts = {
                border = "rounded",
            },
        },
    },
    mode = "n",
    body = "d",
    heads = {
        {
            "l",
            function()
                require("lazy").home()
            end,
            { exit = true, desc = "Show Lazy Home" },
        },
        {
            "m",
            function()
                require("mason.ui").open()
            end,
            { exit = true, desc = "Show Mason tools" },
        },
        {
            "t",
            cmd("Telescope treesitter_info"),
            { exit = true, desc = "Show Treesitter info" },
        },
        {
            "<Esc>",
            nil,
            { exit = true, desc = false },
        },
    },
})

return dashboard_menu
