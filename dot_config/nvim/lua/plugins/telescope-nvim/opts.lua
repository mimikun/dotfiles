---@type table
local opts = {
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
                ["<esc>"] = require("telescope.actions").close,
            },
            n = {
                ["<C-h>"] = "which_key",
            },
        },
        winblend = 20,
    },
    extensions = require("plugins.telescope-nvim.extensions"),
}

return opts
