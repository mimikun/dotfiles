---@type MarkdownToolsConfig
local opts = {
    template_dir = vim.fn.expand("~/.config/nvim/templates"),
    picker = "telescope",
    commands = {
        preview = true,
    },
    spell = true,
    spelllang = "en_us",
    file_types = require("plugins.markdown-tools-nvim.ft"),
}

return opts
