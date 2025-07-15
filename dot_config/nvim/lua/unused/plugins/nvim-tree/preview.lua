local preview = {}

preview.opts = {
    -- Keymaps for the preview window (does not apply to the tree window).
    -- Keymaps can be a string (vimscript command), a function, or a table.
    --
    -- If a function is provided:
    --   When the keymap is invoked, the function is called.
    --   It will be passed a single argument, which is a table of the following form:
    --     {
    --       node: NvimTreeNode|NvimTreeRootNode, -- The tree node under the cursor
    --     }
    --   See the type definitions in `lua/nvim-tree-preview/types.lua` for a description
    --   of the fields in the table.
    --
    -- If a table, it must contain either an 'action' or 'open' key:
    --   Actions:
    --     { action = 'close', unwatch? = false, focus_tree? = true }
    --     { action = 'toggle_focus' }
    --
    --   Open modes:
    --     { open = 'edit' }
    --     { open = 'tab' }
    --     { open = 'vertical' }
    --     { open = 'horizontal' }
    --
    -- To disable a default keymap, set it to false.
    -- All keymaps are set in normal mode. Other modes are not currently supported.
    keymaps = {
        ["<Esc>"] = { action = "close", unwatch = true },
        ["<Tab>"] = { action = "toggle_focus" },
        ["<CR>"] = { open = "edit" },
        ["<C-t>"] = { open = "tab" },
        ["<C-v>"] = { open = "vertical" },
        ["<C-x>"] = { open = "horizontal" },
    },
    min_width = 10,
    min_height = 5,
    max_width = 85,
    max_height = 25,
    wrap = false, -- Whether to wrap lines in the preview window
    border = "rounded", -- Border style for the preview window
    zindex = 100, -- Stacking order. Increase if the preview window is shown below other windows.
    show_title = true, -- Whether to show the file name as the title of the preview window
    title_pos = "top-left", -- top-left|top-center|top-right|bottom-left|bottom-center|bottom-right
    title_format = " %s ",
}

return preview
