---@type table
local events = { "BufReadPre", "BufNewFile" }

---@type LazySpec
local spec = {
    "akinsho/bufferline.nvim",
    lazy = false,
    --cmd = "CMDNAME",
    --keys = "",
    event = events,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    --opts = {},
    init = function()
        vim.opt.mousemoveevent = true
    end,
    config = function(_, opts)
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                mode = "buffers",
                style_preset = bufferline.style_preset.minimal,
                themable = false,
                numbers = "ordinal",
                -- Close with the close button
                close_command = "bdelete! %d",
                -- Right click to split vertically
                right_mouse_command = "vertical sbuffer %d",
                -- TODO: left click
                left_mouse_command = nil,
                -- Middle click to close
                middle_mouse_command = "bdelete! %d",
                indicator = {
                    -- TODO: Use utils/icons.lua
                    icon = "▎",
                    style = "icon",
                },
                -- TODO: Use utils/icons.lua
                buffer_close_icon = "󰅖",
                -- TODO: Use utils/icons.lua
                modified_icon = "●",
                -- TODO: Use utils/icons.lua
                close_icon = "",
                -- TODO: Use utils/icons.lua
                left_trunc_marker = "",
                -- TODO: Use utils/icons.lua
                right_trunc_marker = "",
                max_name_length = 18,
                max_prefix_length = 15,
                truncate_names = true,
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    return "(" .. count .. ")"
                end,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true,
                    },
                },
                color_icons = true,
                get_element_icon = function(element)
                    local icon, hl =
                        require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
                    return icon, hl
                end,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                show_duplicate_prefix = true,
                duplicates_across_groups = true,
                persist_buffer_sort = true,
                move_wraps_at_ends = false,
                --[[ TODO:
                --separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
                ]]
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                auto_toggle_bufferline = true,
                -- TODO:
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" },
                },
                --[[ XXX::
            sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
                -- add custom logic
                return buffer_a.modified > buffer_b.modified
            end
            ]]
            },
        })
    end,
    --config = true,
    --cond = false,
}

return spec

