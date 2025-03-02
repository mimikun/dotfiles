---@type table
local opts = {
    virtual_text = "newline",
    --virtual_text = "inline",
    prefix = " 🚀 ",
    date_format = "iso",
    keys = {
        -- run/refresh calculations
        run = "<CR>",
        -- reset buffer
        reset = "R",
        -- yank output of current line
        yank = "<leader>y",
        -- yank all outputs
        yank_all = "<leader>Y",
    },
    -- see below for more on custom conversions/functions
    custom_conversions = {},
    custom_functions = {},
}

return opts
