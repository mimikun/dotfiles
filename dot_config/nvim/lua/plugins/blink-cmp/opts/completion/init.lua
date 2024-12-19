local completion = {
    keyword = {
        -- 'prefix' will fuzzy match on the text before the cursor
        -- 'full' will fuzzy match on the text before *and* after the cursor
        -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
        range = "prefix",
        -- Regex used to get the text when fuzzy matching
        regex = "[-_]\\|\\k",
        -- After matching with regex, any characters matching this regex at the prefix will be excluded
        exclude_from_prefix_regex = "[\\-]",
    },

    trigger = {
        -- When true, will prefetch the completion items when entering insert mode
        -- WARN: buggy, not recommended unless you'd like to help develop prefetching
        prefetch_on_insert = false,
        -- When false, will not show the completion window automatically when in a snippet
        show_in_snippet = true,
        -- When true, will show the completion window after typing a character that matches the `keyword.regex`
        show_on_keyword = true,
        -- When true, will show the completion window after typing a trigger character
        show_on_trigger_character = true,
        -- LSPs can indicate when to show the completion window via trigger characters
        -- however, some LSPs (i.e. tsserver) return characters that would essentially
        -- always show the window. We block these by default.
        show_on_blocked_trigger_characters = function()
            if vim.api.nvim_get_mode().mode == "c" then
                return {}
            end

            -- you can also block per filetype, for example:
            -- if vim.bo.filetype == 'markdown' then
            --   return { ' ', '\n', '\t', '.', '/', '(', '[' }
            -- end

            return { " ", "\n", "\t" }
        end,
        -- When both this and show_on_trigger_character are true, will show the completion window
        -- when the cursor comes after a trigger character after accepting an item
        show_on_accept_on_trigger_character = true,
        -- When both this and show_on_trigger_character are true, will show the completion window
        -- when the cursor comes after a trigger character when entering insert mode
        show_on_insert_on_trigger_character = true,
        -- List of trigger characters (on top of `show_on_blocked_trigger_characters`) that won't trigger
        -- the completion window when the cursor comes after a trigger character when
        -- entering insert mode/accepting an item
        show_on_x_blocked_trigger_characters = { "'", '"', "(", "{" },
        -- or a function, similar to show_on_blocked_trigger_character
    },

    list = {
        -- Maximum number of items to display
        max_items = 200,
        -- Controls if completion items will be selected automatically,
        -- and whether selection automatically inserts
        selection = "preselect",
        -- Controls how the completion items are selected
        -- 'preselect' will automatically select the first item in the completion list
        -- 'manual' will not select any item by default
        -- 'auto_insert' will not select any item by default, and insert the completion items automatically
        -- when selecting them
        --
        -- You may want to bind a key to the `cancel` command, which will undo the selection
        -- when using 'auto_insert'
        cycle = {
            -- When `true`, calling `select_next` at the *bottom* of the completion list
            -- will select the *first* completion item.
            from_bottom = true,
            -- When `true`, calling `select_prev` at the *top* of the completion list
            -- will select the *last* completion item.
            from_top = true,
        },
    },

    accept = {
        -- Create an undo point when accepting a completion item
        create_undo_point = true,
        -- Experimental auto-brackets support
        auto_brackets = {
            -- Whether to auto-insert brackets for functions
            enabled = true,
            -- Default brackets to use for unknown languages
            default_brackets = { "(", ")" },
            -- Overrides the default blocked filetypes
            override_brackets_for_filetypes = {},
            -- Synchronously use the kind of the item to determine if brackets should be added
            kind_resolution = {
                enabled = true,
                blocked_filetypes = { "typescriptreact", "javascriptreact", "vue" },
            },
            -- Asynchronously use semantic token to determine if brackets should be added
            semantic_token_resolution = {
                enabled = true,
                blocked_filetypes = {},
                -- How long to wait for semantic tokens to return before assuming no brackets should be added
                timeout_ms = 400,
            },
        },
    },

    menu = {
        enabled = true,
        min_width = 15,
        max_height = 10,
        border = "none",
        winblend = 0,
        winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        -- Keep the cursor X lines away from the top/bottom of the window
        scrolloff = 2,
        -- Note that the gutter will be disabled when border ~= 'none'
        scrollbar = true,
        -- Which directions to show the window,
        -- falling back to the next direction when there's not enough space
        direction_priority = { "s", "n" },

        -- Whether to automatically show the window when new completion items are available
        auto_show = true,

        -- Screen coordinates of the command line
        cmdline_position = function()
            if vim.g.ui_cmdline_pos ~= nil then
                local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
                return { pos[1] - 1, pos[2] }
            end
            local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
            return { vim.o.lines - height, 0 }
        end,

        -- Controls how the completion items are rendered on the popup window
        draw = {
            -- Aligns the keyword you've typed to a component in the menu
            align_to_component = "label", -- or 'none' to disable
            -- Left and right padding, optionally { left, right } for different padding on each side
            padding = 1,
            -- Gap between columns
            gap = 1,
            -- Use treesitter to highlight the label text of completions from these sources
            treesitter = {},
            -- Recommended to enable it just for the LSP source
            -- treesitter = { 'lsp' }

            -- Components to render, grouped by column
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
            -- for a setup similar to nvim-cmp: https://github.com/Saghen/blink.cmp/pull/245#issuecomment-2463659508
            -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },

            -- Definitions for possible components to render. Each component defines:
            --   ellipsis: whether to add an ellipsis when truncating the text
            --   width: control the min, max and fill behavior of the component
            --   text function: will be called for each item
            --   highlight function: will be called only when the line appears on screen
            components = {
                kind_icon = {
                    ellipsis = false,
                    text = function(ctx)
                        return ctx.kind_icon .. ctx.icon_gap
                    end,
                    highlight = function(ctx)
                        return require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
                            or "BlinkCmpKind" .. ctx.kind
                    end,
                },

                kind = {
                    ellipsis = false,
                    width = { fill = true },
                    text = function(ctx)
                        return ctx.kind
                    end,
                    highlight = function(ctx)
                        return require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
                            or "BlinkCmpKind" .. ctx.kind
                    end,
                },

                label = {
                    width = { fill = true, max = 60 },
                    text = function(ctx)
                        return ctx.label .. ctx.label_detail
                    end,
                    highlight = function(ctx)
                        -- label and label details
                        local highlights = {
                            {
                                0,
                                #ctx.label,
                                group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
                            },
                        }
                        if ctx.label_detail then
                            table.insert(
                                highlights,
                                { #ctx.label, #ctx.label + #ctx.label_detail, group = "BlinkCmpLabelDetail" }
                            )
                        end

                        -- characters matched on the label by the fuzzy matcher
                        for _, idx in ipairs(ctx.label_matched_indices) do
                            table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
                        end

                        return highlights
                    end,
                },

                label_description = {
                    width = { max = 30 },
                    text = function(ctx)
                        return ctx.label_description
                    end,
                    highlight = "BlinkCmpLabelDescription",
                },

                source_name = {
                    width = { max = 30 },
                    text = function(ctx)
                        return ctx.source_name
                    end,
                    highlight = "BlinkCmpSource",
                },
            },
        },
    },

    documentation = {
        -- Controls whether the documentation window will automatically show when selecting a completion item
        auto_show = false,
        -- Delay before showing the documentation window
        auto_show_delay_ms = 500,
        -- Delay before updating the documentation window when selecting a new item,
        -- while an existing item is still visible
        update_delay_ms = 50,
        -- Whether to use treesitter highlighting, disable if you run into performance issues
        treesitter_highlighting = true,
        window = {
            min_width = 10,
            max_width = 60,
            max_height = 20,
            border = "padded",
            winblend = 0,
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
            -- Note that the gutter will be disabled when border ~= 'none'
            scrollbar = true,
            -- Which directions to show the documentation window,
            -- for each of the possible menu window directions,
            -- falling back to the next direction when there's not enough space
            direction_priority = {
                menu_north = { "e", "w", "n", "s" },
                menu_south = { "e", "w", "s", "n" },
            },
        },
    },
    -- Displays a preview of the selected item on the current line
    ghost_text = {
        enabled = false,
    },
}

