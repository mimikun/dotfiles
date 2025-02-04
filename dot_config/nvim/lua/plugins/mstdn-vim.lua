---@type LazySpec[]
local dependencies = {
    "vim-denops/denops.vim",
    "MeanderingProgrammer/render-markdown.nvim",
    "gw31415/mstdn-editor.vim",
    {
        "gw31415/denops-sixel-view.vim",
    },

    --[[
" Install denops-sixel-view
const s:FONTHEIGHT = 14
const s:FONTWIDTH = s:FONTHEIGHT / 2
const s:RETINA_SCALE = 2

" b:img_index holds how many images are currently displayed

function s:clear() abort
  if exists('b:img_index')
    unlet b:img_index
  endif
  call sixel_view#clear()
endfunction

function s:preview_cur_img(next) abort
  " Multiplier Calculation
  let ww = winwidth('.')
  let wh = winheight('.')
  let maxWidth = ww * s:FONTWIDTH / 2 * s:RETINA_SCALE
  let maxHeight = wh * s:FONTHEIGHT / 2 * s:RETINA_SCALE

  " Extract image URL
  let imgs = mstdn#timeline#status()['mediaAttachments']
      \ ->filter({_, v -> v['type'] == 'image'})
  if len(imgs) == 0
    lua vim.notify("No image found", vim.log.levels.ERROR)
    return
  endif

  " Update index of images
  " Loop by taking the remainder of b:img_index divided by the number of images
  if !exists('b:img_index')
    let b:img_index = 0
  else
    let b:img_index = b:img_index + a:next
  endif
  let index = b:img_index % len(imgs)
  if index < 0
    let index = len(imgs) + index
  endif

  let key = 'preview_url' " or 'url'
  let url = imgs[index][key]
  
  " Show Image
  call sixel_view#view(url, #{maxWidth: maxWidth, maxHeight: maxHeight}, 0, 0)
  " Close the image by moving the cursor
  au CursorMoved,CursorMovedI,BufLeave <buffer> ++once call s:clear()
endfunction
]]
}

local cmds = {
    -- :call mstdn#user#login("DOMAIN", "ACCESS_TOKEN")
    "MstdnLogin",
    -- :call mstdn#request#post("alice@mstdn.jp", #{status: "Hello, world!"})
    "MstdnPost",
    -- mstdn#user#logout({user})                                  *mstdn#user#logout()*
    -- "MstdnLogout"
    --[[
mstdn#user#login_users()                              *mstdn#user#login_users()*

    Retrieve a list of logged-in users.


mstdn#request#post({user}, {dict})                        *mstdn#request#post()*

    Post a new status to Mastodon.

    {user}        The username formatted as `[user]@[serveraddr]` to post the status.
    {dict}        A dictionary containing the status details.

mstdn#request#edit({dict}, {lnum}, {bufnr})               *mstdn#request#edit()*

    Edit an existing status.

    {dict}        Dictionary with updated status details.
    {lnum}        Line number of the status in buffer, defaults to current line.
    {bufnr}       Buffer number, defaults to current buffer.

mstdn#timeline#user({bufnr})                             *mstdn#timeline#user()*

    Display the user's timeline in a buffer.

    {bufnr}       Buffer number, defaults to current buffer.

mstdn#timeline#favourite({lnum}, {bufnr})           *mstdn#timeline#favourite()*

    Favorite a status.

    {lnum}        Line number of the status, defaults to current line.
    {bufnr}       Buffer number, defaults to current buffer.

mstdn#timeline#unfavourite({lnum}, {bufnr})       *mstdn#timeline#unfavourite()*

    Unfavorite a status.

    {lnum}        Line number of the status, defaults to current line.
    {bufnr}       Buffer number, defaults to current buffer.

mstdn#timeline#status_id({lnum}, {bufnr})           *mstdn#timeline#status_id()*

    Retrieve the status ID of a specific line.

    {lnum}        Line number of the status, defaults to current line.
    {bufnr}       Buffer number, defaults to current buffer.

mstdn#timeline#status({lnum}, {bufnr})                 *mstdn#timeline#status()*

    Get the status data in a buffer.

    {lnum}        Line number of the status, defaults to current line.
    {bufnr}       Buffer number, defaults to current buffer.

mstdn#timeline#reconnect({bufnr})                   *mstdn#timeline#reconnect()*

    Reconnect the timeline stream for the given buffer.

    {bufnr}       Buffer number, defaults to current buffer.

mstdn#timeline#redraw({bufnr})                         *mstdn#timeline#redraw()*

    Redraw the timeline in the specified buffer.

    {bufnr}       Buffer number, defaults to current buffer.

mstdn#timeline#reconnect_all()                  *mstdn#timeline#reconnect_all()*

    Reconnect all timeline streams.

mstdn#timeline#load_more({lnum}, {bufnr})           *mstdn#timeline#load_more()*

    Load more statuses in the timeline.

    {lnum}        Line number of the status, defaults to current line.
    {bufnr}       Buffer number, defaults to current buffer.

mstdn#timeline#buffers()                              *mstdn#timeline#buffers()*

    List all buffers' bufnr currently streaming timelines.

mstdn#timeline#status_defaults({bufnr})       *mstdn#timeline#status_defaults()*

    Generate the default value of CreateStatusParams according to the
    timeline.

    {bufnr}       Buffer number, defaults to current buffer.

==============================================================================
]]
}

---@type LazySpec
local spec = {
    "gw31415/mstdn.vim",
    --lazy = false,
    --cmd = "cmds",
    dependencies = dependencies,
    config = function()
        --autocmd BufReadCmd mstdn://* call s:mstdn_config()
        --function s:mstdn_config() abort
        -- Some preferences
        --setl nonu so=0 scl=yes

        -- Key mappings
        --nn <buffer> <enter> <cmd>call mstdn#timeline#load_more()<cr>
        --nn <buffer> <expr> G getcurpos()[1] == line('$') ? "\<cmd>call mstdn#timeline#load_more()\<cr>" : "\<cmd>norm! G\<cr>"
        --nn <buffer><nowait> > <cmd>call mstdn#timeline#favourite()<cr>
        --nn <buffer><nowait> < <cmd>call mstdn#timeline#unfavourite()<cr>
        --nn <buffer><nowait> <C-r> <cmd>call mstdn#timeline#reconnect()<cr>

        -- Configuration for mstdn-editor.vim
        --nn <buffer> i <Plug>(mstdn-editor-open)
        --endfunction
        -- auto reconnect
        --autocmd BufReadCmd mstdn://* call timer_start(1500, {-> mstdn#timeline#reconnect_all()}, #{repeat: -1})
    end,
    cond = false,
    enabled = false,
}

return spec
