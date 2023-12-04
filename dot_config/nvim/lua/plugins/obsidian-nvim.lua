local vault_path = vim.fn.expand("$obsidian_vault_path")

local vaults = {
    {
        name = "mimikun",
        path = vault_path,
    },
}

local events = {
    "BufReadPre " .. vault_path .. "/**.md",
    "BufNewFile " .. vault_path .. "/**.md",
}

local cmds = {
    "ObsidianBacklinks",
    "ObsidianCheck",
    "ObsidianFollowLink",
    "ObsidianLink",
    "ObsidianLinkNew",
    "ObsidianNew",
    "ObsidianOpen",
    "ObsidianPasteImg",
    "ObsidianQuickSwitch",
    "ObsidianRename",
    "ObsidianSearch",
    "ObsidianTemplate",
    "ObsidianToday",
    "ObsidianTomorrow",
    "ObsidianWorkspace",
    "ObsidianYesterday",
}

local day_sec = 86400
local month_sec = 2592000
local year_sec = 31536000

local opts = {
    workspaces = vaults,
    detect_cwd = false,
    -- Default save location for newly created notes
    notes_subdir = "000_Inbox",
    log_level = vim.log.levels.DEBUG,
    -- Default save location for newly daily notes
    daily_notes = {
        folder = "001_DailyNotes",
        date_format = "%Y年%m月%d日",
        template = "999_Templates/dailyNoteTemplateFromObsidianNvim.md",
    },
    disable_frontmatter = true,
    -- Obsidian templates folder
    templates = {
        subdir = "999_Templates",
        date_format = "%Y年%m月%d日",
        substitutions = {
            -- 999_Templates/dailyNoteTemplate.md
            -- 今日
            today = function ()
                local tmp = os.date("*t", os.time())
                local year = tmp.year
                local month = tmp.month
                local day = tmp.day
                return (year .. "年" .. month .. "月" .. day .. "日")
            end,
            -- 翌日
            tomorrow = function()
                local tmp = os.date("*t", os.time() + day_sec)
                local year = tmp.year
                local month = tmp.month
                local day = tmp.day
                return (year .. "年" .. month .. "月" .. day .. "日")
            end,
            -- 前日
            yesterday = function()
                local tmp = os.date("*t", os.time() - day_sec)
                local year = tmp.year
                local month = tmp.month
                local day = tmp.day
                return (year .. "年" .. month .. "月" .. day .. "日")
            end,
            -- 999_Templates/monthlyNoteTemplate.md
            -- 今月
            current_month = function()
                local tmp = os.date("*t", os.time())
                local year = tmp.year
                local month = tmp.month
                return (year .. "年" .. month .. "月")
            end,
            -- 翌月
            next_month = function()
                local tmp = os.date("*t", os.time() + month_sec + day_sec)
                local year = tmp.year
                local month = tmp.month
                return (year .. "年" .. month .. "月")
            end,
            -- 前月
            last_month = function()
                local tmp = os.date("*t", os.time() - month_sec)
                local year = tmp.year
                local month = tmp.month
                return (year .. "年" .. month .. "月")
            end,
            -- 999_Templates/yearlyNoteTemplate.md
            -- 今年
            current_year = function()
                local tmp = os.date("*t", os.time())
                local year = tmp.year
                return (year .. "年")
            end,
            -- 翌年
            next_year = function()
                local tmp = os.date("*t", os.time() + year_sec)
                local year = tmp.year
                return (year .. "年")
            end,
            -- 前年
            last_year = function()
                local tmp = os.date("*t", os.time() - year_sec)
                local year = tmp.year
                return (year .. "年")
            end,
        },
    },

    -- Set to true if you use the Obsidian Advanced URI plugin.
    -- https://github.com/Vinzent03/obsidian-advanced-uri
    use_advanced_uri = true,

    open_app_foreground = false,

    -- Setting the finder to use
    -- Comment out what you don't use
    --finder = "telescope.nvim",
    --finder = "fzf-lua",
    --finder = "fzf.nvim",
    finder = "fzf.vim",

    -- Sort search results by "path", "modified", "accessed", or "created".
    sort_by = "modified",
    sort_reversed = true,

    -- Open note in current buffer
    open_notes_in = "current",

    -- Optional, set the YAML parser to use. The valid options are:
    --  * "native" - uses a pure Lua parser that's fast but potentially misses some edge cases.
    --  * "yq" - uses the command-line tool yq (https://github.com/mikefarah/yq), which is more robust
    --    but much slower and needs to be installed separately.
    -- In general you should be using the native parser unless you run into a bug with it, in which
    -- case you can temporarily switch to the "yq" parser.
    yaml_parser = "native",
}

return {
    "epwalsh/obsidian.nvim",
    --lazy = false,
    event = events,
    cmd = cmds,
    dependencies = {
        -- Must
        "nvim-lua/plenary.nvim",
        -- Completion
        --"hrsh7th/nvim-cmp",
        -- Search functionality
        "junegunn/fzf",
        "junegunn/fzf.vim",
        --"nvim-telescope/telescope.nvim",
        --"ibhagwan/fzf-lua",
        -- Syntax highlighting
        "nvim-treesitter/nvim-treesitter",
        "preservim/vim-markdown",
        -- Miscellaneous
        --"epwalsh/pomo.nvim",
    },
    opts = opts,
    --cond = false,
}