return completion
--[[
-- completions
### Menu Appearance/Drawing

<details>
<summary><strong>Default draw configuration</strong></summary>

<!-- config:start -->
```lua
--- @module 'blink.cmp'
--- @type blink.cmp.Draw
completion.menu.draw = {
  -- Aligns the keyword you've typed to a component in the menu
  align_to_component = 'label', -- or 'none' to disable
  -- Left and right padding, optionally { left, right } for different padding on each side
  padding = 1,
  -- Gap between columns
  gap = 1,
  -- Use treesitter to highlight the label text of completions from these sources
  treesitter = {},

  -- Components to render, grouped by column
  columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
  -- for a setup similar to nvim-cmp: https://github.com/Saghen/blink.cmp/pull/245#issuecomment-2463659508
  -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },

  -- Definitions for possible components to render. Each component defines:
  --   ellipsis: whether to add an ellipsis when truncating the text
  --   width: control the min, max and fill behavior of the component
  --   text function: will be called for each item
  --   highlight function: will be called only when the line appears on screen
  components = {
    kind_icon = {
      ellipsis = false,
      text = function(ctx) return ctx.kind_icon .. ctx.icon_gap end,
      highlight = function(ctx)
        return require('blink.cmp.completion.windows.render.tailwind').get_hl(ctx) or 'BlinkCmpKind' .. ctx.kind
      end,
    },

    kind = {
      ellipsis = false,
      width = { fill = true },
      text = function(ctx) return ctx.kind end,
      highlight = function(ctx)
        return require('blink.cmp.completion.windows.render.tailwind').get_hl(ctx) or 'BlinkCmpKind' .. ctx.kind
      end,
    },

    label = {
      width = { fill = true, max = 60 },
      text = function(ctx) return ctx.label .. ctx.label_detail end,
      highlight = function(ctx)
        -- label and label details
        local highlights = {
          { 0, #ctx.label, group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel' },
        }
        if ctx.label_detail then
          table.insert(highlights, { #ctx.label, #ctx.label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' })
        end

        -- characters matched on the label by the fuzzy matcher
        for _, idx in ipairs(ctx.label_matched_indices) do
          table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
        end

        return highlights
      end,
    },

    label_description = {
      width = { max = 30 },
      text = function(ctx) return ctx.label_description end,
      highlight = 'BlinkCmpLabelDescription',
    },

    source_name = {
      width = { max = 30 },
      -- source_name or source_id are supported
      text = function(ctx) return ctx.source_name end,
      highlight = 'BlinkCmpSource',
    },
  },
}
```

<!-- config:end -->

</details>

blink.cmp uses a grid-based layout to render the completion menu. The components, defined in `draw.components[string]`, define `text` and `highlight` functions which are called for each completion item. The `highlight` function will be called only when the item appears on screen, so expensive operations such as Treesitter highlighting may be performed (contributions welcome!, [for example](https://www.reddit.com/r/neovim/comments/1ca4gm2/colorful_cmp_menu_powered_by_treesitter/)). The components may define their min and max width, where `ellipsis = true` (enabled by default), will draw the `…` character when the text is truncated. Setting `width.fill = true` will fill the remaining space, effectively making subsequent components right aligned, with respect to their column.

Columns effectively allow you to vertically align a set of components. Each column, defined as an array in `draw.columns`, will be rendered for all of the completion items, where the longest rendered row will determine the width of the column. You may define `gap = number` in your column to insert a gap between components.

For a setup similar to nvim-cmp, use the following config:

```lua
{
  completion = {
    menu = {
      draw = {
        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
      },
    },
  }
}
```
]]

--[[
-- Select Nth item from the list
completion = {
  menu = {
    draw = {
      columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
      components = {
        item_idx = {
          text = function(ctx) return tostring(ctx.idx) end,
          highlight = 'BlinkCmpItemIdx' -- optional, only if you want to change its color
        }
      }
    }
  }
}
]]
