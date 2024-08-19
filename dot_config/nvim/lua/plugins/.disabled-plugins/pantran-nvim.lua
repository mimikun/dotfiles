---@type table
local key_opts = { noremap = true, silent = true, expr = true }

---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>tr",
        function()
            require("pantran").motion_translate()
        end,
        mode = "n",
        key_opts,
        desc = "Run translate",
    },
    {
        "<leader>trr",
        function()
            return require("pantran").motion_translate() .. "_"
        end,
        mode = "n",
        key_opts,
        desc = "Run translate",
    },
    {
        "<leader>tr",
        function()
            require("pantran").motion_translate()
        end,
        mode = "x",
        key_opts,
        desc = "Run translate",
    },
}

---@type table
local opts = {
    default_engine = "google",
    engines = {
        google = {
            default_source = "en",
            default_target = "ja",
            fallback = {
                default_source = "auto",
                default_target = "ja",
            },
        },
    },
}

---@type LazySpec
local spec = {
    "potamides/pantran.nvim",
    --lazy = false,
    cmd = "Pantran",
    keys = keys,
    opts = opts,
    --cond = false,
    -- NOTE: not for me
    enabled = false,
}

return spec
