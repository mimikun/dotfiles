local vault_path = vim.fn.expand("$obsidian_vault_path")

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
    -- Obsidian vault path
    dir = vault_path,
    -- Default save location for newly created notes
    notes_subdir = "000_Inbox",
    log_level = vim.log.levels.DEBUG,
    -- Default save location for newly daily notes
    daily_notes = {
        folder = "001_DailyNotes",
        date_format = "%Y年%m月%d日",
    },
    disable_frontmatter = true,
    -- Obsidian templates folder
    templates = {
        subdir = "999_Templates",
        date_format = "%Y年%m月%d日",
    },
}

return {
    --"epwalsh/obsidian.nvim",
    "mimikun/obsidian.nvim",
    branch = "wsl-open-support",
    --lazy = false,
    event = events,
    cmd = cmds,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = opts,
    --cond = false,
}
