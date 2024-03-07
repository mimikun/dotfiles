// TODO:
const dotfyle_path = "../dot_config/nvim/dotfyle.json";
const readme_path = "../dot_config/nvim/README.md";

import jsonData from "../dot_config/nvim/dotfyle.json" with { type: "json" };
// 何のディストリ使ってるか eg: lazyvim, nvimdots
//const distribution = jsonData.distribution;
// キーマップ
const keymaps = jsonData.keymaps;
console.log(keymaps);
// LEADERキー
const leaderKey = jsonData.leaderKey;
console.log(leaderKey);
// LSPサーバー
const lspServers = jsonData.lspServers;
console.log(lspServers);
// Masonツール
const masonTools = jsonData.masonTools;
console.log(masonTools);
// プラグインマネージャ eg lazy.nvim, packer.nvim
const pluginManager = jsonData.pluginManager;
console.log(pluginManager);
// プラグイン
const plugins = jsonData.plugins;
console.log(plugins);
// tree-sitterパーサ
const treesitterParsers = jsonData.treesitterParsers;
console.log(treesitterParsers);


