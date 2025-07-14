---@type table
local cmds = {
    "SqlsExecuteQuery",
    "SqlsExecuteQueryVertical",
    "SqlsShowDatabases",
    "SqlsShowSchemas",
    "SqlsShowConnections",
    "SqlsSwitchDatabase",
    "SqlsSwitchConnection",
}

---@type LazySpec
local spec = {
    "nanotee/sqls.nvim",
    --lazy = false,
    cmd = cmds,
    --cond = false,
    --enabled = false,
}

return spec
