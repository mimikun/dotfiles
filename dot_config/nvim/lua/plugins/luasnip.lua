local global = require("core.global")
local data_dir = global.data_dir
local path_sep = global.path_sep
local my_snippets_dir = global.snippets_dir
local friendly_snippets = data_dir .. path_sep .. "lazy" .. path_sep .. "friendly-snippets"

return {
    "L3MON4D3/LuaSnip",
    lazy = false,
    dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = {
                --$XDG_DATA_HOME/nvim/site/lazy/friendly-snippets/
                friendly_snippets,
                my_snippets_dir,
            },
        })
    end,
    --cond = false,
}
