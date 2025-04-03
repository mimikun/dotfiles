local settings = require("config.settings")

---@type LazySpec[]
local dependencies = {
    "saghen/blink.compat",
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    "folke/lazydev.nvim",
    "moyiz/blink-emoji.nvim",
    "philosofonusus/ecolog.nvim",
    "nvim-orgmode/orgmode",
    "mikavilpas/blink-ripgrep.nvim",
    "folke/snacks.nvim",
    "MahanRahmati/blink-nerdfont.nvim",
    --"rcarriga/cmp-dap",
    --"chrisgrieser/cmp_yanky",
    --"andersevenrud/cmp-tmux",
    --{ "xzbdmw/colorful-menu.nvim", opts = {}, optional = true },
    -- XXX: AI solution
    --"milanglacier/minuet-ai.nvim",
}

if settings.use_github_copilot then
    table.insert(dependencies, { "fang2hou/blink-copilot" })
end

if settings.use_avante then
    table.insert(dependencies, { "Kaiser-Yang/blink-cmp-avante" })
end

return dependencies
