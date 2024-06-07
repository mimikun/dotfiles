-- Enable if there are no human rights
---@type boolean
local cond = not require("core.global").is_human_rights

---@type table
local keys = {
    { "<C-j>", desc = "Toggle Kana-mode eskk.vim" },
}

---@type LazySpec
local spec = {
    "vim-skk/eskk.vim",
    lazy = false,
    keys = keys,
    config = function()
        -- eskkのconfig directory
        vim.g["eskk#directory"] = "~/.config/eskk"
        -- ユーザー辞書
        vim.g["eskk#dictionary"] = {
            path = "~/.skk/SKK-JISYO.mimikun",
            sorted = 1,
            encoding = "utf-8",
        }
        -- SKK-JISYO.L
        vim.g["eskk#large_dictionary"] = {
            path = "~/.skk/SKK-JISYO.L",
            sorted = 1,
            encoding = "euc-jp",
        }
        -- 漢字変換した時に候補が1つの場合、自動的に確定する
        vim.g["eskk#kakutei_when_unique_candidate"] = 1
        -- neocompleteを入れないと、1にすると動作しなくなるため0推奨
        vim.g["eskk#enable_completion"] = 0
        -- デフォルトのマッピングを削除
        vim.g["eskk#no_default_mappings"] = 1
        -- ノーマルモードに戻るとeskkモードを初期値にする
        vim.g["eskk#keep_state"] = 0
        -- 漢字変換を確定しても改行しない。
        vim.g["eskk#egg_like_newline"] = 1
        -- 表示文字を変更
        vim.g["eskk#marker_henkan"] = "[変換]"
        vim.g["eskk#marker_henkan_select"] = "[選択]"
        vim.g["eskk#marker_okuri"] = "[送り]"
        vim.g["eskk#marker_jisyo_touroku"] = "[辞書]"
    end,
    cond = cond,
}

return spec
