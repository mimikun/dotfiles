---@type vx.auto_activation
local auto_activation = {
    screensaver = {
        setup_deferral = 10,
        timeout = 0,
        ignore_focus = false,
        block_on_term = true,
        block_on_cmd_line = true,
    },
    on_filetype = require("plugins.vimatrix-nvim.ft"),
}

return auto_activation
