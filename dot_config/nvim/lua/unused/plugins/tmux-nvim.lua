---@type table
local opts = {
    copy_sync = {
        enable = false,
        ignore_buffers = { empty = false },
    },
    navigation = {
        persist_zoom = false,
    },
}

---@type LazySpec
local spec = {
    "aserowy/tmux.nvim",
    --lazy = false,
    --keys = "",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
