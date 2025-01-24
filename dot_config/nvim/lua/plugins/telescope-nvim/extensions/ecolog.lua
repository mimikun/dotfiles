---@type table
local ecolog_config = {
    shelter = {
        -- Whether to show masked values when copying to clipboard
        mask_on_copy = false,
    },
    -- Default keybindings
    mappings = {
        -- Key to copy value to clipboard
        copy_value = "<C-y>",
        -- Key to copy name to clipboard
        copy_name = "<C-n>",
        -- Key to append value to buffer
        append_value = "<C-a>",
        -- Key to append name to buffer (defaults to <CR>)
        append_name = "<CR>",
    },
}

return ecolog_config
