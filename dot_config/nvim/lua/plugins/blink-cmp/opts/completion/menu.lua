local menu = {
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
}

return menu
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
