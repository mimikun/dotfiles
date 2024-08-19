---@type table
local cmds = {
    "TSJToggle",
    "TSJSplit",
    "TSJoin",
}

---@type LazyKeysSpec[]
local keys = {
    -- TSJToggle
    {
        "<leader>m",
        function()
            require("treesj").toggle()
        end,
        mode = "n",
        desc = "Split or Join code block with autodetect",
    },
    -- TSJJoin
    {
        "<leader>j",
        function()
            require("treesj").join()
        end,
        mode = "n",
        desc = "Join code block",
    },
    -- TSJSplit
    {
        "<leader>s",
        function()
            require("treesj").split()
        end,
        mode = "n",
        desc = "Split code block",
    },
}

---@type LazySpec
local spec = {
    "Wansmer/treesj",
    --lazy = false,
    cmd = cmds,
    keys = keys,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
    --cond = false,
}

return spec
