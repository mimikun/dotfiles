---@type LazySpec
local spec = {
    "Kokecoco/interference.nvim",
    --lazy = false,
    cmd = require("plugins.interference-nvim.cmds"),
    config = function()
        ---@type table
        local opts = require("plugins.interference-nvim.opts")
        local key_opts = { noremap = true, silent = true }

        require("interference").setup(opts)

        vim.keymap.del("n", opts.start_shortcut_key, key_opts)
        vim.keymap.del("n", opts.stop_shortcut_key, key_opts)
    end,
    --cond = false,
    --enabled = false,
}

return spec
