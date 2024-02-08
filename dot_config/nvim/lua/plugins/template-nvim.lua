local template_dir = vim.fn.expand("~/.config/nvim/templates")

return {
    "nvimdev/template.nvim",
    lazy = false,
    cmd = "Template",
    --ft="",
    config = function()
        require("template").setup({
            temp_dir = template_dir,
        })
    end,
    --cond = false,
}
