-- coc.nvim settings
-- <tab> と<Shift-tab> でナビゲートするやつ
vim.cmd([[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
]])

-- Insert <tab> when previous text is space, refresh completion if not.
vim.cmd([[
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
]])
vim.cmd([[inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]])

-- VSCodeライクなタブ補完
--vim.cmd([[
--[[
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()
]]
--)
--vim.cmd([[
--[[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]]
--)
--vim.g.coc_snippet_next = '<tab>'

-- coc.nvim settings
vim.g.coc_global_extensions = {
    "coc-css",
    "coc-deno",
    "coc-eslint",
    "coc-git",
    "coc-html",
    "coc-jest",
    "coc-json",
    "coc-prettier",
    "coc-pyright",
    "coc-rust-analyzer",
    "coc-snippets",
    "coc-solargraph",
    "coc-tsserver",
    "coc-yaml",
    "coc-zls",
}
