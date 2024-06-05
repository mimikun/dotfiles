---@type LazySpec
local spec = {
    "projekt0n/github-nvim-theme",
    lazy = false,
    config = function()
        require("github-theme").setup({
            options = {
                transparent = vim.g.transparent_enabled,
            },
        })
    end,
}

return spec
