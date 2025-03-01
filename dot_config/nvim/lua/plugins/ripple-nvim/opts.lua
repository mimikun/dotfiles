---@type table
local opts = {
    vertical_step_size = 1,
    horizontal_step_size = 1,
    keys = {
        expand_up = { "<C-up>", mode = { "n", "v" }, desc = "expand up" },
        expand_down = { "<C-down>", mode = { "n", "v" }, desc = "expand down" },
        expand_left = { "<C-left>", mode = { "n", "v" }, desc = "expand left" },
        expand_right = { "<C-right>", mode = { "n", "v" }, desc = "expand right" },
    },
}

return opts
