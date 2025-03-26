-- WARNING: Do not call the `lspconfig.hls` setup or set up the lsp manually, as doing so may cause conflicts.

---@type LazySpec
local spec = {
    "mrcjkb/haskell-tools.nvim",
    --lazy = false,
    --ft = "",
    cmd = require("plugins.haskell-tools-nvim.cmds"),
    config = function()
        vim.g.haskell_tools = require("plugins.haskell-tools-nvim.opts")
    end,
    cond = false,
    enabled = false,
}

return spec
