-- TODO: refactor this file

---@type number
local day_sec = 86400
---@type number
local month_sec = 2592000
---@type number
local year_sec = 31536000
---@type table
local tmp_today = os.date("*t", os.time())

-- Summarizing various elements of today's date
---@type table
local today = {
    year = tmp_today.year,
    month = tmp_today.month,
    day = tmp_today.day,
    -- zero padding
    z_month = string.format("%02d", tmp_today.month),
    -- zero padding
    z_day = string.format("%02d", tmp_today.day),
}

---@type table
local substitutions = {
    -- 999_Templates/dailyNoteTemplateFromObsidianNvim.md
    -- YYYY年MM月DD日
    today = function()
        local year = today.year
        local month = today.z_month
        local day = today.z_day
        return (year .. "年" .. month .. "月" .. day .. "日")
    end,
    -- YYYY/MM/DD
    today_fm_1 = function()
        local year = today.year
        local month = today.z_month
        local day = today.z_day
        return (year .. "/" .. month .. "/" .. day)
    end,
    -- YYYY/M/D
    today_fm_2 = function()
        local year = today.year
        local month = today.month
        local day = today.day
        return (year .. "/" .. month .. "/" .. day)
    end,
    -- YYYY年M月D日
    today_fm_3 = function()
        local year = today.year
        local month = today.month
        local day = today.day
        return (year .. "年" .. month .. "月" .. day .. "日")
    end,
    -- YYYY-MM-DD
    today_fm_4 = function()
        local year = today.year
        local month = today.z_month
        local day = today.z_day
        return (year .. "-" .. month .. "-" .. day)
    end,
    -- YYYY-M-D
    today_fm_5 = function()
        local year = today.year
        local month = today.month
        local day = today.day
        return (year .. "-" .. month .. "-" .. day)
    end,
    -- Tomorrow
    tomorrow = function()
        local tmp = os.date("*t", os.time() + day_sec)
        local year = tmp.year
        local month = string.format("%02d", tmp.month)
        local day = string.format("%02d", tmp.day)
        return (year .. "年" .. month .. "月" .. day .. "日")
    end,
    -- Yesterday
    yesterday = function()
        local tmp = os.date("*t", os.time() - day_sec)
        local year = tmp.year
        local month = string.format("%02d", tmp.month)
        local day = string.format("%02d", tmp.day)
        return (year .. "年" .. month .. "月" .. day .. "日")
    end,
    -- 999_Templates/monthlyNoteTemplateFromObsidianNvim.md
    -- YYYY年MM月
    current_month = function()
        local year = today.year
        local month = today.z_month
        return (year .. "年" .. month .. "月")
    end,
    -- YYYY/MM
    month_fm_1 = function()
        local year = today.year
        local month = today.z_month
        return (year .. "/" .. month)
    end,
    -- YYYY/M
    month_fm_2 = function()
        local year = today.year
        local month = today.month
        return (year .. "/" .. month)
    end,
    -- YYYY-MM
    month_fm_3 = function()
        local year = today.year
        local month = today.z_month
        return (year .. "-" .. month)
    end,
    -- YYYY-M
    month_fm_4 = function()
        local year = today.year
        local month = today.month
        return (year .. "-" .. month)
    end,
    -- YYYY年M月
    month_fm_5 = function()
        local year = today.year
        local month = today.month
        return (year .. "年" .. month .. "月")
    end,
    -- Next month
    next_month = function()
        local tmp = os.date("*t", os.time() + month_sec + day_sec)
        local year = tmp.year
        local month = string.format("%02d", tmp.month)
        return (year .. "年" .. month .. "月")
    end,
    -- Last month
    last_month = function()
        local tmp = os.date("*t", os.time() - month_sec)
        local year = tmp.year
        local month = string.format("%02d", tmp.month)
        return (year .. "年" .. month .. "月")
    end,
    -- 999_Templates/yearlyNoteTemplateFromObsidianNvim.md
    -- YYYY年
    current_year = function()
        local year = today.year
        return (year .. "年")
    end,
    -- Next year
    next_year = function()
        local tmp = os.date("*t", os.time() + year_sec)
        local year = tmp.year
        return (year .. "年")
    end,
    -- Last year
    last_year = function()
        local tmp = os.date("*t", os.time() - year_sec)
        local year = tmp.year
        return (year .. "年")
    end,
}

local f = require("plugins.obsidian-nvim.opts.funcs")

---@type boolean
local use_blink_cmp = require("config.settings").use_blink_cmp

---@type 'telescope.nvim' | 'fzf-lua' | 'mini.pick' | 'snacks.pick'
local picker_name = "telescope.nvim"

---@module 'obsidian'
---@type obsidian.config.ClientOpts
local opts = {
    workspaces = require("plugins.obsidian-nvim.opts.workspaces"),
    notes_subdir = "000_Inbox",
    daily_notes = {
        folder = "001_DailyNotes",
        date_format = "%Y年%m月%d日",
        --alias_format = "%B %-d, %Y",
        default_tags = { "daily-note" },
        -- NOTE: Should without `999_Templates/`
        template = "dailyNoteTemplateFromObsidianNvim.md",
        workdays_only = false,
    },
    completion = {
        nvim_cmp = not use_blink_cmp,
        blink = use_blink_cmp,
    },
    new_notes_location = "notes_subdir",
    disable_frontmatter = true,
    templates = {
        subdir = "999_Templates",
        date_format = "%Y年%m月%d日",
        time_format = "%H:%M",
        substitutions = substitutions,
    },
    use_advanced_uri = true,
    open_app_foreground = false,
    picker = {
        name = picker_name,
    },
    sort_by = "modified",
    sort_reversed = true,
    search_max_lines = 1000,
    open_notes_in = "current",
    ui = {
        enable = false,
    },
    attachments = {
        img_folder = "998_Attachments",
    },
    statusline = {
        enabled = true,
        format = "{{properties}} properties {{backlinks}} backlinks {{words}} words {{chars}} chars",
    },
    note_id_func = f.note_id_func,
    note_path_func = f.note_path_func,
    wiki_link_func = f.wiki_link_func,
    markdown_link_func = f.markdown_link_func,
    note_frontmatter_func = f.note_frontmatter_func,
    follow_url_func = f.follow_url_func,
    follow_img_func = f.follow_img_func,
}

return opts
