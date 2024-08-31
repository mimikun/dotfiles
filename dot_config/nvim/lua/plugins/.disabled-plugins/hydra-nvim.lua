-- TODO: run `:h hydra`
---@type LazySpec
local spec = {
    "anuvyklack/hydra.nvim",
    lazy = false,
    --keys = "",
    --dependencies = { "nvim-tree/nvim-web-devicons" },
    --config = function() end,
    cond = false,
    enabled = false,
}

return spec

--[[
現在のウィンドウのサイズを変更したいとします。
Vim では、`<C-w>+`、`<C-w>-`、`<C-w><`、`<C-w>>` バインディングを使用してこれを行うことができます。
つまり、`<C-w>+<C-w>+<C-w>+<C-w><<C-w><<C-w><...` を必要な回数だけ押す必要があります (カウント プレフィックスについては知っていますが、私はそれらを好きではありません)。
Hydra では、`<C-w>` を 1 回押すだけで、プレフィックスを再度押すことなく、任意の `<C-w>...` バインディングにアクセスできます: `<C-w>+++++--<<<<`。
または、バッファの横スクロール: `zlzlzlzlzlzl...` の代わりに `zllllllllllhhhl` を押すと、バッファを左右に自由にスクロールできます。
ヒドラにバインドする以外のキーは、ヒドラの状態を停止し、必要な処理を実行します。

Hydra では、そのようなキーバインドのグループにカスタム ヒントを割り当てて、何ができるかを簡単に確認できるようにすることもできます。

--------------------------------------------------------------------------------

サンプル ヒドラ
横スクロール
自動生成されたヒントを使用して画面を横にスクロールするシンプルなヒドラ。

```lua
local Hydra = require('hydra')
Hydra({
   name = 'Side scroll',
   mode = 'n',
   body = 'z',
   heads = {
      { 'h', '5zh' },
      { 'l', '5zl', { desc = '←/→' } },
      { 'H', 'zH' },
      { 'L', 'zL', { desc = 'half screen ←/→' } },
   }
})
```

GIT

本格的な git の「サブモード」。
コードは膨大ですが、シンプルです。
この Hydra には次のプラグインが必要です。

- Gitsigns    https://github.com/lewis6991/gitsigns.nvim
- Neogit    https://github.com/TimUntersberger/neogit

```lua
local Hydra = require('hydra')
local gitsigns = require('gitsigns')

local hint = [[
_J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
_K_: prev hunk   _u_: undo stage hunk   _p_: preview hunk   _B_: blame show full
^ ^              _S_: stage buffer      ^ ^                 _/_: show base file
^
^ ^              _<Enter>_: Neogit              _q_: exit
] ]

Hydra({
hint = hint,
config = {
  color = 'pink',
  invoke_on_body = true,
  hint = {
     position = 'bottom',
     border = 'rounded'
  },
  on_enter = function()
     vim.bo.modifiable = false
     gitsigns.toggle_signs(true)
     gitsigns.toggle_linehl(true)
  end,
  on_exit = function()
     gitsigns.toggle_signs(false)
     gitsigns.toggle_linehl(false)
     gitsigns.toggle_deleted(false)
     vim.cmd 'echo' -- clear the echo area
  end
},
mode = {'n','x'},
body = '<leader>g',
heads = {
  { 'J', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gitsigns.next_hunk() end)
        return '<Ignore>'
     end, { expr = true } },
  { 'K', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gitsigns.prev_hunk() end)
        return '<Ignore>'
     end, { expr = true } },
  { 's', ':Gitsigns stage_hunk<CR>', { silent = true } },
  { 'u', gitsigns.undo_stage_hunk },
  { 'S', gitsigns.stage_buffer },
  { 'p', gitsigns.preview_hunk },
  { 'd', gitsigns.toggle_deleted, { nowait = true } },
  { 'b', gitsigns.blame_line },
  { 'B', function() gitsigns.blame_line{ full = true } end },
  { '/', gitsigns.show, { exit = true } }, -- show the base of the file
  { '<Enter>', '<cmd>Neogit<CR>', { exit = true } },
  { 'q', nil, { exit = true, nowait = true } },
}
})
```

MORE ヒドラ

プロジェクトの wiki でさらに多くのヒドラを見つけることができます:
https://github.com/anuvyklack/hydra.nvim/wiki

自由に独自のヒドラを追加したり、既存のものを編集したりできます。
]]
