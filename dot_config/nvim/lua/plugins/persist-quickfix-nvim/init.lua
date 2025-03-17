---@type LazySpec
local spec = {
    "brunobmello25/persist-quickfix.nvim",
    --lazy = false,
    cmd = require("plugins.persist-quickfix-nvim.cmds"),
    config = function()
        local persist_quickfix = require("persist-quickfix")

        persist_quickfix.setup(require("plugins.persist-quickfix-nvim.opts"))

        vim.api.nvim_create_user_command("PersistQuickFixSave", function()
            persist_quickfix.save("list-name")
        end, {})
        vim.api.nvim_create_user_command("PersistQuickFixLoad", function()
            persist_quickfix.load("list-name")
        end, {})
        vim.api.nvim_create_user_command("PersistQuickFixChoose", function()
            persist_quickfix.choose()
        end, {})
    end,
    cond = false,
    enabled = false,
}

return spec
