---@type table
local opts = {
    select_prompt = " legendary.nvim ",
    col_separator_char = "│",
    icons = {
        command = "",
        fn = "󰡱",
        itemgroup = "",
    },
    extensions = {
        lazy_nvim = true,
        which_key = {
            auto_register = true,
        },
        nvim_tree = true,
        smart_splits = false,
        op_nvim = false,
        diffview = true,
    },
}

require("legendary").setup(opts)
