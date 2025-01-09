---@type table
local cmds = {
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
    -- mason-null-ls.nvim
    --"NoneLsInstall",
    --"NoneLsUninstall",
    -- mason-conform.nvim
    "ConformInstall",
    "ConformUninstall",
    -- mason-nvim-lint
    -- TODO: add LinterInstall command
}

return cmds
