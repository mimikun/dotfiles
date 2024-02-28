local settings = require("core.settings")

return {
    "zbirenbaum/copilot.lua",
    --lazy = false,
    event = "InsertEnter",
    cmd = "Copilot",
    config = true,
    cond = settings.use_copilot,
}
