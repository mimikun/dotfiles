---@type LazySpec[]
local dependencies = {
    -- optional `vim.uv` typings
    { "Bilal2453/luvit-meta", lazy = true },
    { "justinsgithub/wezterm-types", lazy = true },
}

---@type lazydev.Config
local opts = {
    library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        -- Needs `justinsgithub/wezterm-types` to be installed
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
}

return spec
