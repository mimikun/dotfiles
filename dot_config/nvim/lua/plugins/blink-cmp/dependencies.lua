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
    "nvim-orgmode/orgmode",
    "mikavilpas/blink-ripgrep.nvim",
    "MahanRahmati/blink-nerdfont.nvim",
    "folke/snacks.nvim",
    "Kaiser-Yang/blink-cmp-dictionary",
    "Kaiser-Yang/blink-cmp-git",
    "mgalliou/blink-cmp-tmux",
    "ribru17/blink-cmp-spell",
    -- WARN: can't use
    --"bydlw98/blink-cmp-env",
    --"jdrupal-dev/css-vars.nvim",
    --"jmbuhr/cmp-pandoc-references",
    "disrupted/blink-cmp-conventional-commits",
    -- Source(use blink.compat)
    "rcarriga/cmp-dap",
    "chrisgrieser/cmp_yanky",
    "dnnr1/lorem-ipsum.nvim",
    "samiulsami/cmp-go-deep",
    -- WARN: can't use
    --"Jezda1337/nvim-html-css",
}

if settings.use_minuet then
    table.insert(dependencies, { "milanglacier/minuet-ai.nvim" })
end

if settings.use_github_copilot then
    table.insert(dependencies, { "fang2hou/blink-copilot" })
end

if settings.use_avante then
    table.insert(dependencies, { "Kaiser-Yang/blink-cmp-avante" })
end

return dependencies
