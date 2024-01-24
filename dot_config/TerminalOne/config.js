const os = require("os");

module.exports = {
  // ウィンドウの背景にアクリル効果を使用するかどうか。これは Mac と Win 11 でのみサポートされます。
  acrylic: true,

  // スクロールバック バッファーに保持する行数。
  scrollback: 10000,

  // 選択時にテキストをクリップボードにコピーするかどうか。
  copyOnSelect: true,

  // カーソルを点滅させるかどうか。
  cursorBlink: true,

  // カーソルのスタイル。有効な値は、「block」、「underline」、「bar」です。
  cursorStyle: "bar",

  // カーソルの幅 (ピクセル単位)。
  cursorWidth: 1,

  // ピクセル単位のフォント サイズ。
  fontSize: 16,

  // フォントファミリー。 CSS構文に従います。
  fontFamily: "Consolas, Menlo, monospace",

  // 通常のテキストのフォントの太さ。有効な値は、100 の倍数の 100 ～ 900 です。
  fontWeight: 400,

  // 太字テキストのフォントの太さ。有効な値は、100 の倍数の 100 ～ 900 です。
  fontWeightBold: 700,

  // ピクセル単位の文字間隔。
  letterSpacing: 1,

  // フォント サイズに応じた行の高さ。
  lineHeight: 1,

  // 各端末内のピクセル単位のパディング。
  terminalContentPadding: {
    top: 8,
    right: 8,
    bottom: 8,
    left: 8,
  },

  // 各端末の境界線の幅 (ピクセル単位)。
  terminalBorderWidth: 1,

  // 各ターミナルがアクティブなときの境界線の色。
  terminalBorderColorActive: "foreground",

  // 非アクティブ時の各端末の境界線の色。
  terminalBorderColorInactive: "background",

  // カラースキームの設定
  // デフォルト: https://rosepinetheme.com/
  colorScheme: {
    cursor: "#56526e",
    cursorAccent: "#e0def4",

    selectionBackground: "#312f44",
    selectionForeground: "#e0def4",
    selectionInactiveBackground: "#312f44",

    background: "#232136",
    foreground: "#e0def4",

    black: "#393552",
    blue: "#9ccfd8",
    cyan: "#ea9a97",
    green: "#3e8fb0",
    magenta: "#c4a7e7",
    red: "#eb6f92",
    white: "#e0def4",
    yellow: "#f6c177",

    brightBlack: "#817c9c",
    brightBlue: "#9ccfd8",
    brightCyan: "#ea9a97",
    brightGreen: "#3e8fb0",
    brightMagenta: "#c4a7e7",
    brightRed: "#eb6f92",
    brightWhite: "#e0def4",
    brightYellow: "#f6c177",
  },

  // ターミナルで使用されるすべてのシェルの構成。
  shells: [
    {
      // シェル名
      name: "Default",

      // シェルを起動するために使用されるコマンド。これが空の場合、システム シェルを自動検出します。
      command: "",

      // シェルを起動するディレクトリへのパス。これが空の場合は、ホーム ディレクトリが自動的に検出されます。
      startupDirectory: "",
    },
  ],

  // 使用するデフォルトのシェルの名前。これは、「シェル」で定義された名前のいずれかと一致する必要があります。
  defaultShellName: "Default",

  // リーダーキーとして使用するキーバインド
  // このキーバインドは、他のすべてのキーバインドをトリガーするために使用される
  // このキーバインドを 2 回押すと、リーダーが「エスケープ」され、キーがターミナルに送信される
  keybindLeader: "ctrl+q",

  // ターミナルに使用するキーバインド
  // これらのキーバインドは、リーダー キーが押されてから 1 秒以内にのみアクティブになる
  keybinds: {
    createTab: "c",
    closeTab: "shift+&",
    nextTab: "n",
    previousTab: "p",
    tab1: "1",
    tab2: "2",
    tab3: "3",
    tab4: "4",
    tab5: "5",
    tab6: "6",
    tab7: "7",
    tab8: "8",
    tab9: "9",
    splitHorizontal: "shift+%",
    splitVertical: 'shift+"',
    focusPaneLeft: "h",
    focusPaneRight: "l",
    focusPaneUp: "k",
    focusPaneDown: "j",
    closePane: "x",
  },
};
