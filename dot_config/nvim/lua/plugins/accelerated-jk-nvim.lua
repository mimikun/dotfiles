---@type LazyKeysSpec[]
local keys = {
    { "j", "<Plug>(accelerated_jk_gj)", mode = "n", {} },
    { "k", "<Plug>(accelerated_jk_gk)", mode = "n", {} },
}

---@type LazySpec
local spec = {
    "rainbowhxch/accelerated-jk.nvim",
    --lazy = false,
    event = "BufRead",
    keys = keys,
    opts = {},
    -- TODO: NOW fixing scroll speed
    cond = false,
    enabled = false,
}

return spec
