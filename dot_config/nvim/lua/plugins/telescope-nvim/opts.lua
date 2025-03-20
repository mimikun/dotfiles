local path_actions = require("telescope_insert_path")

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
                ["["] = path_actions.insert_reltobufpath_visual,
                ["]"] = path_actions.insert_abspath_visual,
                ["{"] = path_actions.insert_reltobufpath_insert,
                ["}"] = path_actions.insert_abspath_insert,
                ["-"] = path_actions.insert_reltobufpath_normal,
                ["="] = path_actions.insert_abspath_normal,
                ["<C-o>"] = path_actions.insert_relpath_o_visual,
            },
        },
        winblend = 20,
    },
    extensions = require("plugins.telescope-nvim.extensions"),
}

return opts
