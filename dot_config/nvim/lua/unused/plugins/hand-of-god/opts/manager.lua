---@type table
local manager = {
    -- ignore paths or folders
    ignore = {},
    -- write automatically when closing the manager
    write_on_exit = true,
    -- ask for confirmation when you attempt to save
    ask_confirmation = true,

    --keybinds for each action
    keybinds = {
        rename_file = "<leader>rn",
        write_prompt = "<leader>w",
        push_back = "<BS>",
        close = { "<Esc>", "q" },
        go_to = "<CR>",
        add_to_jump_list = "<leader>a",
    },
}

return manager
