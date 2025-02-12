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

return opts
