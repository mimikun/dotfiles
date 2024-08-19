---@type LazySpec[]
local dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
}

---@type table
local opts = {
    floating = {
        border = "single",
    },
}

---@type LazySpec
local spec = {
    "rcarriga/nvim-dap-ui",
    --lazy = false,
    --cmd = "CMDNAME",
    dependencies = dependencies,
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup(opts)
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- Toggle dap-ui
        vim.api.nvim_create_user_command("ToggleDapUi", function()
            dapui.toggle()
        end, {})
    end,
    --cond = false,
}

return spec
