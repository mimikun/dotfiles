---@type table
local cmds = {
    "MastodonTootMessage",
    "MastodonAddAccount",
    "MastodonSelectAccount",
    "MastodonLoadHomeTimeline",
    "MastodonLoadBookmarks",
    "MastodonLoadFavourites",
    "MastodonLoadReplies",
    "MastodonReload",
}

---@type LazySpec
local spec = {
    "kode-team/mastodon.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "rcarriga/nvim-notify",
        "kkharji/sqlite.lua",
    },
    config = true,
    --cond = false,
}

return spec
