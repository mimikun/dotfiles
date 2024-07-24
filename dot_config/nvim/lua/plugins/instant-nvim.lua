---@type table
local cmds = {
    "InstantStartServer",
    "InstantStopServer",
    "InstantStartSingle",
    "InstantJoinSingle",
    "InstantStatus",
    "InstantFollow",
    "InstantStopFollow",
    "InstantStartSession",
    "InstantJoinSession",
    "InstantMark",
    "InstantMarkClear",
    "InstantOpenAll",
    "InstantSaveAll",
}

---@type LazySpec
local spec = {
    "jbyuki/instant.nvim",
    --lazy = false,
    cmd = cmds,
    init = function()
        vim.g.instant_username = vim.env.GITHUB_USERNAME
    end,
    cond = false,
}

return spec
