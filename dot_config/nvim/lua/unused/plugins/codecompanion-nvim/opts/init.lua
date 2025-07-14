---@type table
local opts = {
    adapters = require("plugins.codecompanion-nvim.opts.adapters"),
    display = require("plugins.codecompanion-nvim.opts.display"),
    strategies = require("plugins.codecompanion-nvim.opts.strategies"),
    prompt_library = require("plugins.codecompanion-nvim.opts.prompt_library"),
    extensions = require("plugins.codecompanion-nvim.opts.extensions"),
    opts = {
        log_level = "ERROR", -- TRACE|DEBUG|ERROR|INFO
        language = "English",
        --language = "Japanese",
        send_code = false,
    },
}

return opts
