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

---@type table
local dependencies = {
    "nvim-lua/plenary.nvim",
    "rcarriga/nvim-notify",
    "kkharji/sqlite.lua",
}

---@type LazySpec
local spec = {
    "kode-team/mastodon.nvim",
    --lazy = false,
    cmd = cmds,
    dependencies = dependencies,
    config = true,
    --cond = false,
}

return spec
