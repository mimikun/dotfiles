---@type table
local keymaps = {
    { "tr", desc = "Run Translate" },
    { "trr", desc = "Run Translate" },
}

---@type LazySpec
local spec = {
    "potamides/pantran.nvim",
    --lazy = false,
    --event = "VeryLazy",
    keys = keymaps,
    cmd = "Pantran",
    config = function()
        local pantran = require("pantran")
        pantran.setup({
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
        })

        local opts = { noremap = true, silent = true, expr = true }
        vim.keymap.set("n", "tr", pantran.motion_translate, opts)
        vim.keymap.set("n", "trr", function()
            return pantran.motion_translate() .. "_"
        end, opts)
        vim.keymap.set("x", "tr", pantran.motion_translate, opts)
    end,
    --cond = false,
}

return spec
