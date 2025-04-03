local global = require("config.global")

---@type LazySpec
local spec = {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = global.is_windows and false or "make install_jsregexp",
    --lazy = false,
    dependencies = require("plugins.luasnip.dependencies"),
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = {
                global.friendly_snippets,
                global.snippets_dir,
            },
        })
    end,
    --cond = false,
    --enabled = false,
}

return spec
