-- Enable if there are no human rights
local cond = not require("core.global").is_human_rights

local keymaps = {
    { "<C-j>", desc = "Toggle Kana-mode eskk.vim" },
}

return {
    "vim-skk/eskk.vim",
    lazy = false,
    --event = "VeryLazy",
    keys = keymaps,
    config = function()
        -- TODO: config use lua
        -- sample:
        -- vim.g["fern#default_hidden"] = 1
        vim.cmd([[
            let g:eskk#directory = "~/.config/eskk"
            let g:eskk#dictionary = { 'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
            let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}

            "漢字変換した時に候補が1つの場合、自動的に確定する
            let g:eskk#kakutei_when_unique_candidate = 1
            "neocompleteを入れないと、1にすると動作しなくなるため0推奨
            let g:eskk#enable_completion = 0
            "デフォルトのマッピングを削除
            let g:eskk#no_default_mappings = 1
            "ノーマルモードに戻るとeskkモードを初期値にする
            let g:eskk#keep_state = 0
            "漢字変換を確定しても改行しない。
            let g:eskk#egg_like_newline = 1

            "表示文字を変更
            let g:eskk#marker_henkan = "[変換]"
            let g:eskk#marker_henkan_select = "[選択]"
            let g:eskk#marker_okuri = "[送り]"
            let g:eskk#marker_jisyo_touroku = "[辞書]"
        ]])
    end,
    cond = cond,
}
