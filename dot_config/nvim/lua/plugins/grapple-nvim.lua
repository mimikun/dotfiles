---@type table
local keys = {
    { "<leader>a", desc = "Tag a file" },
    { "<c-e>", desc = "Toggle tags menu" },

    { "<c-h>", desc = "Select first tag" },
    { "<c-t>", desc = "Select second tag" },
    { "<c-n>", desc = "Select third tag" },
    { "<c-s>", desc = "Select fourth tag" },

    { "<c-s-n>", desc = "Go to next tag" },
    { "<c-s-p>", desc = "Go to previous tag" },
}

---@type table
local dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
}

---@type table
local opts = {
    ---Position a tag's name should be shown in Grapple windows
    ---@type "start" | "end"
    name_pos = "end",

    ---How a tag's path should be rendered in Grapple windows
    ---  "relative": show tag path relative to the scope's resolved path
    ---  "basename": show tag path basename and directory hint
    ---@type "basename" | "relative"
    style = "relative",

    ---A string of characters used for quick selecting in Grapple windows
    ---An empty string or false will disable quick select
    ---@type string | boolean
    quick_select = "123456789",

    ---Time limit used for pruning unused scope (IDs). If a scope's save file
    ---modified time exceeds this limit, then it will be deleted when a prune
    ---requested. Can be an integer (in seconds) or a string time limit
    ---(e.g. "30d" or "2h" or "15m")
    ---@type integer | string
    prune = "30d",
}

---@type LazySpec
local spec = {
    "cbochs/grapple.nvim",
    --lazy = false,
    cmd = "Grapple",
    keys = keys,
    dependencies = dependencies,
    config = function()
        local grapple = require("grapple")
        grapple.setup(opts)

        vim.keymap.set("n", "<leader>a", function()
            grapple.toggle()
        end, {})

        vim.keymap.set("n", "<c-e>", function()
            grapple.toggle_tags()
        end, {})

        vim.keymap.set("n", "<c-h>", function()
            grapple.select({ index = 1 })
        end, {})
        vim.keymap.set("n", "<c-t>", function()
            grapple.select({ index = 2 })
        end, {})
        vim.keymap.set("n", "<c-n>", function()
            grapple.select({ index = 3 })
        end, {})
        vim.keymap.set("n", "<c-s>", function()
            grapple.select({ index = 4 })
        end, {})

        vim.keymap.set("n", "<c-s-n>", function()
            grapple.cycle_tags("next")
        end, {})
        vim.keymap.set("n", "<c-s-p>", function()
            grapple.cycle_tags("prev")
        end, {})
    end,
    cond = false,
}

return spec
