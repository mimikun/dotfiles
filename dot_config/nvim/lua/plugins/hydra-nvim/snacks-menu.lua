local Hydra = require("hydra")
local Snacks = require("snacks")

local hint = [[
 ^ _._ ^ ^ Toggle Scratch Buffer     ^
 ^ _S_ ^ ^ Select Scratch Buffer     ^
 ^ _N_ ^ ^ Show Notification History ^
 ^ _H_ ^ ^ Dismiss All Notifications ^
 ^ _B_ ^ ^ Git Browse                ^
]]

local snacks_menu = Hydra({
    name = "Snacks Menu",
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
    body = "s",
    heads = {
        {
            ".",
            function()
                Snacks.scratch()
            end,
            { exit = true, desc = "Toggle Scratch Buffer" },
        },
        {
            "S",
            function()
                Snacks.scratch.select()
            end,
            { exit = true, desc = "Select Scratch Buffer" },
        },
        {
            "N",
            function()
                Snacks.notifier.show_history()
            end,
            { exit = true, desc = "Show Notification History" },
        },
        {
            "H",
            function()
                Snacks.notifier.hide()
            end,
            { exit = true, desc = "Dismiss All Notifications" },
        },
        {
            "B",
            function()
                Snacks.gitbrowse()
            end,
            { exit = true, desc = "Git Browse" },
        },
        {
            "<Esc>",
            nil,
            { exit = true, desc = false },
        },
    },
})

return snacks_menu
