---@type table
local dependencies = {
    "kevinhwang91/nvim-hlslens",
    "lewis6991/gitsigns.nvim",
}

---@type table
local opts = {
    excluded_filetypes = {
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
        "alpha",
    },
    handlers = {
        gitsigns = true,
        search = true,
    },
}

---@type LazySpec
local spec = {
    "petertriho/nvim-scrollbar",
    --lazy = false,
    event = "VimEnter",
    dependencies = dependencies,
    config = function()
        require("scrollbar").setup(opts)
        require("scrollbar.handlers.search").setup()
        require("scrollbar.handlers.gitsigns").setup()
    end,
    --cond = false,
    -- NOTE: scrollbar plugin
    enabled = false,
}

return spec
