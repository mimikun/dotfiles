---@type LazySpec
local spec = {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    --lazy = false,
    cmd = "RenderMarkdownToggle",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("render-markdown").setup({
            -- Configure whether Markdown should be rendered by default or not
            start_enabled = true,
            -- Capture groups that get pulled from markdown
            markdown_query = [[
                (atx_heading [
                    (atx_h1_marker)
                    (atx_h2_marker)
                    (atx_h3_marker)
                    (atx_h4_marker)
                    (atx_h5_marker)
                    (atx_h6_marker)
                ] @heading)

                (thematic_break) @dash

                (fenced_code_block) @code

                [
                    (list_marker_plus)
                    (list_marker_minus)
                    (list_marker_star)
                ] @list_marker

                (task_list_marker_unchecked) @checkbox_unchecked
                (task_list_marker_checked) @checkbox_checked

                (block_quote (block_quote_marker) @quote_marker)
                (block_quote (paragraph (inline (block_continuation) @quote_marker)))

                (pipe_table) @table
                (pipe_table_header) @table_head
                (pipe_table_delimiter_row) @table_delim
                (pipe_table_row) @table_row
            ]],

            -- Capture groups that get pulled from inline markdown
            inline_query = [[
                (code_span) @code
            ]],
            -- The level of logs to write to file: vim.fn.stdpath('state') .. '/render-markdown.log'
            -- Only intended to be used for plugin development / debugging
            log_level = "error",
            -- Filetypes this plugin will run on
            file_types = { "markdown" },
            -- Vim modes that will show a rendered view of the markdown file
            -- All other modes will be uneffected by this plugin
            render_modes = { "n", "c" },
            -- Characters that will replace the # at the start of headings
            headings = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
            -- Character to use for the horizontal break
            dash = "—",
            -- Character to use for the bullet points in lists
            bullets = { "●", "○", "◆", "◇" },
            checkbox = {
                -- Character that will replace the [ ] in unchecked checkboxes
                unchecked = "󰄱 ",
                -- Character that will replace the [x] in checked checkboxes
                checked = " ",
            },
            -- Character that will replace the > at the start of block quotes
            quote = "┃",
            -- See :h 'conceallevel' for more information about meaning of values
            conceal = {
                -- conceallevel used for buffer when not being rendered, get user setting
                default = vim.opt.conceallevel:get(),
                -- conceallevel used for buffer when being rendered
                rendered = 3,
            },
            -- Add a line above and below tables to complete look, ends up like a window
            fat_tables = true,
            -- Define the highlight groups to use when rendering various components
            highlights = {
                heading = {
                    -- Background of heading line
                    backgrounds = { "DiffAdd", "DiffChange", "DiffDelete" },
                    -- Foreground of heading character only
                    foregrounds = {
                        "markdownH1",
                        "markdownH2",
                        "markdownH3",
                        "markdownH4",
                        "markdownH5",
                        "markdownH6",
                    },
                },
                -- Horizontal break
                dash = "LineNr",
                -- Code blocks
                code = "ColorColumn",
                -- Bullet points in list
                bullet = "Normal",
                checkbox = {
                    -- Unchecked checkboxes
                    unchecked = "@markup.list.unchecked",
                    -- Checked checkboxes
                    checked = "@markup.heading",
                },
                table = {
                    -- Header of a markdown table
                    head = "@markup.heading",
                    -- Non header rows in a markdown table
                    row = "Normal",
                },
                -- LaTeX blocks
                latex = "@markup.math",
                -- Quote character in a block quote
                quote = "@markup.quote",
            },
        })
    end,
    --cond = false,
}

return spec
