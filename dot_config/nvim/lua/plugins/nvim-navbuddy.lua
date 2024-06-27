---@type table
local dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
    --"numToStr/Comment.nvim",
    --"nvim-telescope/telescope.nvim",
}

---@type table
local opts = {
    window = {
        border = "rounded",
    },
    lsp = {
        auto_attach = true,
    },
}

---@type LazySpec
local spec = {
    "SmiteshP/nvim-navbuddy",
    --lazy = false,
    cmd = "Navbuddy",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
