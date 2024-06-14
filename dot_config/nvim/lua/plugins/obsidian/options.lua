local M = {}

---@type table
local vaults = {
    {
        name = "mimikun",
        path = vim.fn.expand("$obsidian_vault_path"),
    },
}

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

---@type table
M.opts = {
    workspaces = vaults,

    -- Default save location for newly created notes
    notes_subdir = "000_Inbox",

    log_level = vim.log.levels.INFO,

    -- Default save location for newly daily notes
    daily_notes = {
        folder = "001_DailyNotes",
        date_format = "%Y年%m月%d日",
        -- NOTE: Should without `999_Templates/`
        template = "dailyNoteTemplateFromObsidianNvim.md",
    },

    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },

    -- NOTE: "current_dir" or "notes_subdir"
    new_notes_location = "notes_subdir",

    -- NOTE: "wiki" or "markdown"
    preferred_link_style = "wiki",

    disable_frontmatter = true,

    -- Obsidian templates folder
    templates = {
        subdir = "999_Templates",
        date_format = "%Y年%m月%d日",
        time_format = "%H:%M",
        substitutions = substitutions,
    },

    -- Use Obsidian Advanced URI plugin
    -- https://github.com/Vinzent03/obsidian-advanced-uri
    use_advanced_uri = true,

    open_app_foreground = false,

    picker = {
        name = "telescope.nvim",
    },

    -- NOTE: "path", "modified", "accessed", or "created"
    sort_by = "modified",
    sort_reversed = true,

    -- Set the maximum number of lines to read from notes on disk when performing certain searches.
    search_max_lines = 1000,

    -- NOTE: "current", "vsplit" or "hsplit"
    open_notes_in = "current",

    ui = {
        enable = true,
        update_debounce = 200,
        checkboxes = {
            -- TODO: Use utils/icons.lua
            [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
            -- TODO: Use utils/icons.lua
            ["x"] = { char = "", hl_group = "ObsidianDone" },
            -- TODO: Use utils/icons.lua
            [">"] = { char = "", hl_group = "ObsidianRightArrow" },
            -- TODO: Use utils/icons.lua
            ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
            ["!"] = { char = "", hl_group = "ObsidianImportant" },
        },
        -- TODO: Use utils/icons.lua
        bullets = { char = "•", hl_group = "ObsidianBullet" },
        -- TODO: Use utils/icons.lua
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
        block_ids = { hl_group = "ObsidianBlockID" },
        hl_groups = {
            ObsidianTodo = { bold = true, fg = "#f78c6c" },
            ObsidianDone = { bold = true, fg = "#89ddff" },
            ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
            ObsidianTilde = { bold = true, fg = "#ff5370" },
            ObsidianImportant = { bold = true, fg = "#d73128" },
            ObsidianBullet = { bold = true, fg = "#89ddff" },
            ObsidianRefText = { underline = true, fg = "#c792ea" },
            ObsidianExtLinkIcon = { fg = "#c792ea" },
            ObsidianTag = { italic = true, fg = "#89ddff" },
            ObsidianBlockID = { italic = true, fg = "#89ddff" },
            ObsidianHighlightText = { bg = "#75662e" },
        },
    },

    attachments = {
        img_folder = "998_Attachments",
    },
}

return M
