---@type table
local keys = {
    { "j", desc = "accelerated_jk_gj" },
    { "k", desc = "accelerated_jk_gk" },
}

---@type LazySpec
local spec = {
    "rainbowhxch/accelerated-jk.nvim",
    --lazy = false,
    event = "BufRead",
    keys = keys,
    config = function()
        vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", {})
        vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", {})
    end,
    --cond = false,
}

return spec
