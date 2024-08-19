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

---@type LazyKeysSpec[]
local keys = {
    {
        "[b",
        function()
            vim.cmd([[BufferLineCycleNext]])
        end,
        mode = "n",
        desc = "BufferLineCycleNext",
    },
    {
        "b]",
        function()
            vim.cmd([[BufferLineCyclePrev]])
        end,
        mode = "n",
        desc = "BufferLineCyclePrev",
    },
    {
        "gb",
        function()
            vim.cmd([[BufferLinePick]])
        end,
        mode = "n",
        desc = "BufferLinePick",
    },
    {
        "gD",
        function()
            vim.cmd([[BufferLinePickClose]])
        end,
        mode = "n",
        desc = "BufferLinePickClose",
    },
    {
        "<leader>1",
        function()
            require("bufferline").go_to(1, true)
        end,
        mode = "n",
        desc = "Select buffer 1",
    },
    {
        "<leader>2",
        function()
            require("bufferline").go_to(2, true)
        end,
        mode = "n",
        desc = "Select buffer 2",
    },
    {
        "<leader>3",
        function()
            require("bufferline").go_to(3, true)
        end,
        mode = "n",
        desc = "Select buffer 3",
    },
    {
        "<leader>4",
        function()
            require("bufferline").go_to(4, true)
        end,
        mode = "n",
        desc = "Select buffer 4",
    },
    {
        "<leader>5",
        function()
            require("bufferline").go_to(5, true)
        end,
        mode = "n",
        desc = "Select buffer 5",
    },
    {
        "<leader>6",
        function()
            require("bufferline").go_to(6, true)
        end,
        mode = "n",
        desc = "Select buffer 6",
    },
    {
        "<leader>7",
        function()
            require("bufferline").go_to(7, true)
        end,
        mode = "n",
        desc = "Select buffer 7",
    },
    {
        "<leader>8",
        function()
            require("bufferline").go_to(8, true)
        end,
        mode = "n",
        desc = "Select buffer 8",
    },
    {
        "<leader>9",
        function()
            require("bufferline").go_to(9, true)
        end,
        mode = "n",
        desc = "Select buffer 9",
    },
    {
        "<leader>$",
        function()
            require("bufferline").go_to(-1, true)
        end,
        mode = "n",
        desc = "Select buffer -1",
    },
}

---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "famiu/bufdelete.nvim",
}

---@type LazySpec
local spec = {
    "akinsho/bufferline.nvim",
    version = "*",
    --lazy = false,
    cmd = cmds,
    keys = keys,
    event = "BufEnter",
    dependencies = dependencies,
    init = function()
        vim.opt.termguicolors = true
    end,
    config = function()
        local bufferline = require("bufferline")
        local bufdelete = require("bufdelete").bufdelete

        bufferline.setup({
            options = {
                mode = "buffers",
                style_preset = {
                    bufferline.style_preset.no_italic,
                    bufferline.style_preset.no_bold,
                    bufferline.style_preset.minimal,
                },
                themable = false,
                numbers = "id",
                close_command = function(bufnum)
                    bufdelete(bufnum, true)
                end,
                right_mouse_command = "vertical sbuffer %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = function(bufnum)
                    bufdelete(bufnum, true)
                end,
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
                buffer_close_icon = "",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                diagnostics_update_on_event = true,
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
                        local result = {}
                        table.insert(result, { text = " コロナを忘れるな！ ", fg = "#EC5241" })
                        return result
                    end,
                },
            },
        })
    end,
    --cond = false,
    -- NOTE: bufferline plugin
    enabled = false,
}

return spec
