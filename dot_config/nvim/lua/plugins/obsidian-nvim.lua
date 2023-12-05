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

---@return table
local today_helper = function ()
    local tmp = os.date("*t", os.time())
    local tbl = {
        year = tmp.year,
        month = tmp.month,
        day = tmp.day,
        z_month = string.format("%02d", tmp.month),
        z_day = string.format("%02d", tmp.day),
    }
    return tbl
end

local opts = {
    workspaces = vaults,
    detect_cwd = false,
    -- Default save location for newly created notes
    notes_subdir = "000_Inbox",
    log_level = vim.log.levels.DEBUG,
    -- Default save location for newly daily notes
    daily_notes = {
        folder = "001_DailyNotes",
        template = "999_Templates/dailyNoteTemplateFromObsidianNvim.md",
    },
    disable_frontmatter = true,
    -- Obsidian templates folder
    templates = {
        subdir = "999_Templates",
        substitutions = {
            -- 999_Templates/dailyNoteTemplate.md
            -- 今日
            today = function()
                local today = today_helper()
                local year = today.year
                local month = today.z_month
                local day = today.z_day
                return (year .. "年" .. month .. "月" .. day .. "日")
            end,
            -- YYYY/MM/DD
            today_fm_1 = function ()
                local today = today_helper()
                local year = today.year
                local month = today.z_month
                local day = today.z_day
                return (year .. "/" .. month .. "/" .. day)
            end,
            -- YYYY/M/D
            today_fm_2 = function ()
                local today = today_helper()
                local year = today.year
                local month = today.month
                local day = today.day
                return (year .. "/" .. month .. "/" .. day)
            end,
            -- YYYY年M月D日
            today_fm_3 = function ()
                local today = today_helper()
                local year = today.year
                local month = today.month
                local day = today.day
                return (year .. "年" .. month .. "月" .. day .. "日")
            end,
            -- YYYY-MM-DD
            today_fm_4 = function ()
                local today = today_helper()
                local year = today.year
                local month = today.z_month
                local day = today.z_day
                return (year .. "-" .. month .. "-" .. day)
            end,
            -- YYYY-M-D
            today_fm_5 = function ()
                local today = today_helper()
                local year = today.year
                local month = today.month
                local day = today.day
                return (year .. "-" .. month .. "-" .. day)
            end,
            -- 翌日
            tomorrow = function()
                local tmp = os.date("*t", os.time() + day_sec)
                local year = tmp.year
                local month = string.format("%02d", tmp.month)
                local day = string.format("%02d", tmp.day)
                return (year .. "年" .. month .. "月" .. day .. "日")
            end,
            -- 前日
            yesterday = function()
                local tmp = os.date("*t", os.time() - day_sec)
                local year = tmp.year
                local month = string.format("%02d", tmp.month)
                local day = string.format("%02d", tmp.day)
                return (year .. "年" .. month .. "月" .. day .. "日")
            end,
            -- 999_Templates/monthlyNoteTemplate.md
            -- 今月
            current_month = function()
                local today = today_helper()
                local year = today.year
                local month = today.z_month
                return (year .. "年" .. month .. "月")
            end,
            -- YYYY/MM
            month_fm_1 = function()
                local today = today_helper()
                local year = today.year
                local month = today.z_month
                return (year .. "/" .. month)
            end,
            -- YYYY/M
            month_fm_2 = function()
                local today = today_helper()
                local year = today.year
                local month = today.month
                return (year .. "/" .. month)
            end,
            -- YYYY-MM
            month_fm_3 = function()
                local today = today_helper()
                local year = today.year
                local month = today.z_month
                return (year .. "-" .. month)
            end,
            -- YYYY-M
            month_fm_4 = function()
                local today = today_helper()
                local year = today.year
                local month = today.month
                return (year .. "-" .. month)
            end,
            -- YYYY年M月
            month_fm_5 = function()
                local today = today_helper()
                local year = today.year
                local month = today.month
                return (year .. "年" .. month .. "月")
            end,
            -- 翌月
            next_month = function()
                local tmp = os.date("*t", os.time() + month_sec + day_sec)
                local year = tmp.year
                local month = string.format("%02d", tmp.month)
                return (year .. "年" .. month .. "月")
            end,
            -- 前月
            last_month = function()
                local tmp = os.date("*t", os.time() - month_sec)
                local year = tmp.year
                local month = string.format("%02d", tmp.month)
                return (year .. "年" .. month .. "月")
            end,
            -- 999_Templates/yearlyNoteTemplate.md
            -- 今年
            current_year = function()
                local today = today_helper()
                local year = today.year
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
