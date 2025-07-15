local settings = require("config.settings")

---@type LazySpec[]
local dependencies = {
    -- Snippets
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    -- Appearance
    "xzbdmw/colorful-menu.nvim",
    -- Sources
    "saghen/blink.compat",
    "nvim-lua/plenary.nvim",
    "folke/lazydev.nvim",
    "moyiz/blink-emoji.nvim",
    "philosofonusus/ecolog.nvim",
    "nvim-orgmode/orgmode",
    "folke/snacks.nvim",
    "mikavilpas/blink-ripgrep.nvim",
    "MahanRahmati/blink-nerdfont.nvim",
    "Kaiser-Yang/blink-cmp-dictionary",
    "Kaiser-Yang/blink-cmp-git",
    "mgalliou/blink-cmp-tmux",
    "ribru17/blink-cmp-spell",
    "marcoSven/blink-yanky.nvim",
    "disrupted/blink-cmp-conventional-commits",
    "junkblocker/blink-cmp-wezterm",
    -- Source(use blink.compat)
    "rcarriga/cmp-dap",
}

if settings.use_github_copilot then
    table.insert(dependencies, { "fang2hou/blink-copilot" })
end

if settings.use_avante then
    table.insert(dependencies, { "Kaiser-Yang/blink-cmp-avante" })
end

return dependencies
