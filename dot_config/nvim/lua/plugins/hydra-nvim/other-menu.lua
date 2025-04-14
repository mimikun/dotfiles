local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

local hint = [[
 ^  󰑫  ^ Open _f_eed        ^
 ^  󰃶  ^ Open _d_ailynote   ^
 ^  󰿶  ^ Run  _c_heckhealth ^
]]

local update_menu = Hydra({
    name = "Update Menu",
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
    body = "o",
    heads = {
        {
            "f",
            cmd("Feed"),
            { exit = true, desc = "Open feed" },
        },
        {
            "d",
            function()
                require("telekasten").goto_today()
            end,
            { exit = true, desc = "Open dailynote" },
        },
        {
            "c",
            cmd("checkhealth"),
            { exit = true, desc = "Run checkhealth" },
        },
        {
            "<Esc>",
            nil,
            { exit = true, desc = false },
        },
    },
})

return update_menu
