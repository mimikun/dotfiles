local presets = require("markview.presets")

---@class mkv.config
local opts = {
    markdown = {
        --headings = require("markview.presets").headings.glow,
        --horizontal_rules = require("markview.presets").horizontal_rules.thin,
        --tables = require("markview.presets").tables.single,
        headings = presets.headings.glow,
        horizontal_rules = presets.horizontal_rules.thin,
        tables = presets.tables.single,
    },
    preview = {
        filetypes = { "md", "rmd", "quarto" },
        ignore_buftypes = { "nofile" },
    },
}

return opts
