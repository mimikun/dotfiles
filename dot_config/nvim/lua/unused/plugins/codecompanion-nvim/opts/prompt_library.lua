---@type table
local prompt_library = {
    ["Docusaurus"] = require("plugins.codecompanion-nvim.opts.prompts.docusaurus"),
    --["Add memo tag"] = require("plugins.codecompanion.prompt.memo-tag"),
    --["Blog composition"] = require("plugins.codecompanion.prompt.blog-composition"),
    --["Generate English Commit Message"] = require("plugins.codecompanion.prompt.commit-message-english"),
    --["Generate Japanese Commit Message"] = require("plugins.codecompanion.prompt.commit-message-japanese"),
}

return prompt_library
