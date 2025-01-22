local opts = {
    mapping = {
        -- nvim-orgmode users: you might want to change this to <leader>olt
        key = "<leader>lt",
        desc = "Toggle: Cycle through list types",
    },
    checkbox_toggle = {
        enabled = true,
        -- Change the checkbox toggle key
        key = "<C-Space>",
        desc = "Toggle checkbox state",
        -- Add more filetypes as needed
        filetypes = { "org" },
    },
}

return opts
