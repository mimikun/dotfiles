---@type boolean
local cond = require("config.settings").use_gemini_cli

---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>og",
        function()
            require("gemini").toggle_gemini_cli()
        end,
        mode = "n",
        { noremap = true, silent = true },
    },
}

---@type LazySpec
local spec = {
    "jonroosevelt/gemini.nvim",
    --lazy = false,
    keys = keys,
    opts = {},
    cond = cond,
    enabled = cond,
}

return spec
