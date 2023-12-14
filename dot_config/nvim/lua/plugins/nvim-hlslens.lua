return {
    "kevinhwang91/nvim-hlslens",
    lazy = false,
    --event = "VeryLazy",

    config = function()
        local hlslens = require("hlslens")
        hlslens.setup({})

        -- run `:nohlsearch` and export results to quickfix
        vim.keymap.set({ "n", "x" }, "<Leader>L", function()
            vim.schedule(function()
                if hlslens.exportLastSearchToQuickfix() then
                    vim.cmd("cw")
                end
            end)
            return ":noh<CR>"
        end, { expr = true })

        vim.opt.shortmess:append("S")
    end,
    --cond = false,
}
