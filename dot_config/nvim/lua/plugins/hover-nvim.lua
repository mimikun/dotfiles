---@type table
local keys = {
    { "K", desc = "hover.nvim" },
    { "gK", desc = "hover.nvim (select)" },
    { "<C-p>", desc = "hover.nvim (previous source)" },
    { "<C-n>", desc = "hover.nvim (next source)" },
    { "<MouseMove>", desc = "hover.nvim (mouse)" },
}

---@type LazySpec
local spec = {
    "lewis6991/hover.nvim",
    --lazy = false,
    keys = keys,
    config = function()
        local hover = require("hover")
        hover.setup({
            init = function()
                require("hover.providers.lsp")
                require("hover.providers.gh")
                require("hover.providers.diagnostic")
                -- require('hover.providers.gh_user')
                -- require('hover.providers.jira')
                -- require('hover.providers.dap')
                -- require('hover.providers.fold_preview')
                -- require('hover.providers.man')
                -- require('hover.providers.dictionary')
            end,
            preview_opts = {
                border = "single",
            },
            preview_window = false,
            title = true,
            mouse_providers = {
                "LSP",
            },
            mouse_delay = 1000,
        })

        -- Setup keymaps
        vim.keymap.set("n", "K", hover.hover, { desc = "hover.nvim" })
        vim.keymap.set("n", "gK", hover.hover_select, { desc = "hover.nvim (select)" })
        vim.keymap.set("n", "<C-p>", function()
            hover.hover_switch("previous")
        end, { desc = "hover.nvim (previous source)" })
        vim.keymap.set("n", "<C-n>", function()
            hover.hover_switch("next")
        end, { desc = "hover.nvim (next source)" })

        -- Mouse support
        vim.keymap.set("n", "<MouseMove>", hover.hover_mouse, { desc = "hover.nvim (mouse)" })
        vim.o.mousemoveevent = true
    end,
    --cond = false,
}

return spec
