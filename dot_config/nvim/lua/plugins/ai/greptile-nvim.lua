---@type boolean
local has_ripgrep = (1 == vim.fn.executable("rg")) and true or false
---@type boolean
local use_ai_assistant = require("core.settings").use_ai_assistant
---@type boolean
local greptile_api_key = vim.env.GREPTILE_API_KEY ~= nil
---@type boolean
local github_token = vim.env.GITHUB_TOKEN ~= nil

---@type boolean
local cond = has_ripgrep and use_ai_assistant and greptile_api_key and github_token

---@type table
local keys = {
    { "<leader>ss", desc = "Semantic search files" },
}

---@type table
local dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
}

---@type LazySpec
local spec = {
    "rajitkhanna/greptile.nvim",
    --lazy = false,
    cmd = "GreptileSearch",
    keys = keys,
    dependencies = dependencies,
    config = function()
        vim.keymap.set("n", "<leader>ss", "<cmd>GreptileSearch<cr>")
    end,
    cond = cond,
}

return spec