--[[

==============================================================================
STYLING                                                  *bufferline-styling*

You can change the appearance of the bufferline separators by setting the
`separator_style`. The available options are:
* `slant` - Use slanted/triangular separators
* `padded_slant` - Same as `slant` but with extra padding which some terminals require.
  If `slant` does not render correctly for you try padded this instead.
* `slope` - Use slanted/triangular separators but slopped to the right
* `padded_slope` - Same as `slope` but with extra padding which some terminals require.
  If `slope` does not render correctly for you try padded this instead.
* `thick` - Increase the thickness of the separator characters
* `thin` - (default) Use thin separator characters
* finally you can pass in a custom list containing 2 characters which will be
  used as the separators e.g. `{"|", "|"}`, the first is the left and the
  second is the right separator

==============================================================================
TABPAGES                                                          *bufferline-tabpages*

This plugin can also be set to show only tabpages. This can be done by setting
the `mode` option to `tabs`. This will change the bufferline to a tabline it
has a lot of the same features/styling but not all. A few things to note are

* Sorting doesn't work yet as that needs to be thought through.
* Grouping doesn't work yet as that also needs to be thought through.

`BufferLineTabRename`

Tabs can be renamed using the `BufferLineTabRename` command:

e.g.

- Rename the current tab: `BufferLineTabRename Code`
- Rename a tab based on it's `tabnr`: `BufferLineTabRename 1 Code`

==============================================================================
LSP DIAGNOSTICS                                         *bufferline-diagnostics*

By setting `diagnostics = "nvim_lsp" | "coc"` you will get an indicator in the
bufferline for a given tab if it has any errors This will allow you to
tell at a glance if a particular buffer has errors. Currently only the
native neovim lsp is supported, mainly because it has the easiest API for
fetching all errors for all buffers (with an attached lsp client) This
feature is _WIP_ so beware and report any issues if you find any.

In order to customise the appearance of the diagnostic count you can pass
a custom function in your setup.

>lua
    -- rest of config ...

    --- count is an integer representing total count of errors
    --- level is a string "error" | "warning"
    --- this should return a string
    --- Don't get too fancy as this function will be executed a lot
    diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or ""
        return " " .. icon .. count
    end
<

The highlighting for the filename if there is an error can be changed by
replacing the highlights for `error`, `error_visible`, `error_selected`,
`warning`, `warning_visible`, `warning_selected`.

The diagnostics indicator can be set to `false` to remove the indicators
completely whilst still keeping the highlight of the buffer name.

LSP indicators can additionally be reported conditionally, based on buffer
context. For instance, you could disable reporting LSP indicators for the
current buffer and only have them appear for other buffers.
>lua
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
        if context.buffer:current() then
            return ''
        end

        return ''
    end
<

==============================================================================
GROUPS                                                      *bufferline-groups*

The buffers this plugin shows can be grouped based on a users configuration.
Groups are a way of allowing a user to visualize related buffers in clusters as
well as operating on them together e.g. by clicking the group indicator all
grouped buffers can be hidden. They are partially inspired by google chrome's,
tabs as well as centaur tab's groups.

In order to group buffers specify a list of groups in your config e.g.
>lua
  groups = {
    options = {
      toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
    },
    items = {
      {
        name = "Tests", -- Mandatory
        highlight = {underline = true, sp = "blue"}, -- Optional
        priority = 2, -- determines where it will appear relative to other groups (Optional)
        icon = "", -- Optional
        matcher = function(buf) -- Mandatory
          return buf.filename:match('%_test') or buf.filename:match('%_spec')
        end,
      },
      {
        name = "Docs",
        highlight = {undercurl = true, sp = "green"},
        auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
        matcher = function(buf)
          return buf.filename:match('%.md') or buf.filename:match('%.txt')
        end,
        separator = { -- Optional
          style = require('bufferline.groups').separator.tab
        },
      }
    }
  }
<

==============================================================================
ORDERING GROUPS                                   *bufferline-ordering-groups*

Groups are ordered by their position in the `items` list, the first group shows
at the start of the bufferline and so on. You might want to order groups
around the un-grouped buffers e.g.
>
    | group 1 | buf 1 (ungrouped) | buf 2 (ungrouped) | group 2 |
<
In this case built-in groups are provided (for now just the `ungrouped`)
built-in so you can achieve the order above using

>lua
  local groups = require('bufferline.groups')
  groups = {
    items = {
      {name = "group 1", ... },
      groups.builtin.ungrouped, -- the ungrouped buffers will be in the middle of the grouped ones
      {name = "group 2", ...},
    }
  }
<

==============================================================================
GROUP COMMANDS                                     *bufferline-group-commands*

Grouped buffers can also be interacted with using a few commands namely
* `:BufferLineGroupClose` <tab> - which will close all buffers in this group
* `:BufferLineGroupToggle` <tab> - which will hide or show a group

Other group related functionality can be implemented using the
`require('bufferline').group_action` API.

e.g.
>lua
    function _G.__group_open()
        require('bufferline').group_action(<GROUP_NAME>, function(buf)
            vim.cmd('vsplit '..buf.path)
        end)
    end
<

==============================================================================
PINNING BUFFERS                                           *bufferline-pinning*

Buffers can be pinned to the start of the bufferline by using the
`:BufferLineTogglePin` command, this will override other groupings or sorting
order for the buffer and position it left of all other buffers.

Pinned buffers are essentially a builtin group that positions the assigned
elements. The icons and highlights for pinned buffers can be changed similarly
to other groups e.g.

>lua
 config = {
    options = {
        groups = {
            items = {
                require('bufferline.groups').builtin.pinned:with({ icon = "" })
                ... -- other items
            }
        }
    }
 }
<

==============================================================================
SORTING					               *bufferline-sorting*

Bufferline allows you to sort the visible buffers by `extension` or `directory`: >vim

    " Using vim commands
    :BufferLineSortByExtension
    :BufferLineSortByDirectory
    :BufferLineSortByTabs

    -- Or using lua functions
    :lua require'bufferline'.sort_by('extension')`
    :lua require'bufferline'.sort_by('directory')`
    :lua require'bufferline'.sort_by('tabs')`

By default bufferline will sort by buffer number which is an integer value
provided by vim to identify a buffer that increases as new buffers are opened
this means that new buffers are placed at the end of the bufferline.

For more advanced usage you can provide a custom compare function which
will receive two buffers to compare. You can see what fields
are available to use using >lua

    sort_by = function(buffer_a, buffer_b)
        print(vim.inspect(buffer_a))
        -- add custom logic
        return buffer_a.modified > buffer_b.modified
    end
<

When using a sorted bufferline it's advisable that you use the
`BufferLineCycleNext` and `BufferLineCyclePrev` commands since these will
traverse the bufferline bufferlist in order whereas `bnext` and `bprev` will
cycle buffers according to the buffer numbers given by vim.

==============================================================================
FILTERING                                           *bufferline-filtering*

Bufferline can be configured to take a custom filtering function via the
`custom_filter` option. This value must be a lua function that will receive
each buffer number that is going to be used for the bufferline, as well as all the others.
A user can then check whatever they would like and return `true` if they would like it to
appear and `false` if not.
For example: >lua
    custom_filter = function(buf, buf_nums)
        -- dont show help buffers in the bufferline
        return not vim.bo[buf].filetype == "help" then

        -- you can use more custom logic for example
        -- don't show files matching a pattern
        return not vim.fn.bufname(buf):match('test')

        -- show only certain filetypes in certain tabs e.g. js in one, css in
        another etc.
        local tab_num = vim.fn.tabpagenr()
        if tab_num == 1 and vim.bo[buf].filetype == "javascript" then
            return true
        elseif tab_num == 2 and vim.bo[buf].filetype == "css" then
            return true
        else
            return false
        end


        -- My personal example:
        -- Don't show output log buffers in the same tab as my other code.
        -- 1. Check if there are any log buffers in the full list of buffers
        -- if not don't do any filtering
        local logs =
            vim.tbl_filter(
                function(b)
                    return vim.bo[b].filetype == "log"
                end,
                buf_nums
            )
        if vim.tbl_isempty(logs) then
            return true
        end
        -- 2. if there are log buffers then only show the log buffer
        local tab_num = vim.fn.tabpagenr()
        local is_log = vim.bo[buf].filetype == "log"
        -- only show log buffers in secondary tabs
        return (tab_num == 2 and is_log) or (tab_num ~= 2 and not is_log)
    end
<

==============================================================================
COMMANDS                                               *bufferline-commands*

Bufferline includes a few commands to allow deleting buffers. These commands
are:

* `BufferLineCloseRight` - close all visible buffers to the right of the
  current buffer
* `BufferLineCloseLeft` - close all visible buffers to the left of the current
  buffer
* `BufferLineCloseOthers` - close all other visible buffers

These commands apply the configured `close_command` to each of the corresponding buffers.

==============================================================================
CUSTOM-FUNCTIONS                                     *bufferline-functions*

A user can also execute arbitrary functions against a buffer using the
`exec` function. For example

>lua
    require('bufferline').exec(
        4, -- the forth visible buffer from the left
        user_function -- an arbitrary user function which gets passed the buffer
    )

    -- e.g.
    function _G.bdel(num)
        require('bufferline').exec(num, function(buf, visible_buffers)
            vim.cmd('bdelete '..buf.id)
        end
    end

    vim.cmd [ [
        command -count Bdel <Cmd>lua _G.bdel(<count>)<CR>
    ] ]


==============================================================================
SIDEBAR OFFSET                                           *bufferline-offset*

You can prevent the bufferline drawing above a *vertical* sidebar split such as a file explorer.
To do this you must set the `offsets` configuration option to a list of tables
containing the details of the window to avoid. *NOTE:* this is only relevant
for left or right aligned sidebar windows such as `NvimTree`, `NERDTree` or
`Vista`
>lua
    offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
        }
    }
<
The `filetype` is used to check whether a particular window is a match, the
`text` is *optional* and will show above the window if specified.
`text` can be either a string or a function which should also return a string.
See the example below.
>lua
  offsets = {
    {
      filetype = "NvimTree",
      text = function()
        return vim.fn.getcwd()
      end,
      highlight = "Directory",
      text_align = "left"
    }
  }


If it is too long it will be truncated. The highlight controls what highlight
is shown above the window.

You can also change the alignment of the text in the offset section using
`text_align` which can be set to `left`, `right` or `center`.

An offset can also have a separator which mimics the appearance of the
win separator, and the intent is give a vertical split the appearance of
a consistent separator. The highlight can be changed using the `offset_separator`
highlight. The value can be set to a `boolean` (uses the default separator if
true) or to a string which will be the character that will be used.

Lastly you can specify a `padding` option as well which will increase the
amount the bufferline is offset beyond just the window width, this isn't
something that is generally required though.

==============================================================================
BUFFERLINE PICK                                            *bufferline-pick*

Using the `BufferLinePick` command will allow for easy selection of a buffer
in view. Trigger the command, using `:BufferLinePick` or better still map this
to a key, e.g. >vim

    nnoremap <silent> gb :BufferLinePick<CR>
<
then pick a buffer by typing the character for that specific buffer that
appears

This functionality can also be used to close a buffer using
`BufferLinePickClose` by triggering this command the same selection UI will
appear but on selecting a buffer it will be closed.

this can also be mapped to something like
>vim
  nnoremap <silent> gD :BufferLinePickClose<CR>
>

==============================================================================

==============================================================================
MAPPINGS                                               *bufferline-mappings*

`BufferLineGoToBuffer`

You can select a buffer by it's visible position in the bufferline using the `BufferLineGoToBuffer`
command. This means that if you have 60 buffers open but only 7 visible in the bufferline
using `BufferLineGoToBuffer 4` will go to the 4th visible buffer but not necessarily the 5th in the
absolute list of open buffers. To select the last visible buffer, you can also use `BufferLineGoToBuffer -1`.
>

  <- (30) | buf31 | buf32 | buf33 | buf34 | buf35 | buf36 | buf37 (24) ->
<

Using `BufferLineGoToBuffer 4` will open `buf34` as it is the 4th visible buffer.

This can then be mapped using

>vim
  nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
  nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
  nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
  nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
  nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
  nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
  nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
  nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
  nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
  nnoremap <silent><leader>$ <Cmd>BufferLineGoToBuffer -1<CR>
<

If you'd rather map these yourself, use:

>vim
    nnoremap mymap :lua require"bufferline".go_to(num)<CR>

Alternatively, if you want to instead jump to the absolute position of the
buffer in the bufferline (as displayed by the ordinal buffer numbers), you can
use the `lua` API to set it up using `require'bufferline'.go_to(number, absolute)`,
where absolute is a boolean that determines whether to use the
absolute buffer position or the visible/relative one.

>vim
  nnoremap <silent><leader>1 <cmd>lua require("bufferline").go_to(1, true)<cr>
  nnoremap <silent><leader>2 <cmd>lua require("bufferline").go_to(2, true)<cr>
  nnoremap <silent><leader>3 <cmd>lua require("bufferline").go_to(3, true)<cr>
  nnoremap <silent><leader>4 <cmd>lua require("bufferline").go_to(4, true)<cr>
  nnoremap <silent><leader>5 <cmd>lua require("bufferline").go_to(5, true)<cr>
  nnoremap <silent><leader>6 <cmd>lua require("bufferline").go_to(6, true)<cr>
  nnoremap <silent><leader>7 <cmd>lua require("bufferline").go_to(7, true)<cr>
  nnoremap <silent><leader>8 <cmd>lua require("bufferline").go_to(8, true)<cr>
  nnoremap <silent><leader>9 <cmd>lua require("bufferline").go_to(9, true)<cr>
  nnoremap <silent><leader>$ <cmd>lua require("bufferline").go_to(-1, true)<cr>
<

You can close buffers by clicking the close icon or by right clicking the tab anywhere


A few of this plugins commands can be mapped for ease of use. >vim

    " These commands will navigate through buffers in order
    " regardless of which mode you are using  e.g. if you change
    " the order of buffers :bnext and :bprevious will not respect the custom ordering
    nnoremap <silent>[b :BufferLineCycleNext<CR>
    nnoremap <silent>b] :BufferLineCyclePrev<CR>

    " These commands will move the current buffer backwards or forwards in the bufferline
    nnoremap <silent><mymap> :BufferLineMoveNext<CR>
    nnoremap <silent><mymap> :BufferLineMovePrev<CR>

    " These commands will move the current buffer to the first or the last position in the bufferline
    nnoremap <silent><mymap> :lua require'bufferline'.move_to(1)<CR>
    nnoremap <silent><mymap> :lua require'bufferline'.move_to(-1)<CR>

    " These commands will sort buffers by directory, language, or a custom criteria
    nnoremap <silent>be :BufferLineSortByExtension<CR>
    nnoremap <silent>bd :BufferLineSortByDirectory<CR>
    nnoremap <silent><mymap> :lua require'bufferline'.sort_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

If you manually arrange your buffers using `:BufferLineMove{Prev|Next}` during an nvim session this can be persisted for the session.
This is enabled by default but you need to ensure that your `sessionoptions+=globals` otherwise the session file will
not track global variables which is the mechanism used to store your sort order.

==============================================================================
HIGHLIGHTS                                           *bufferline-highlights*

When `termguicolors` is enabled, this plugin is designed to work automatically,
deriving colours from the user's theme, you can change highlight groups by
overriding the section you'd like to change.

Keep in mind that despite my best efforts not to change these they might
require the occasional tweak (if you don't customise these too much you should
be fine 🤞).

Highlight values can also be specified as tables with a key of the highlight
name e.g. `Normal` and the attribute which is one of `fg`, `bg`. See the
`{what}` argument of `:h synIDAttr` for details, but only these 2 have been
tested

for example: >lua
    highlights = {
        fill = {
            bg = {
                attribute = "fg",
                highlight = "Pmenu"
            }
        }
    }
<
This will automatically pull the value of `Pmenu` fg colour and use it
Any improperly specified tables will be set to `nil` and overriden with the
default value for that key.

NOTE: you can specify colors the same way you specify colors for
`nvim_set_hl`. See `:h vim.api.nvim_set_hl` .
>lua
    require('bufferline').setup({
        highlights = {
            fill = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            background = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            tab = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            tab_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            tab_separator = {
              fg = '<colour-value-here>',
              bg = '<colour-value-here>',
            },
            tab_separator_selected = {
              fg = '<colour-value-here>',
              bg = '<colour-value-here>',
              sp = '<colour-value-here>',
              underline = '<colour-value-here>',
            },
            tab_close = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            close_button = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            close_button_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            close_button_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            buffer_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            buffer_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            numbers = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            numbers_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            numbers_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            diagnostic = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            diagnostic_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            diagnostic_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            hint = {
                fg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            hint_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            hint_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            hint_diagnostic = {
                fg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            hint_diagnostic_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            hint_diagnostic_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            info = {
                fg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            info_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            info_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            info_diagnostic = {
                fg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            info_diagnostic_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            info_diagnostic_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            warning = {
                fg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            warning_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            warning_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            warning_diagnostic = {
                fg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            warning_diagnostic_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            warning_diagnostic_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            error = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                sp = '<colour-value-here>',
            },
            error_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            error_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            error_diagnostic = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                sp = '<colour-value-here>',
            },
            error_diagnostic_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            error_diagnostic_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                sp = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            modified = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            modified_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            modified_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            duplicate_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                italic = true,
            },
            duplicate_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                italic = true,
            },
            duplicate = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                italic = true,
            },
            separator_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            separator_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            separator = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            indicator_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            indicator_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            pick_selected = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            pick_visible = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            pick = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
                bold = true,
                italic = true,
            },
            offset_separator = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            },
            trunc_marker = {
                fg = '<colour-value-here>',
                bg = '<colour-value-here>',
            }
        };
    })
<
When `termguicolors` is not enabled, a user is expected to specify colour values
similar to the format above (use `ctermbg` and `ctermfg` instead). A user can
also directly specify [colour
numbers](https://www.ditig.com/256-colors-cheat-sheet).

for example: >lua
    highlights = {
        fill = {
            ctermbg = 7,
            ctermfg = 0,
        }
    }

This will set the background of the highlight group to gray and foreground to
black. Here the colours are system determined, and the user may have changed
the rgb values through customizing the terminal emulator itself. This is
possible for colour numbers 0-15.

==============================================================================
CUSTOM AREAS                                           *bufferline-custom-areas*


You can also add custom content at the start or end of the bufferline using `custom_areas`
this option allows a user to specify a function which should return the text and highlight for that text
to be shown in a list of tables. For example:

>lua
    custom_areas = {
    right = function()
        local result = {}
        local seve = vim.diagnostic.severity
        local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
        local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
        local info = #vim.diagnostic.get(0, {severity = seve.INFO})
        local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

        if error ~= 0 then
            table.insert(result, {text = "  " .. error, fg = "#EC5241"})
        end

        if warning ~= 0 then
            table.insert(result, {text = "  " .. warning, fg = "#EFB839"})
        end

        if hint ~= 0 then
            table.insert(result, {text = "  " .. hint, fg = "#A3BA5E"})
        end

        if info ~= 0 then
            table.insert(result, {text = "  " .. info, fg = "#7EA9A7"})
        end
        return result
    end,
    }
<

Please note that this function will be called a lot and should be as inexpensive as possible so it does
not block rendering the tabline.

==============================================================================
WORKING WITH ELEMENTS                        *bufferline-working-with-elements*

Bufferline exposes some information about the buffers it shows will allow you
to implement your own custom functionality. Note that this will not include any
buffers that are filtered out of bufferline, making it handy for writing
functions that need to ignore special buffers.

The output has the following structure:

>lua
    {
        mode = "tabs" -- depends on your config setting for mode
        elements = {
            {id = 1, name = "hi.txt", path = "/tmp/folder/hi.txt"},
            -- and so on for all open buffers
        }
    }
<

Here's an example that will let you close all open buffers.

>lua
    function close_all_buffers ()
        for _, e in ipairs(bufferline.get_elements().elements) do
            vim.schedule(function()
                vim.cmd("bd ".. e.id)
            end)
        end
    end
<
 ]]
