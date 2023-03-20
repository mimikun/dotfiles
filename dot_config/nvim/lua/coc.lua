--ref: https://oroques.dev/2020/01/07/neovim-05.html
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- coc.nvim settings
-- <tab> と<Shift-tab> でナビゲートするやつ
cmd([[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
]])

-- Insert <tab> when previous text is space, refresh completion if not.
cmd([[
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
]])
cmd([[inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]])

-- VSCodeライクなタブ補完
--cmd([[
--[[
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()
]]
--)
--cmd([[
--[[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]]
--)
--cmd([[let g:coc_snippet_next = '<tab>']])

-- coc.nvim settings
g.coc_global_extensions = {
    'coc-html',
    'coc-jedi',
    'coc-solargraph',
    'coc-git',
    'coc-json',
    'coc-rust-analyzer',
    'coc-snippets'
}
