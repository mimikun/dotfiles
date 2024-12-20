---@type LazyKeysSpec[]
local keys = {
    {
        "<Leader>L",
        function()
            vim.schedule(function()
                if require("hlslens").exportLastSearchToQuickfix() then
                    vim.cmd("cw")
                end
            end)
            return ":noh<CR>"
        end,
        mode = { "n", "x" },
        { expr = true },
        desc = "run `:nohlsearch` and export results to quickfix",
    },
}

return keys
