---@type LazySpec
local spec = {
    "MeanderingProgrammer/render-markdown.nvim",
    --lazy = false,
    ft = require("plugins.render-markdown-nvim.ft"),
    cmd = "RenderMarkdown",
    event = "BufEnter",
    dependencies = require("plugins.render-markdown-nvim.dependencies"),
    init = function()
        vim.treesitter.language.register("markdown", "vimwiki")
    end,
    config = function()
        local rm = require("render-markdown")

        rm.setup(require("plugins.render-markdown-nvim.opts"))

        -- default off
        rm.disable()
    end,
    --cond = false,
    --enabled = false,
}

return spec
