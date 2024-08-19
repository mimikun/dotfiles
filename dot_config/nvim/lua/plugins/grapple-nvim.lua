---@type LazyKeysSpec
local keys = {
    {
        "<leader>m",
        function()
            require("grapple").toggle()
        end,
        mode = "n",
        desc = "Grapple toggle tag",
    },
    {
        "<leader>M",
        function()
            require("grapple").toggle_tags()
        end,
        mode = "n",
        desc = "Grapple open tags window",
    },
    {
        "<leader>n",
        function()
            require("grapple").cycle_tags("next")
        end,
        mode = "n",
        desc = "Grapple cycle next tag",
    },
    {
        "<leader>p",
        function()
            require("grapple").cycle_tags("prev")
        end,
        mode = "n",
        desc = "Grapple cycle previous tag",
    },
}

---@type table
local events = { "BufReadPost", "BufNewFile" }

---@type table
local opts = {
    ---@type string
    scope = "git",

    ---@type "start" | "end"
    name_pos = "end",

    ---  "relative": show tag path relative to the scope's resolved path
    ---  "basename": show tag path basename and directory hint
    ---@type "basename" | "relative"
    style = "relative",

    quick_select = "123456789",
}

---@type LazySpec
local spec = {
    "cbochs/grapple.nvim",
    --lazy = false,
    cmd = "Grapple",
    keys = keys,
    event = events,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = opts,
    --cond = false,
}

return spec
