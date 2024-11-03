---@type screenkey.config
local opts = {
    disable = {
        filetypes = { "toggleterm" },
        buftypes = { "terminal" },
        events = false,
    },
}

require("screenkey").setup(opts)
