---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>?",
        function()
            require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
    },
}

---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.icons",
}

---@type LazySpec
local spec = {
    "folke/which-key.nvim",
    --lazy = false,
    cmd = "WhichKey",
    keys = keys,
    event = "VeryLazy",
    dependencies = dependencies,
    opts = require("plugins.which-key-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
