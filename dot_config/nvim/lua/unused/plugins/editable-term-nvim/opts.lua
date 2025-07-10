---@type EditableTermConfig
local opts = {
    promts = {
        -- gdb promt
        ["^%(gdb%) "] = {},
        -- python PS1
        ["^... "] = {},
        -- python PS2
        ["^>>> "] = {},
        ["some_other_prompt"] = {
            keybinds = {
                clear_current_line = "<C-e><C-u>",
                goto_line_start = "<C-a>",
                forward_char = "<C-f>",
            },
        },
    },
}

return opts
