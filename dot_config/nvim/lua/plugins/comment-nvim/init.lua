---@type LazySpec
local spec = {
    "numToStr/Comment.nvim",
    --lazy = false,
    keys = require("plugins.comment-nvim.keys"),
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
