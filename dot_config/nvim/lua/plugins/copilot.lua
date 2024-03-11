local settings = require("core.settings")

---@type LazySpec
local spec = {
    "zbirenbaum/copilot.lua",
    --lazy = false,
    event = "InsertEnter",
    cmd = "Copilot",
    config = true,
    cond = settings.use_copilot,
}

return spec
