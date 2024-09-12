---@type table
local cmds = {}

---@type table
cmds.base = {
    -- mason.nvim
    "Mason",
    "MasonUpdate",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
    -- mason-lspconfig
    "LspInstall",
    "LspUninstall",
    -- mason-nvim-dap
    "DapInstall",
    "DapUninstall",
}

-- mason-null-ls.nvim
---@type table
cmds.none_ls = {
    "NoneLsInstall",
    "NoneLsUninstall",
}

-- mason-guard.nvim
---@type table
cmds.guard = {
    "GuardInstall",
    "GuardUninstall",
}

-- mason-efmls.nvim
---@type table
cmds.efmls = {
    "EfmLsInstall",
    "EfmLsUninstall",
}

return cmds
