---@type LazySpec
local spec = {
    "rcarriga/nvim-dap-ui",
    --lazy = false,
    cmd = "ToggleDapUi",
    dependencies = require("plugins.nvim-dap-ui.dependencies"),
    config = function()
        local dapui = require("dap-ui")
        dapui.setup(require("plugins.nvim-dap-ui.opts"))

        -- Toggle dap-ui
        vim.api.nvim_create_user_command("ToggleDapUi", function()
            dapui.toggle()
        end, {})
    end,
    cond = false,
    enabled = false,
}

return spec
