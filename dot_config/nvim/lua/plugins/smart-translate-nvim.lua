---@type boolean
local cond = require("config.global").is_work

---@type SmartTranslate.Config
local opts = {
    default = {
        cmds = {
            source = "auto",
            target = "ja",
            handle = "float",
            engine = "google",
        },
    },
}

---@type LazySpec
local spec = {
    "askfiy/smart-translate.nvim",
    --lazy = false,
    cmd = "Translate",
    dependencies = { "askfiy/http.nvim" },
    opts = opts,
    cond = cond,
    enabled = cond,
}

return spec
