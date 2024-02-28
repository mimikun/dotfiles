local template_dir = vim.fn.expand("~/.config/nvim/templates")

return {
    "nvimdev/template.nvim",
    lazy = false,
    cmd = "Template",
    --ft="",
    opts = {
        temp_dir = template_dir,
    },
    --cond = false,
}
