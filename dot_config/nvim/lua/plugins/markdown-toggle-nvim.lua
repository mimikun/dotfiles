---@type LazySpec
local spec = {
    "roodolv/markdown-toggle.nvim",
    --lazy = false,
    ft = { "markdown", "markdown.mdx" },
    config = function()
        local toggle = require("markdown-toggle")
        toggle.setup({})

        vim.api.nvim_create_autocmd("FileType", {
            desc = "markdown-toggle.nvim keymaps",
            pattern = { "markdown", "markdown.mdx" },
            callback = function(args)
                local opts = { silent = true, noremap = true, buffer = args.buf }

                -- Config-switch
                vim.keymap.set("n", "<Leader>mU", toggle.switch_unmarked_only, opts)
                vim.keymap.set("n", "<Leader>mB", toggle.switch_blankhead_skip, opts)
                vim.keymap.set("n", "<Leader>mI", toggle.switch_inner_indent, opts)
                vim.keymap.set("n", "<Leader>mS", toggle.switch_auto_samestate, opts)
                vim.keymap.set("n", "<Leader>mL", toggle.switch_list_cycle, opts)
                vim.keymap.set("n", "<Leader>mX", toggle.switch_box_cycle, opts)

                -- Autolist
                vim.keymap.set("n", "O", toggle.autolist_up, opts)
                vim.keymap.set("n", "o", toggle.autolist_down, opts)
                vim.keymap.set("i", "<CR>", toggle.autolist_cr, opts)

                -- Normal mode
                opts.expr = true
                vim.keymap.set("n", "<C-q>", toggle.quote_dot, opts)
                vim.keymap.set("n", "<C-l>", toggle.list_dot, opts)
                vim.keymap.set("n", "<C-n>", toggle.olist_dot, opts)
                vim.keymap.set("n", "<Leader><C-x>", toggle.checkbox_dot, opts)
                vim.keymap.set("n", "<C-h>", toggle.heading_dot, opts)

                -- Visual mode
                opts.expr = false
                vim.keymap.set("x", "<C-q>", toggle.quote, opts)
                vim.keymap.set("x", "<C-l>", toggle.list, opts)
                vim.keymap.set("x", "<C-n>", toggle.olist, opts)
                vim.keymap.set("x", "<Leader><C-x>", toggle.checkbox, opts)
                vim.keymap.set("x", "<C-h>", toggle.heading, opts)
            end,
        })
    end,
    --cond = false,
}

return spec
