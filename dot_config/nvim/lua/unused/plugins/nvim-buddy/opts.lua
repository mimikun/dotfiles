---@type table
local opts = {
    keymaps = {
        show_input = "<leader>q", -- Set to keymap you want to use
    },
    input_window = {
        width = 50,
        height = 10,
        border = "rounded", -- Border style: 'none', 'single', 'double', 'rounded'
        ascii_art = [[
 /\_/\  
( o.o ) 
 ]],
        greeting = "What can I help you with? :3",
        colors = {
            art = "String", -- Art color
            greeting = "Title", -- Greeting color: Title (usually bold)
            divider = "NonText", -- Divider color
        },
    },
}

return opts
