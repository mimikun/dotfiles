---@type table
local cmds = {
    "LiveShareJoin",
    "LiveShareServer",
}

---@type string
local use_service
use_service = "localhost.run"
--use_service = "serveo.net"

---@type table
local opts = {
    port_internal = 9876,
    max_attempts = 20,
    service_url = "/tmp/service.url",
    service_pid = "/tmp/service.pid",
    service = use_service,
}

---@type LazySpec
local spec = {
    "azratul/live-share.nvim",
    --lazy = false,
    cmd = cmds,
    dependencies = { "jbyuki/instant.nvim" },
    init = function()
        vim.g.instant_username = "your-username"
    end,
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
