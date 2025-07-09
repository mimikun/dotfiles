---@type LazySpec
local spec = {
    "aidancz/buvvers.nvim",
    --lazy = false,
    cmd = require("plugins.buvvers-nvim.cmds"),
    config = function()
        local buvvers = require("buvvers")
        buvvers.setup()

        vim.api.nvim_create_user_command("BuvversOpen", function()
            buvvers.open()
        end)
        vim.api.nvim_create_user_command("BuvversClose", function()
            buvvers.close()
        end)
        vim.api.nvim_create_user_command("BuvversToggle", function()
            buvvers.toggle()
        end)
    end,
    cond = false,
    enabled = false,
}

return spec
