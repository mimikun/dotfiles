---@type table
local cmds = {
    "AnimatedBgFireworks",
    "AnimatedBgMatrix",
    "AnimatedBgDemo",
    "AnimatedBgStop",
}

---@type table
local opts = {
    fps = 60,
}

---@type LazySpec
local spec = {
    "alanfortlink/animatedbg.nvim",
    --lazy = false,
    cmd = cmds,
    config = function()
        local animatedbg = require("animatedbg-nvim")
        animatebg.setup(opts)

        vim.api.nvim_create_user_command("AnimatedBgFireworks", function()
            animatedbg.play({ animation = "fireworks" })
        end, { desc = "Start fireworks animation" })
        vim.api.nvim_create_user_command("AnimatedBgMatrix", function()
            animatedbg.play({ animation = "matrix" })
        end, { desc = "Start matrix animation" })
        vim.api.nvim_create_user_command("AnimatedBgDemo", function()
            animatedbg.play({ animation = "demo" })
        end, { desc = "Start demo animation" })
        vim.api.nvim_create_user_command("AnimatedBgStop", function()
            animatedbg.stop_all()
        end, { desc = "Stop all animation" })
    end,
    --cond = false,
    --enabled = false,
}

return spec
