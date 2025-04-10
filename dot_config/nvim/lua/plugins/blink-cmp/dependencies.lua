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
    "mikavilpas/blink-ripgrep.nvim",
    "MahanRahmati/blink-nerdfont.nvim",
    "folke/snacks.nvim",
    "Kaiser-Yang/blink-cmp-dictionary",
    "Kaiser-Yang/blink-cmp-git",
    "mgalliou/blink-cmp-tmux",
    "ribru17/blink-cmp-spell",
    -- BUG: can't use
    --"nvim-orgmode/orgmode",
    --"jdrupal-dev/css-vars.nvim",
    --"jmbuhr/cmp-pandoc-references",
    "disrupted/blink-cmp-conventional-commits",
    -- Source(use blink.compat)
    "Jezda1337/nvim-html-css",
    "rcarriga/cmp-dap",
    "chrisgrieser/cmp_yanky",
    -- NOTE: llm features
    { "milanglacier/minuet-ai.nvim", optional = true },
    { "fang2hou/blink-copilot", optional = true },
    { "Kaiser-Yang/blink-cmp-avante", optional = true },
}

return dependencies
