---@type table
local opts = {}

require("hlslens").setup(opts)

vim.keymap.set({ "n", "x" }, "<Leader>L", function()
    vim.schedule(function()
        if require("hlslens").exportLastSearchToQuickfix() then
            vim.cmd("cw")
        end
    end)
    return ":noh<CR>"
end, { expr = true })
