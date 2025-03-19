---@type table
local opts = {
    snippetDir = require("config.global").snippets_dir,
    telescope = {
        alsoSearchSnippetBody = false,
    },
    ---@type "yq"|"jq"|"none"|string[]
    jsonFormatter = "jq",
    backdrop = {
        enabled = true,
        blend = 50,
    },
    icons = {
        scissors = "󰩫",
    },
}

return opts
