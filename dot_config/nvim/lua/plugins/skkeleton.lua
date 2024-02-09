local global = require("core.global")
local is_human_rights = global.is_human_rights

local keymaps = {
    { "<C-j>", desc = "Toggle Kana-mode skkeleton" },
}

return {
    "vim-skk/skkeleton",
    --lazy = false,
    --event = "VeryLazy",
    keys = keymaps,
    dependencies = {
        "vim-denops/denops.vim",
        "delphinus/skkeleton_indicator.nvim",
        {
            "willelz/skk-tutorial.vim",
            cmd = "SKKTutorialStart",
        },
    },
    config = function()
        local skkeleton_indicator = require("skkeleton_indicator")
        skkeleton_indicator.setup({
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

        -- TODO: setting
        -- https://github.com/vim-skk/skkeleton/blob/main/doc/skkeleton.jax

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
    -- Disable if there are no human rights
    --cond = is_human_rights,
    cond = false,
}

--------------------------------------------------------------------------------
--                                              *skkeleton#register_kanatable()*
--skkeleton#register_kanatable({tableName}, {table} [, {create}])
--        仮名入力のテーブルを登録できます。
--        {tableName}で指定したテーブルに{table}で指定した辞書の定義が登録されま
--        す。{create}が指定されていない場合は存在しないテーブル名を指定すると
--        エラーになります。
--        {table}の要素には以下の物が使用できます:
--                文字列:
--                        |skkeleton-functions| に示される機能を割り当てます。
--                1要素あるいは2要素の文字列から成る配列:
--                        仮名定義を割り当てます。
--                        1番目の要素は入力される仮名を示します。
--                        2番目の要素は仮名が入力される際に追加で入力される
--                        文字を示します。省略すると空文字列になります。
--                        (ttで「っ」を入力する際などに使用されます)
-->
--    " 例
--    call skkeleton#register_kanatable('rom', {
--          \ 'hh': ['お', 'h'],
--          \ 'jj': 'escape',
--          \ 'z,': ['―'],
--          \ })
--    " ヘボン式入力
--    call skkeleton#register_kanatable('rom', {
--          \   'mb': ['ん', 'b'],
--          \   'mm': ['ん', 'm'],
--          \   'mp': ['ん', 'p'],
--          \   'tch': ['っ', 'ch'],
--          \ })
--    " 句読点を全角英字に変える
--    call skkeleton#register_kanatable('rom', {
--          \   ',': ['，', ''],
--          \   '.': ['．', ''],
--          \ })
--<
--                                                 *skkeleton#register_keymap()*
--skkeleton#register_keymap({state}, {key}, {funcName})
--        ステート単位のキーマップを定義します。
--        {state}で指定したステートの{key}に{funcName}で指定した機能が
--        |skkeleton-functions| より割り当てられます。
--        {funcName}に |falsy| な値を指定するとマッピングを削除します。
--
--        {state}は以下の物が指定できます:
--                input
--                henkan
-->
--    " 例: 変換モードでxを<BS>に移動します
--    call skkeleton#register_keymap('henkan', "\<BS>", 'henkanBackward')
--    call skkeleton#register_keymap('henkan', "x", '')
--<
--------------------------------------------------------------------------------
--                                                     *g:skkeleton#mapped_keys*
--g:skkeleton#mapped_keys
--        (デフォルト `skkeleton#get_default_mapped_keys()`の返値)
--        skkeletonにマッピングするキーの配列です。ここにキーを追加すると
--        |skkeleton#register_keymap()|で指定できるようになります。
-->
--    " 例: <C-l>で全角モードに入れるようにします
--    call add(g:skkeleton#mapped_keys, '<C-l>')
--    call skkeleton#register_keymap('input', '<C-l>', 'zenkaku')
--
--==============================================================================
--FAQ                                                            *skkeleton-faq*
--
--変換ができない~
--
--変換を行うにはSKK用の辞書のダウンロード及びパスの設定が必要になります。
--https://skk-dev.github.io/dict/ で管理されているL辞書をダウンロードして
--展開するのをおすすめします。
--展開後は|skkeleton-config-globalDictionaries|に展開したパスの指定をしてくださ
--い。
--
--skkeleton のロード処理が遅い~
--
--デフォルトでは初回利用時にロードしますが、その間Vimをブロックしてしまいます。
--|skkeleton#initialize()| で明示的に初期化するようにしてください。
--
--変換ポイントの描画が乱れる~
--
--SKKではデフォルトで変換ポイントとして逆三角形を使いますが、この文字は
--'ambiwidth'の対象になっています。
--そのためVimとターミナルやフォントの設定がずれていると描画が乱れます。
--'ambiwidth'の設定を変更するか|skkeleton-config-markerHenkan|及び
--|skkeleton-config-markerHenkanSelect|を'ambiwidth'の対象外に
--変更してみてください。
--
--プラグインと干渉する~
--
--skkeletonを有効化、無効化する際にフックが使えますので
--プラグイン側で一時的に機能を無効化するという方法があります。
-->
--    " coc.nvimの例
--    augroup skkeleton-coc
--      autocmd!
--      autocmd User skkeleton-enable-pre let b:coc_suggest_disable = v:true
--      autocmd User skkeleton-disable-pre let b:coc_suggest_disable = v:false
--    augroup END
--<
--sticky keyの挙動をeskk.vimに合わせる~
--
--|eskk.vim|ではsticky keyを使用している際に「察し」を「;sass;i」で入力できま
--す。
--しかしskkeletonではsticky keyを仮名テーブルに配置しているため「;sass;si」と
--入力しないといけなくなっています。以下の設定を記述すると挙動を前者に寄せられ
--ます。
--
-->
--    call skkeleton#register_keymap('input', ';', 'henkanPoint')
--<
--新辞書形式 (JISYO) について~
--
--skkeletonでは旧来の ddskkにある辞書形式の他に JISYO形式と呼ばれる JSON/ YAMLで
--整形された辞書形式をサポートしています。これらは、SKK-JISYO.L.yamlのように
--拡張子に yaml, yml, json, mpk (msgpack) のいずれかが指定されているとき有効化さ
--れます。
--くわしくは、https://github.com/skk-dict/jisyo を参照してください。
--
--skkeleton有効時にカーソルの色がlCursorにならない~
--
--skkeletonは|:lmap|を使用しなくなりました。カーソルの色を動的に変更したい場合は
--以下のような設定をする必要があります。
--
-->
--    augroup skkeleton-cursor
--      autocmd!
--      autocmd User skkeleton-enable-pre
--            \ highlight Cursor       gui=NONE guibg=#80403f guifg=fg
--      autocmd User skkeleton-disable-pre
--            \ highlight Cursor       gui=NONE guibg=#606060 guifg=fg
--    augroup END
--<
--端末モードで補完が上手く動かない~
--
--補完を含めて上手く動作させるためにはバッファの状態と内部状態が一致しているかを
--調べる必要がありますが、端末のアプリケーションの出力でこれを行うのは困難なので
--無効化しています。
--
--==============================================================================
--COMPATIBILITY                                        *skkeleton-compatibility*
--
--2024-01-11~
--- "globalJisyo" オプションと "globalJisyoEncoding" オプションの削除
--- "userJisyo" オプションは "userDictionary" オプションに変更
--- "immediatelyJisyoRW" オプションは "immediatelyDictionaryRW" オプションに変更
--
--2024-01-10~
--- 使用する辞書は "sources" オプションにより指定するように
--
--2023-12-30~
--- 補完の後処理と端末モードの相性が悪いので一旦無効化
--
--vim:tw=78:fo=tcq2mM:ts=8:ft=help:norl
--------------------------------------------------------------------------------
--HOOKS                                                        *skkeleton-hooks*
--
--Vimのautocmd機能によるフック機能を提供しています。
--`autocmd User skkeleton-enable-pre echo "enable pre"`
--のように呼び出せます。
--
--skkeleton-initialize-pre                            *skkeleton-initialize-pre*
--
--        skkeletonが最初に有効化された際に実行されます。
--        |denops.vim|のランタイムはVimと独立して再起動する場合があり、設定も
--        消えてしまいますが、その場合はもう一度このフックも実行されるので
--        こちらのフックを利用して設定を行うことをおすすめします。
-->
--    " 例
--    function! s:skkeleton_init() abort
--      call skkeleton#config({
--        \ 'eggLikeNewline': v:true
--        \ })
--      call skkeleton#register_kanatable('rom', {
--        \ "z\<Space>": ["\u3000", ''],
--        \ })
--    endfunction
--    augroup skkeleton-initialize-pre
--      autocmd!
--      autocmd User skkeleton-initialize-pre call s:skkeleton_init()
--    augroup END
--<
--skkeleton-initialize-post                          *skkeleton-initialize-post*
--
--        skkeletonが最初に有効化された後に実行されます。
--
--skkeleton-disable-pre                                  *skkeleton-disable-pre*
--
--        skkeletonが無効化される前に毎回実行されます。
--
--skkeleton-disable-post                                *skkeleton-disable-post*
--
--        skkeletonが無効化された後に毎回実行されます。
--
--skkeleton-enable-pre                                    *skkeleton-enable-pre*
--
--        skkeletonが有効化される前に毎回実行されます。
--
--skkeleton-enable-post                                  *skkeleton-enable-post*
--
--        skkeletonが有効化された後に毎回実行されます。
--
--skkeleton-mode-changed                                *skkeleton-mode-changed*
--
--        モードが切り替わった際に呼び出されます。
--        呼び出しの際は `g:skkeleton#mode` に |skkeleton#mode()| の結果と
--        同じ物が代入されます。
-->
--    " 例
--    augroup skkeleton-mode-changed
--      autocmd!
--      autocmd User skkeleton-mode-changed redrawstatus
--    augroup END
--<
--skkeleton-handled                                          *skkeleton-handled*
--
--        入力がハンドリングされた後に呼び出されます。
--        呼び出しの前に|g:skkeleton#state|に状態が代入されます。
--
--------------------------------------------------------------------------------
--<Plug>(skkeleton-toggle) (ic)                       *<Plug>(skkeleton-toggle)*
--
--        skkeletonの有効、無効を切り替えます。  >
--
--    " 例
--    imap <C-j> <Plug>(skkeleton-toggle)
--    cmap <C-j> <Plug>(skkeleton-toggle)
--    tmap <C-j> <Plug>(skkeleton-toggle)
--<
--有効時のマッピングは以下の通りです。
--こちらの定義は|skkeleton#register_keymap()|で変更できます
--
--
--input:
--        <BS>      : |skkeleton-functions-deleteChar|
--        <C-g>     : |skkeleton-functions-cancel|
--        <C-h>     : |skkeleton-functions-deleteChar|
--        <C-q>     : |skkeleton-functions-hankatakana|
--        <CR>      : |skkeleton-functions-newline|
--        <Esc>     : |skkeleton-functions-escape|
--        <NL>      : |skkeleton-functions-kakutei|
--henkan:
--        <C-g>     : |skkeleton-functions-cancel|
--        <CR>      : |skkeleton-functions-newline|
--        <NL>      : |skkeleton-functions-kakutei|
--        <Space>   : |skkeleton-functions-henkanForward|
--        X         : |skkeleton-function-purgeCandidate|
--        x         : |skkeleton-function-henkanBackward|
--
--------------------------------------------------------------------------------
---- API
---- skkeletonが有効化されているかどうかを返します。
--local is_enabled = vim.fn["skkeleton#is_enabled"]()
--print(is_enabled)
--
---- 現在のモードを以下のように返します。
---- 無効化されている場合は空文字を返します。
----  "hira":    ひらがな
----  "kata":    カタカナ
----  "hankata": 半角カタカナ
----  "zenkaku": 全角英数
----  "abbrev":  abbrev
--local mode = vim.fn["skkeleton#mode"]()
--print(mode)
--
---- 最後にハンドリングが実行された際の状態から生成される値です。
---- 以下の内容から構成されます
----
---- phase: 入力の段階
----  "input"            直接入力
----  "input:okurinasi"  送りなし入力
----  "input:okuriari"   送りあり入力
----  "henkan"           変換
----  "escape"           escapeした際
--local state = vim.fn["skkeleton#state"]()
--print(state)
