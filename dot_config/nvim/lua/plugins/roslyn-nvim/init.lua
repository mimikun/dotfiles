---@type LazySpec
local spec = {
    "seblyng/roslyn.nvim",
    --lazy = false,
    ft = { "cs", "razor" },
    cmd = "Roslyn",
    dependencies = { "tris203/rzls.nvim" },
    init = function()
        vim.filetype.add({
            extension = {
                razor = "razor",
                cshtml = "razor",
            },
        })
    end,
    config = function()
        require("roslyn").setup(require("plugins.roslyn-nvim.opts"))
    end,
    cond = false,
    enabled = false,
}

return spec
