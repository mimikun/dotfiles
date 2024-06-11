---@type table
local opts = {
    temp_dir = vim.fn.expand("~/.config/nvim/templates"),
}

---@type LazySpec
local spec = {
    "nvimdev/template.nvim",
    lazy = false,
    cmd = "Template",
    opts = opts,
    --cond = false,
}

return spec
