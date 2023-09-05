local events = {
    "BufReadPre " .. vim.fn.expand("$obsidian_vault_path") .. "/**.md",
    "BufNewFile " .. vim.fn.expand("$obsidian_vault_path") .. "/**.md",
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
    dir = vim.fn.expand("$obsidian_vault_path"),
    notes_subdir = "000_Inbox",
    log_level = vim.log.levels.DEBUG,
    daily_notes = {
        folder = "001_DailyNotes",
        date_format = "%Y年%m月%d日",
    },
    disable_frontmatter = true,
    templates = {
        subdir = "999_Templates",
        date_format = "%Y年%m月%d日",
    },
}

local cond = (vim.fn.hostname() == "TanakaPC")

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
    --cond = cond,
    cond = true,
}
