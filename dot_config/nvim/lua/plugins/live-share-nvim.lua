---@type table
local cmds = {
    "LiveShareServer",
    "LiveShareJoin",
}

---@type LazySpec
local spec = {
    "azratul/live-share.nvim",
    --lazy = false,
    cmd = cmds,
    dependencies = { "jbyuki/instant.nvim" },
    opts = {
        -- Service to use, options are serveo.net or localhost.run
        service = "localhost.run",
    },
    cond = false,
}

return spec
