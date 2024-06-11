--- Disable if there are no human rights
---@type boolean
local cond = require("core.global").is_human_rights

---@type table
local keys = {
    { "<C-j>", desc = "Toggle Kana-mode skkeleton" },
}

---@type table
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
    "delphinus/skkeleton_indicator.nvim",
    {
        "willelz/skk-tutorial.vim",
        cmd = "SKKTutorialStart",
    },
}

---@type LazySpec
local spec = {
    "vim-skk/skkeleton",
    --lazy = false,
    keys = keys,
    dependencies = dependencies,
    config = function()
        require("denops-lazy").load("skkeleton")
        require("skkeleton_indicator").setup({
            eijiHlName = "SkkeletonIndicatorEiji",
            hiraHlName = "SkkeletonIndicatorHira",
            kataHlName = "SkkeletonIndicatorKata",
            hankataHlName = "SkkeletonIndicatorHankata",
            zenkakuHlName = "SkkeletonIndicatorZenkaku",
            abbrevHlName = "SkkeletonIndicatorAbbrev",
            eijiText = "AZ",
            hiraText = "ひら",
            kataText = "カナ",
            hankataText = "ｶﾅ",
            zenkakuText = "ＡＺ",
            abbrevText = "abbr",
            border = "rounded",
            row = 0,
            col = 1,
            zindex = nil,
            alwaysShown = false,
            fadeOutMs = 3000,
            ignoreFt = {},
            bufFilter = function()
                return true
            end,
        })

        -- config
        vim.fn["skkeleton#config"] = {
            -- このオプションを有効にすると、Microsoft IME等と同様に
            -- 入力に失敗したローマ字がバッファに残るようになります。
            acceptIllegalResult = false,
            -- パスを指定すると補完候補の順番を記録するようになります。
            completionRankFile = "",
            -- データベースの保存先パスです。
            -- 空文字列でないときに有効になり、Deno KV を使って辞書をデータベース化し
            -- ます。データベースの構築には通常の読み込みよりも時間がかかりますが、デ
            -- ータベースはローカルなファイルに保存されるため、次回以降の起動は高速に
            -- なります。大きな辞書で特に有効です。
            -- データベースの構築は skkeleton の起動時に自動で行われます。mtime が以
            -- 前と変更された辞書のデータベースは更新します。手動で行うには
            -- |skkeleton#update_database()| を使ってください。
            databasePath = "",
            -- このオプションを有効にするとデバッグログが出力されるようになります。
            debug = false,
            -- このオプションを有効にすると
            -- 変換モードで改行キーを押した際に確定のみ行います。
            eggLikeNewline = false,
            -- 複数のグローバル辞書を使用する際に指定するオプションです。
            -- 指定する値はグローバル辞書のパスまたは
            -- パスとエンコーディングからなるタプルの配列になります。
            -- エンコーディングを指定しない場合は自動判定されます。
            -- (一般的な辞書で使われている EUC-JP と UTF-8 は認識可能なので指定しない
            -- のをおすすめします)
            -- 圧縮された辞書をそのまま使う機能はないため
            -- 辞書が圧縮されている場合は展開する必要があります。
            --    値の例: [["/usr/share/skk/SKK-JISYO.L", "euc-jp"],
            --             "~/.skk/SKK-JISYO.emoji"]
            globalDictionaries = {
                "~/.skk/SKK-JISYO.L",
                "~/.skk/SKK-JISYO.mimikun",
                "~/.skk/SKK-JISYO.bluearchive",
            },
            -- 複数のカナ変換テーブルを使用する際に指定するオプションです。
            -- 指定する値はグローバル辞書のパスまたは
            -- パスとエンコーディングからなるタプルの配列になります。
            -- エンコーディングを指定しない場合は自動判定されます。
            --    値の例: [["/usr/share/skk/azik_us.rule, "euc-jp"]]
            globalKanaTableFiles = {},
            -- このオプションを有効にすると
            -- 変換候補選択などで |skkeleton-functions-cancel| を使った際に
            -- 一気に未入力状態に戻るようになります。
            immediatelyCancel = true,
            -- このオプションを有効にすると
            -- 変換や確定の度にユーザー辞書を読み書きするようになります。
            -- 複数のVimインスタンスを同時に使う場合に有用かもしれません。
            immediatelyDictionaryRW = true,
            -- 有効にすると、送りあり変換時に直接「っ」を打った時点で
            -- タ行の送り仮名が打たれたと判断し変換を開始します。
            -- Note: ローマ時入力で連続入力で「っ」を入力する場合など、続く文字が
            --       入力される場合には影響しません。
            -- Note: 機能追加に際しタ行決め打ちにする根拠を調査して頂いたので
            --       載せておきます。
            --       https://blog.atusy.net/2023/08/01/skk-azik-and-sokuon-okuri/
            immediatelyOkuriConvert = true,
            -- 使用する仮名テーブルを指定します。
            -- 存在するテーブルのみ指定できます。存在しないテーブルを指定したい場合は
            -- |skkeleton#register_kanatable()| で先にテーブルを作成してください。
            kanaTable = "rom",
            -- このオプションを有効にすると無効化しても前回のモード(カナ入力状態等)
            -- を保持するようになります。
            keepMode = false,
            -- このオプションを有効にすると
            -- Insertモードを抜けても前回の状態を保持するようになります。
            keepState = false,
            -- 変換入力中であることを示すための文字を指定します。
            markerHenkan = "▽",
            -- 候補を選択している最中であることを示すため文字を指定します。
            markerHenkanSelect = "▼",
            -- このオプションを有効にすると
            -- カタカナ変換等の結果を辞書に登録するようになります。
            -- 補完機能を使っている場合などに便利だと思います。
            registerConvertResult = false,
            -- 候補を選択する際に使用するキーを指定します。
            -- x以外の半角英字7文字が使用できます。
            selectCandidateKeys = "asdfjkl",
            -- このオプションを有効にすると
            -- 変換や確定が行われる際にアンドゥポイントを切るようになります。
            setUndoPoint = true,
            -- このオプションの数の候補までは選択表示がされずに変換されます。
            showCandidatesCount = 4,
            -- 辞書サーバーのホスト名またはIPアドレスを指定します。
            skkServerHost = "127.0.0.1",
            -- 辞書サーバーのポート番号を指定します。
            skkServerPort = 1178,
            -- 辞書サーバーに渡す文字列のエンコード形式を指定します。
            skkServerReqEnc = "euc-jp",
            -- 辞書サーバーから受け取る文字列のエンコード形式を指定します。
            skkServerResEnc = "euc-jp",
            -- 使用する SKK 入力 source とその優先順位を指定します。ユーザー辞書はこ
            -- の指定によらず必ず使用されます。
            sources = { "skk_dictionary" },
            -- |skkeleton-config-globalDictionaries| によるグローバル辞書による変換を
            -- 有効にします。
            --sources = { "skk_dictionary" },
            --
            -- |skkeleton-config-globalDictionaries| によるグローバル辞書による変換を
            -- 有効にし、Deno KV によるキャッシュを行います。
            -- Note: |skkeleton-config-databasePath| の設定が必要です。
            -- Note: |g:denops#server#deno_args| に "--unstable-kv" の追加が必要です。
            --sources = { "deno_kv" },
            --
            -- 辞書サーバー機能による変換を有効にします。
            --sources = { "skk_server" },
            --
            -- Google 日本語入力 API による変換を有効にします。
            -- https://www.google.co.jp/ime/cgiapi.html
            -- Note: ネットワーク接続環境が必要です。
            -- Note: パフォーマンスの問題により補完には対応しません。
            --sources = { "google_japanese_input" },
            -- このオプションを有効にすると、変換候補がポップアップ表示されます。
            usePopup = true,
            -- 辞書サーバー機能を有効にします。
            useSkkServer = false,
            -- ユーザー辞書のパス
            -- JavaScriptの制約によりエンコーディングはUTF-8限定になります。
            userDictionary = "~/.skkeleton",
        }

        vim.fn["skkeleton#initialize"]()
        vim.notify("skkeleton initialized!", vim.log.levels.DEBUG)

        vim.keymap.set("n", "<C-j>", "<Plug>(skkeleton-toggle)")
        vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-toggle)")
        vim.keymap.set("c", "<C-j>", "<Plug>(skkeleton-toggle)")
    end,
    cond = cond,
}

return spec
