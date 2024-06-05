---@type LazySpec
local spec = {
    "jpmcb/nvim-llama",
    --lazy = false,
    cmd = "Llama",
    opts = {
        debug = false,
        model = "llama2",
    },
    cond = require("config.settings").use_ai_assistant,
}

return spec
