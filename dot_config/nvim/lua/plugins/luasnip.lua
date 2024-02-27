local global = require("core.global")
---@type boolean
local is_windows = global.is_windows
---@type string
local data_dir = global.data_dir
---@type string
local path_sep = global.path_sep
---@type string
local my_snippets_dir = global.snippets_dir
---@type string
local friendly_snippets = table.concat({ data_dir, "lazy", "friendly-snippets" }, path_sep)

---@type string
local build = is_windows and "" or "make install_jsregexp"

return {
    "L3MON4D3/LuaSnip",
    lazy = false,
    dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    version = "v2.*",
    build = build,
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
