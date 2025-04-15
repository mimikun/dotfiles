---@type boolean
local cond = require("config.settings").use_llm

---@type LazySpec
local spec = {
    "ravitemer/mcphub.nvim",
    --lazy = false,
    build = "npm install -g mcp-hub@latest",
    cmd = "MCPHub",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require("plugins.mcphub-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
