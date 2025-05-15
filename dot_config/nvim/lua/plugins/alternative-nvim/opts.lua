---@type table
local opts = {
    rules = {
        -- Built-in rules
        "general.boolean_flip",
        "general.number_increment_decrement",
        -- Built-in rules and override them
        ["general.compare_operator_flip"] = {
            preview = true,
        },
        -- Custom rules
        custom = {},
    },
    -- The labels to select between multiple rules
    select_labels = "asdfghjkl",
    keymaps = {
        -- Set to false to disable the default keymap for specific actions
        -- alternative_next = false,
        alternative_next = "<C-.>",
        alternative_prev = "<C-,>",
    },
}

return opts
