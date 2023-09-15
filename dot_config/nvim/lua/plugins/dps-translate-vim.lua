return {
    -- upstream has bug
    --"Omochice/dps-translate-vim",
    "mimikun/dps-translate-vim",
    branch = "fix-error",
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
