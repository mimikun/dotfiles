-- thx: https://coralpink.github.io/commentary/neovim/lsp/mason.html

local global = require("core.global")
local settings = require("core.settings")
local iconsets = require("utils.icons")

local is_human_rights = global.is_human_rights
local lsp_servers = settings["lsp_servers"]
local icons = {
    kind = iconsets.get("kind"),
    documents = iconsets.get("documents"),
    ui = iconsets.get("ui"),
    ui_sep = iconsets.get("ui", true),
    misc = iconsets.get("misc"),
}

-- Limit the number of concurrent task depending on human rights or OS
---@type any limit the maximum amount of concurrent tasks
local concurrency_limit_check = function()
    local limit
    if is_human_rights then
        limit = 4
    else
        limit = 1
    end
    return limit
end

local concurrency = concurrency_limit_check()

return {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local nvim_lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local handlers = {
            function(server_name)
                nvim_lspconfig[server_name].setup({
                    capabilities = cmp_nvim_lsp.default_capabilities(),
                })
            end,
        }

        mason.setup({
            max_concurrent_installers = concurrency,
            ui = {
                check_outdated_packages_on_open = true,
                border = "rounded",
                width = 0.88,
                height = 0.8,
                icons = {
                    package_installed = icons.ui.Check,
                    package_pending = icons.misc.Ghost,
                    package_uninstalled = icons.kind.Close,
                },
            },
        })
        mason_lspconfig.setup({
            ensure_installed = lsp_servers,
            handlers = handlers,
        })
    end,
    --cond = false,
}
