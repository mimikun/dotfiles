-- TODO: fix path
---@type string
local template_dir = vim.fn.expand("~/.config/nvim/templates")

---@type LazySpec
local spec = {
    "nvimdev/template.nvim",
    lazy = false,
    cmd = "Template",
    opts = {
        temp_dir = template_dir,
    },
    --cond = false,
}

return spec
