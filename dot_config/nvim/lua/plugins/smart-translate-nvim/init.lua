---@type boolean
local is_work = require("config.global").is_work

---@type LazySpec
local spec = {
    "askfiy/smart-translate.nvim",
    --lazy = false,
    cmd = "Translate",
    dependencies = { "askfiy/http.nvim" },
    opts = require("plugins.smart-translate-nvim.opts"),
    cond = is_work,
    enabled = is_work,
}

return spec
