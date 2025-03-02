---@type table
local opts = {
    max_concurrent_installers = require("config.global").is_human_rights and 4 or 1,
    registries = {
        "github:crashdummyy/mason-registry",
        "github:mimikun/mason-registry",
        "github:mkindberg/ghostty-ls",
        "github:mason-org/mason-registry",
    },
    ui = {
        check_outdated_packages_on_open = true,
        border = "rounded",
        width = 0.88,
        height = 0.8,
        icons = {
            package_installed = "󰗠",
            package_pending = "󰊠",
            package_uninstalled = "󰅙",
        },
    },
    log_level = vim.log.levels.DEBUG,
}

return opts
