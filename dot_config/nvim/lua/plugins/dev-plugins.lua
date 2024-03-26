---@type LazySpec
local tenki = {
    "mimikun/tenki.nvim",
    dev = true,
    lazy = false,
    --event = "VeryLazy",
    --cmd = cmds,
    dependencies = { "nvim-lua/plenary.nvim" },
    --opts = {},
    config = true,
    cond = false,
}

---@type LazySpec
local silhouette = {
    "mimikun/silhouette.nvim",
    dev = true,
    lazy = false,
    --event = "VeryLazy",
    --cmd = cmds,
    --dependencies = { "nvim-tree/nvim-web-devicons" },
    --opts = {},
    config = true,
    cond = false,
}

---@type table|LazySpec
local dev_plugins = {
    tenki,
    silhouette,
}

return dev_plugins
