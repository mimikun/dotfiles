---@type boolean
local cond = require("config.settings").use_ai

---@type table
local cmds = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionToggle",
    "CodeCompanionActions",
    "CodeCompanionAdd",
}

---@type table
local key_opts = { noremap = true, silent = true }

---@type LazyKeysSpec[]
local keys = {
    -- TODO: check
    {
        "<C-a>",
        function()
            require("codecompanion").actions({})
            --vim.cmd([["<cmd>CodeCompanionActions<cr>"]])
        end,
        mode = { "n", "v" },
        key_opts,
        desc = "",
    },
    {
        "<LocalLeader>a",
        function()
            require("codecompanion").toggle()
        end,
        mode = { "n", "v" },
        key_opts,
        desc = "",
    },
    -- TODO: check
    {
        "ga",
        function()
            require("codecompanion").add({})
            --vim.cmd([["<cmd>CodeCompanionAdd<cr>"]])
        end,
        mode = "v",
        key_opts,
        desc = "",
    },
}

---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim",
}

-- TODO: config
---@type table
local opts = {}

---@type LazySpec
local spec = {
    "olimorris/codecompanion.nvim",
    --lazy = false,
    cmd = cmds,
    keys = keys,
    dependencies = dependencies,
    opts = opts,
    cond = cond,
    enabled = cond,
}

return spec
