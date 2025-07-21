---@type table
local opts = {
    mapping = {
        -- nvim-orgmode users: you might want to change this to <leader>olt
        key = "<leader>olt",
        desc = "Toggle: Cycle through list types",
    },
    checkbox_toggle = {
        enabled = true,
        -- NOTE: for nvim-orgmode users, you should change the following mapping OR change the one from orgmode.
        -- If both mapping stay the same, the one from nvim-orgmode will "win"
        key = "<C-Space>",
        desc = "Toggle checkbox state",
        -- Add more filetypes as needed
        filetypes = { "org", "markdown" },
    },
}

return opts
