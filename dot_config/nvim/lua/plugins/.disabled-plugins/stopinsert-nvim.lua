---@type LazySpec
local spec = {
    "csessh/stopinsert.nvim",
    --lazy = false,
    cmd = "StopInsertPlug",
    --event = "VeryLazy",
    opts = {
        ---@type number
        idle_time_ms = 5000,
        ---@type boolean
        show_popup_msg = true,
        ---@type number
        clear_popup_ms = 5000,
        ---@type table
        dislabled_filetypes = {
            "TelescopePrompt",
            "checkhealth",
            "help",
            "lspinfo",
            "mason",
            "neo%-tree*",
        },
    },
    cond = false,
    enabled = false,
}

return spec
