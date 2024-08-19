local global = require("config.global")

---@type LazySpec[]
local dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
}

---@type LazySpec
local spec = {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = global.is_windows and "" or "make install_jsregexp",
    --lazy = false,
    dependencies = dependencies,
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = {
                global.friendly_snippets,
                global.snippets_dir,
            },
        })
    end,
    --cond = false,
}

return spec
