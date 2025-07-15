---@type LazySpec
local spec = {
    "vim-jp/vimdoc-ja",
    --lazy = false,
    keys = require("plugins.vimdoc-ja.keys"),
    init = function()
        -- ヘルプ日本語化
        ---@type table
        vim.opt.helplang = { "ja", "en" }
    end,
    --cond = false,
    --enabled = false,
}

return spec
