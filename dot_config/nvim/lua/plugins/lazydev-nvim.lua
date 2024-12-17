---@type LazySpec[]
local dependencies = {
    { "Bilal2453/luvit-meta", lazy = true },
    { "justinsgithub/wezterm-types", lazy = true },
}

---@type lazydev.Config
local opts = {
    library = {
        { path = "lazy.nvim", words = { "Lazy" } },
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "wezterm-types", mods = { "wezterm" } },
    },
    integrations = {
        lspconfig = true,
        cmp = true,
    },
}

---@type LazySpec
local spec = {
    "folke/lazydev.nvim",
    --lazy = false,
    ft = "lua",
    cmd = "LazyDev",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
