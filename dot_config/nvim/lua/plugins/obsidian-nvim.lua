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
    "ObsidianOpen",
    "ObsidianNew",
    "ObsidianQuickSwitch",
    "ObsidianFollowLink",
    "ObsidianBacklinks",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianTemplate",
    "ObsidianSearch",
    "ObsidianLink",
    "ObsidianLinkNew",
}

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
        -- TODO: Use dailyNoteTemplate.md
        --template = nil,
    },
    disable_frontmatter = true,
    -- Obsidian templates folder
    templates = {
        subdir = "999_Templates",
        date_format = "%Y年%m月%d日",
        -- TODO: 999_Templates/dailyNoteTemplate.md
        -- 一番下を見ること
        substitutions = {
            -- 999_Templates/dailyNoteTemplate.md
            -- 翌日
            next_day = function() end,
            -- 前日
            last_day = function() end,
            -- 999_Templates/monthlyNoteTemplate.md
            -- 翌月
            next_month = function() end,
            -- 前月
            last_month = function() end,
            -- 999_Templates/yearlyNoteTemplate.md
            -- 翌年
            next_year = function() end,
            -- 前年
            last_year = function() end,
            -- 999_Templates/weeklyNoteTemplate.md
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
        "nvim-lua/plenary.nvim",
        "junegunn/fzf",
        "junegunn/fzf.vim",
    },
    opts = opts,
    --cond = false,
}

-- 999_Templates/dailyNoteTemplate.md
--❯ cat $obsidian_vault_path/999_Templates/dailyNoteTemplate.md
-----
--aliases:
--  - {{date:YYYYMMDD}}
--  - {{date:YYYYMD}}
--  - {{date:YYYY/MM/DD}}
--  - {{date:YYYY/M/D}}
--  - {{date:YYYY年MM月DD日}}
--  - {{date:YYYY年M月D日}}
--  - {{date:YYYY-MM-DD}}
--  - {{date:YYYY-M-D}}
--tags:
--  - "#{{date:YYYY/MM/DD}}"
--  - "#{{date:YYYY/M/D}}"
--  - "#{{date:YYYY年MM月DD日}}"
--  - "#{{date:YYYY年M月D日}}"
--  - "#{{date:YYYY-MM-DD}}"
--  - "#{{date:YYYY-M-D}}"
--  - "#daily-note"
-----
--# {{date:YYYY年MM月DD日}}
--<< [[<% moment(tp.file.title, "YYYY年MM月DD日").subtract(1, "days").format("YYYY年MM月DD日") %>]] | [[<% moment(tp.file.title, "YYYY年MM月DD日").add(1, "days").format("YYYY年MM月DD日") %>]] >>
--
--[[電子レンジ対応表]]
--
--## Daily TODO
--<% tp.file.cursor() %>
--<%*
--async function asyncSleep(ms) {
--  return new Promise((resolve) => { setTimeout(() => { resolve(); }, ms); });
--}
--
--await asyncSleep(50) // waitを入れないとDaily Noteのタイトルから日付を読み込めない
--app.commands.executeCommandById("obsidian-silhouette:insert-tasks")
--%>
