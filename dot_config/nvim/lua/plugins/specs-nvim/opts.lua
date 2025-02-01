---@type table
local opts = {
    show_jumps = true,
    min_jump = 30,
    popup = {
        width = 10,
        -- sinus_fader    `⌣/⌢\⌣/⌢\⌣/⌢\⌣/⌢`
        -- linear_fader   `▁▂▂▃▃▄▄▅▅▆▆▇▇██`
        -- exp_fader      `▁▁▁▁▂▂▂▃▃▃▄▄▅▆▇`
        -- pulse_fader    `▁▂▃▄▅▆▇█▇▆▅▄▃▂▁`
        -- empty_fader    `▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁`
        fader = require("specs").linear_fader,
        -- shrink_resizer `░░▒▒▓█████▓▒▒░░`
        -- slide_resizer  `████▓▓▓▒▒▒▒░░░░`
        -- empty_resizer  `███████████████`
        resizer = require("specs").shrink_resizer,
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}

return opts
