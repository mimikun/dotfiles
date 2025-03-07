---@type LazySpec
local spec = {
    "Hajime-Suzuki/vuffers.nvim",
    --lazy = false,
    cmd = require("plugins.vuffers-nvim.cmds"),
    dependencies = require("plugins.vuffers-nvim.dependencies"),
    config = function()
        local vuffers = require("vuffers")
        vuffers.setup(require("plugins.vuffers-nvim.opts"))

        vim.api.nvim_create_user_command("VuffersOpen", function()
            vuffers.open()
        end)
        vim.api.nvim_create_user_command("VuffersClose", function()
            vuffers.close()
        end)
        vim.api.nvim_create_user_command("VuffersToggle", function()
            vuffers.toggle()
        end)
    end,
    cond = false,
    enabled = false,
}

return spec
