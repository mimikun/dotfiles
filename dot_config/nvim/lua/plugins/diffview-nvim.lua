---@type table
local cmds = {
    "DiffviewOpen",
    "DiffviewFileHistory",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewLog",
}

---@type table
local opts = {
    icons = {
        folder_closed = "",
        folder_open = "",
    },
    signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
    },
}

---@type LazySpec
local spec = {
    "sindrets/diffview.nvim",
    --lazy = false,
    cmd = cmds,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = opts,
    --cond = false,
}

return spec
