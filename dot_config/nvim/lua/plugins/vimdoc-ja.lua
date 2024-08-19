---@type LazyKeysSpec
local keys = {
    { "h", mode = "c", desc = "open [H]elp" },
}

---@type LazySpec
local spec = {
    "vim-jp/vimdoc-ja",
    --lazy = false,
    keys = keys,
    init = function()
        -- ヘルプ日本語化
        ---@type table
        vim.opt.helplang = { "ja", "en" }
    end,
    --cond = false,
}

return spec
