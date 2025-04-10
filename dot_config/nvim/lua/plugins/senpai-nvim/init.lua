---@type boolean
local cond = require("config.settings").use_llm

---@type LazySpec
local spec = {
    "eetann/senpai.nvim",
    build = "bun install",
    --lazy = false,
    cmd = "Senpai",
    keys = require("plugins.senpai-nvim.keys"),
    dependencies = require("plugins.senpai-nvim.dependencies"),
    opts = require("plugins.senpai-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
