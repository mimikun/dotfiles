---@type table
local keys = {
    { "<Leader>L", desc = "run `:nohlsearch` and export results to quickfix" },
}

---@type LazySpec
local spec = {
    "kevinhwang91/nvim-hlslens",
    lazy = false,
    keys = keys,
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

        -- TODO: Fix noice.nvim warning
        -- WARN: You added `S` to `vim.opt.shortmess`.
        -- Search count messages will not be handled by Noice.
        -- So no virtual text for search count.
        vim.opt.shortmess:append("S")
    end,
    --cond = false,
}

return spec
