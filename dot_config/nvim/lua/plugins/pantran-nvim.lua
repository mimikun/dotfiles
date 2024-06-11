---@type table
local keys = {
    { "tr", desc = "Run Translate" },
    { "trr", desc = "Run Translate" },
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
        -- NOTE: MUST SET `DEEPL_AUTH_KEY` env-var
        --[[
        deepl = {
            default_source = "",
            default_target = "",
        },
        ]]
    },
}

---@type table
local key_opts = { noremap = true, silent = true, expr = true }

---@type LazySpec
local spec = {
    "potamides/pantran.nvim",
    --lazy = false,
    keys = keys,
    cmd = "Pantran",
    config = function()
        local pantran = require("pantran")

        pantran.setup(opts)
        vim.keymap.set("n", "tr", pantran.motion_translate, key_opts)
        vim.keymap.set("n", "trr", function()
            return pantran.motion_translate() .. "_"
        end, key_opts)
        vim.keymap.set("x", "tr", pantran.motion_translate, key_opts)
    end,
    --cond = false,
}

return spec
