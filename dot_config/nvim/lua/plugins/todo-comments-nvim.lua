---@type table
local cmds = {
    "TodoQuickFix",
    "TodoLocList",
    "TodoTelescope",
}

---@type LazySpec[]
local dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
}

---@type table
local opts = {
    keywords = {
        FIX = { icon = "󰃤 " },
        TODO = { icon = "󰄬 " },
        HACK = { icon = "󰈸 " },
        WARN = { icon = "󰀦 " },
        PERF = { icon = "󰥔 " },
        NOTE = { icon = "󰋼 " },
        TEST = { icon = "󰀠 " },
    },
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
        -- enable multine todo comments
        multiline = false,
        -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_pattern = "^.",
        -- extra lines that will be re-evaluated when changing a line
        multiline_context = 10,
        -- "fg" or "bg" or empty
        before = "",
        -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
        -- (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        keyword = "wide",
        -- "fg" or "bg" or empty
        after = "fg",
        -- pattern or table of patterns, used for highlighting (vim regex)
        pattern = [[.*<(KEYWORDS)\s*:]],
        -- uses treesitter to match keywords in comments only
        comments_only = true,
        -- ignore lines longer than this
        max_line_len = 400,
        -- list of file types to exclude highlighting
        exclude = {},
    },
}

---@type LazySpec
local spec = {
    "folke/todo-comments.nvim",
    --lazy = false,
    cmd = cmds,
    event = "BufEnter",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
