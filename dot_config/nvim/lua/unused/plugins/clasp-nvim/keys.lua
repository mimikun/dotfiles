---@type string
local mode = { "n", "i" }

---@type LazyKeysSpec[]
local keys = {
    {
        "<C-l>",
        function()
            require("clasp").wrap("next")
        end,
        mode = mode,
        desc = "TODO",
    },
    {
        "<C-;>",
        function()
            require("clasp").wrap("prev")
        end,
        mode = mode,
        desc = "TODO",
    },
    {
        "<C-l>",
        function()
            require("clasp").wrap("next", function(nodes)
                local n = {}
                for _, node in ipairs(nodes) do
                    if node.end_row == vim.api.nvim_win_get_cursor(0)[1] - 1 then
                        table.insert(n, node)
                    end
                end
                return n
            end)
        end,
    },
}

return keys
