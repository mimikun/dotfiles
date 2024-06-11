---@type boolean
local cond = require("core.settings").use_ai_assistant

---@type table
local opts = {
    debug = false,
    model = "llama2",
}

---@type LazySpec
local spec = {
    "jpmcb/nvim-llama",
    --lazy = false,
    cmd = "Llama",
    opts = opts,
    cond = cond,
}

return spec
