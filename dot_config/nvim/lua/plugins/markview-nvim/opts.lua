local presets = require("markview.presets")

-- i want default disable
---@type boolean
local default_state = false

---@class mkv.config
local opts = {
    preview = {
        enable = default_state,
        filetypes = { "md", "rmd", "quarto", "markdown", "codecompanion" },
        ignore_buftypes = { "nofile" },
        --ignore_buftypes = {},
    },
    html = {
        enable = default_state,
    },
    latex = {
        enable = default_state,
    },
    markdown = {
        enable = default_state,
        headings = presets.headings.glow,
        horizontal_rules = presets.horizontal_rules.thin,
        tables = presets.tables.single,
    },
    markdown_inline = {
        enable = default_state,
    },
    typst = {
        enable = default_state,
    },
    yaml = {
        enable = default_state,
    },
}

return opts
