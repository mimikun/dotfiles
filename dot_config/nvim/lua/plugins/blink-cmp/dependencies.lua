local settings = require("config.settings")

---@type LazySpec[]
local dependencies = {
    -- Snippets
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    -- Appearance
    "xzbdmw/colorful-menu.nvim",
    -- Sources
    "nvim-lua/plenary.nvim",
    "saghen/blink.compat",
    "folke/lazydev.nvim",
    "moyiz/blink-emoji.nvim",
    "philosofonusus/ecolog.nvim",
    --"bydlw98/blink-cmp-env",
    "nvim-orgmode/orgmode",
    "mikavilpas/blink-ripgrep.nvim",
    "MahanRahmati/blink-nerdfont.nvim",
    "folke/snacks.nvim",
    "Kaiser-Yang/blink-cmp-dictionary",
    "Kaiser-Yang/blink-cmp-git",
    "mgalliou/blink-cmp-tmux",
    "ribru17/blink-cmp-spell",
    -- BUG: can't use
    --"jdrupal-dev/css-vars.nvim",
    --"jmbuhr/cmp-pandoc-references",
    "disrupted/blink-cmp-conventional-commits",
    -- Source(use blink.compat)
    "Jezda1337/nvim-html-css",
    "rcarriga/cmp-dap",
    "chrisgrieser/cmp_yanky",
}

local use_minuet = false

if use_minuet then
    table.insert(dependencies, { "milanglacier/minuet-ai.nvim" })
end

if settings.use_github_copilot then
    table.insert(dependencies, { "fang2hou/blink-copilot" })
end

if settings.use_avante then
    table.insert(dependencies, { "Kaiser-Yang/blink-cmp-avante" })
end

return dependencies
