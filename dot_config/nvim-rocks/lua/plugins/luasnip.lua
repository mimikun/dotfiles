local global = require("config.global")

require("luasnip.loaders.from_vscode").lazy_load({
    paths = {
        global.friendly_snippets,
        global.snippets_dir,
    },
})
