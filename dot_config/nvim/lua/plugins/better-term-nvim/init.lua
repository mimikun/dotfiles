---@type LazySpec
local spec = {
    "CRAG666/betterTerm.nvim",
    --lazy = false,
    cmd = require("plugins.better-term-nvim.cmds"),
    keys = require("plugins.better-term-nvim.keys"),
    config = function()
        local betterTerm = require("betterTerm")
        betterTerm.setup(require("plugins.better-term-nvim.opts"))

        vim.api.nvim_create_user_command("BetterTermOpen", function()
            betterTerm.open()
        end, {})
        vim.api.nvim_create_user_command("BetterTermSelect", function()
            betterTerm.select()
        end, {})
    end,
    cond = false,
    enabled = false,
}

return spec
