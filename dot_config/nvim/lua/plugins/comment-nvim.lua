---@type LazyKeysSpec[]
local keys = {
    {
        "gc",
        mode = { "n", "x" },
        desc = "line comment",
    },
    {
        "gb",
        mode = { "n", "x" },
        desc = "block comment",
    },
    {
        "gcc",
        mode = "n",
        desc = "block comment",
    },
}

---@type table
local opts = {}

---@type LazySpec
local spec = {
    "numToStr/Comment.nvim",
    --lazy = false,
    keys = keys,
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        require("Comment").setup({
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })
    end,
    --cond = false,
    --enabled = false,
}

return spec
