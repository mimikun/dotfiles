---@type LazySpec[]
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
}

---@type table
local ft = { "markdown", "vimwiki", "Avante" }

---@type table
local opts = require("plugins.configs.render-markdown-nvim.opts")

---@type LazySpec
local spec = {
    "MeanderingProgrammer/render-markdown.nvim",
    --lazy = false,
    ft = ft,
    cmd = "RenderMarkdown",
    event = "BufEnter",
    dependencies = dependencies,
    init = function()
        vim.treesitter.language.register("markdown", "vimwiki")
    end,
    config = function()
        local rm = require("render-markdown")

        rm.setup(opts)

        -- default off
        rm.disable()
    end,
    --cond = false,
    --enabled = false,
}

return spec
