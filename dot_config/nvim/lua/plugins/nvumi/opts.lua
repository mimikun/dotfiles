---@type table
local opts = {
    virtual_text = "newline",
    --virtual_text = "inline",
    keys = {
        -- run calculations
        run = "<CR>",
        -- reset buffer
        reset = "R",
        -- yank last output
        yank = "<leader>y",
    },
}

return opts
