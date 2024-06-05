---@type table
local keys = {
    {
        "<leader>,",
        function()
            require("md-pdf").convert_md_to_pdf()
        end,
        desc = "Markdown preview",
    },
}

---@type table
local opts = {
    --- Set margins around document
    margins = "1.5cm",
    -- tango, pygments are quite nice for white on white
    highlight = "tango",
    -- Generate a table of contents, on by default
    toc = true,
    -- Define a custom preview command, enabling hooks and other custom logic
    preview_cmd = function()
        return "firefox"
    end,
    -- if true, then the markdown file is continuously converted on each write, even if the
    -- file viewer closed, e.g., firefox is "closed" once the document is opened in it.
    ignore_viewer_state = false,
    -- Specify font, `nil` uses the default font of the theme
    -- NOTE: those that are `nil` can be left out completely
    fonts = {
        main_font = nil,
        sans_font = "DejaVuSans",
        mono_font = "IosevkaTerm Nerd Font Mono",
        math_font = nil,
    },
    -- Custom options passed to `pandoc` CLI call, can be ignored for setup
    pandoc_user_args = {
        -- short
        "-V KEY[:VALUE]",
        -- long options
        "--standalone=[true|false]",
    },
}

---@type LazySpec
local spec = {
    "arminveres/md-pdf.nvim",
    branch = "main",
    --lazy = false,
    keys = keys,
    opts = opts,
    --cond = false,
}

return spec
