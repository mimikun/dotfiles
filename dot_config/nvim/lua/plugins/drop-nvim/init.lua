---@type LazySpec
local spec = {
    "folke/drop.nvim",
    --lazy = false,
    cmd = require("plugins.drop-nvim.cmds"),
    ft = require("plugins.drop-nvim.ft"),
    config = function()
        local drop = require("drop")
        drop.setup(require("plugins.drop-nvim.opts"))

        vim.api.nvim_create_user_command("DropShow", function()
            drop.show()
        end, { desc = "show drop" })

        vim.api.nvim_create_user_command("DropHide", function()
            drop.hide()
        end, { desc = "hide drop" })
    end,
    --cond = false,
    --enabled = false,
}

return spec
