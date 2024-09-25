---@type table
local cmds = {
    "InstantFollow",
    "InstantJoinSession",
    "InstantJoinSingle",
    "InstantMark",
    "InstantMarkClear",
    "InstantOpenAll",
    "InstantSaveAll",
    "InstantStartServer",
    "InstantStartSession",
    "InstantStartSingle",
    "InstantStatus",
    "InstantStop",
    "InstantStopFollow",
    "InstantStopServer",
}

---@type LazySpec
local spec = {
    "jbyuki/instant.nvim",
    --lazy = false,
    cmd = cmds,
    init = function()
        vim.g.instant_username = "MY_USERNAME"
        vim.g.instant_only_cwd = true
    end,
    cond = false,
    enabled = false,
}

return spec
