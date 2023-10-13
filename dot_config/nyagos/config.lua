-- プロンプト表示のタイミングでキーバッファをクリア
nyagos.option.cleanup_buffer = true

-- ファイル名補完に隠しファイルも含める
nyagos.option.completion_hidden = true

-- ファイル名補完でスラッシュを使う
nyagos.option.completion_slash = true

-- 外部コマンドにおいてもワイルドカード展開を有効にする
nyagos.option.glob = true

-- 外部コマンド向けのワイルドカード展開でディレクトリ名区切りに`\`ではなく`/` を使う
--nyagos.option.glob_slash=true,set -o glob_slash

-- 外部コマンド向けのワイルドカード展開でディレクトリ名区切りに `\` を使う
--nyagos.option.glob_slash=false,set +o glob_slash

-- サロゲートペアな文字を `<NNNN>` と表記する
nyagos.option.output_surrogate_pair = false

-- リダイレクトでの上書きを許可
nyagos.option.noclobber = false

-- 標準入力からコンソール扱いでコマンドを読み込む (編集機能が有効になる)
nyagos.option.read_stdin_as_file = false

-- `~` の置換を無効にする
nyagos.option.tilde_expansion = false

-- バッチファイルにNYAGOS側の環境変数を変更させることを許可する
nyagos.option.usesource = true
