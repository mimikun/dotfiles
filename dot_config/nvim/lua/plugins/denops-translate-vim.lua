return {
    "skanehira/denops-translate.vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Translate",
    dependencies = {
        "vim-denops/denops.vim",
    },
    config = function()
        -- If `vim.opt.ambiwidth = "double"` is set, `vim.g.translate_border_chars` must be set.
        -- ref: https://github.com/skanehira/denops-translate.vim/issues/66
        vim.g.translate_border_chars = { "+", "-", "+", "|", "+", "-", "+", "|" }
    end,
    cond = false,
}
