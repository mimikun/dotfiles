return {
    "Omochice/dps-translate-vim",
    dependencies = {
        "vim-denops/denops.vim",
    },
    cmd = {
        "Translate",
    },
    config = function()
        vim.g.dps_translate_source = "en"
        vim.g.dps_translate_target = "ja"
    end,
    --cond = false,
}
