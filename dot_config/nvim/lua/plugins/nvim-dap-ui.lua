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
    cmd = "ToggleDapUi",
    dependencies = dependencies,
    config = function()
        local dapui = require("dap-ui")
        dapui.setup(opts)

        -- Toggle dap-ui
        vim.api.nvim_create_user_command("ToggleDapUi", function()
            dapui.toggle()
        end, {})
    end,
    cond = false,
    enabled = false,
}

return spec
