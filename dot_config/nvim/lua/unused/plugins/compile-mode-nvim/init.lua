local branch
branch = "latest"
branch = "nightly"

---@type LazySpec
local spec = {
    "ej-shafran/compile-mode.nvim",
    --lazy = false,
    --version = "^5.0.0",
    branch = branch,
    cmd = require("plugins.compile-mode-nvim.cmds"),
    --keys = require("plugins.compile-mode-nvim.keys"),
    dependencies = require("plugins.compile-mode-nvim.dependencies"),
    config = function()
        vim.g.compile_mode = require("plugins.compile-mode-nvim.opts")
    end,
    cond = false,
    enabled = false,
}

return spec
