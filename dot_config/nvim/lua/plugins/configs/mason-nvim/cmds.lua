local settings = require("config.settings")

---@type table
local cmds = {}

---@type table
local base = {
    -- mason.nvim
    "Mason",
    "MasonUpdate",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
    -- mason-extra-cmds
    "MasonUpdateAll",
    -- mason-lspconfig
    "LspInstall",
    "LspUninstall",
    -- mason-nvim-dap
    "DapInstall",
    "DapUninstall",
}

-- mason-null-ls.nvim
---@type table
local none_ls = {
    "NoneLsInstall",
    "NoneLsUninstall",
}

-- mason-guard.nvim
---@type table
local guard = {
    "GuardInstall",
    "GuardUninstall",
}

-- mason-efmls.nvim
---@type table
local efmls = {
    "EfmLsInstall",
    "EfmLsUninstall",
}

if settings.use_none_ls then
    cmds = vim.list_extend(base, none_ls)
elseif settings.use_efmls then
    cmds = vim.list_extend(base, efmls)
else
    if settings.use_guard then
        cmds = vim.list_extend(base, guard)
    end
end

return cmds
