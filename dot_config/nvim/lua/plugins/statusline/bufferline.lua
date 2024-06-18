---@type table
local cmds = {
    "BufferLineTabRename",
    "BufferLineGroupClose",
    "BufferLineGroupToggle",
    "BufferLineTogglePin",
    "BufferLineSortByExtension",
    "BufferLineSortByDirectory",
    "BufferLineSortByTabs",
    "BufferLineCycleNext",
    "BufferLineCyclePrev",
    "BufferLineCloseRight",
    "BufferLineCloseLeft",
    "BufferLineCloseOthers",
    "BufferLinePick",
    "BufferLineGoToBuffer",
    "BufferLineMoveNext",
    "BufferLineMovePrev",
}

---@type table
local events = { "BufReadPre", "BufNewFile" }

---@type LazySpec
local spec = {
    "akinsho/bufferline.nvim",
    --lazy = false,
    cmd = cmds,
    event = events,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
        vim.opt.mousemoveevent = true
    end,
    config = function()
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
                buffer_close_icon = "",
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
                    local icon = level:match("error") and " " or ""
                    return " " .. icon .. "(" .. count .. ")"
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
                separator_style = "thin",
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                auto_toggle_bufferline = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" },
                },
                custom_areas = {
                    right = function()
                        ---@type table
                        local result = {}
                        table.insert(result, { text = " コロナを忘れるな！ ", fg = "#EC5241" })
                        return result
                    end,
                },
            },
        })
    end,
    --cond = false,
}

return spec
