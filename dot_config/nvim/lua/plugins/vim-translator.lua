local cmds = {
    "Translate",
    "TranslateW",
    "TranslateR",
    "TranslateX",
    "TranslateH",
    "TranslateL",
}

return {
    "voldikss/vim-translator",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    config = function()
        vim.g.translator_target_lang = "ja"
        vim.g.translator_default_engines = { "google" }
    end,
    cond = false,
}
