---@type LazySpec
local spec = {
    "yochem/chime.nvim",
    --lazy = false,
    event = "DiagnosticsChanged",
    config = function()
        vim.diagnostic.config(require("plugins.chime-nvim.config"))
    end,
    cond = false,
    enabled = false,
}

return spec
