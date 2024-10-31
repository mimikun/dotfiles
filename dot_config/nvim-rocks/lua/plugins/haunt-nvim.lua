---@type table
local opts = {
    quit_help_with_q = true,
    window = {
        width_frac = 0.88,
        height_frac = 0.88,
        winblend = 15,
    },
}

require("haunt").setup(opts)
