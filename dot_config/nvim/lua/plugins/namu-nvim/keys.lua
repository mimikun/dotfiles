---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>ss",
        function()
            require("namu.namu_symbols").show()
        end,
        mode = "n",
        desc = "Jump to LSP symbol",
        silent = true,
    },
    {

        "<leader>th",
        function()
            require("namu.colorscheme").show()
        end,
        mode = "n",
        desc = "Colorscheme Picker",
        silent = true,
    },
}

return keys
