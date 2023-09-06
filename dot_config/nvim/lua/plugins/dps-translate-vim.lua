return {
    "Omochice/dps-translate-vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = {
        "Translate",
    },
    dependencies = {
        "vim-denops/denops.vim",
    },
    config = function()
        vim.g.dps_translate_source = "en"
        vim.g.dps_translate_target = "ja"
    end,
    --cond = false,
}
