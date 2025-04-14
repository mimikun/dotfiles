local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

local hint = [[
 ^  󰭠  ^ Generate _m_ason-lock.json ^
 ^    ^ Generate _d_otfyle.json    ^
]]

local generate_menu = Hydra({
    name = "Generate Menu",
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
    body = "g",
    heads = {
        {
            "l",
            nil,
            { exit = true, desc = "Generate lazy-lock.json(can't it)" },
        },
        {
            "m",
            cmd("MasonLock"),
            { exit = true, desc = "Generate mason-lock.json" },
        },
        {
            "d",
            function()
                require("dotfyle_metadata").generate({ "--keymaps" })
            end,
            { exit = true, desc = "Generate dotfyle.json" },
        },
        {
            "<Esc>",
            nil,
            { exit = true, desc = false },
        },
    },
})

return generate_menu
