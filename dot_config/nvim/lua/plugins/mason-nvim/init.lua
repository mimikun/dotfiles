local global = require("config.global")
local settings = require("config.settings")

---@type boolean
local need_all_servers = settings.need_all_servers

---@type LazySpec
local spec = {
    "williamboman/mason.nvim",
    --lazy = false,
    cmds = require("plugins.mason-nvim.cmds"),
    event = "VeryLazy",
    dependencies = require("plugins.mason-nvim.dependencies"),
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_conform = require("mason-conform")
        local mason_nvim_dap = require("mason-nvim-dap")

        require("neoconf").setup({})
        require("mason").setup({
            max_concurrent_installers = global.is_human_rights and 4 or 1,
            registries = {
                "github:mason-org/mason-registry",
                "github:mkindberg/ghostty-ls",
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
        })

        -- LSP
        mason_lspconfig.setup({
            ensure_installed = require("plugins.mason-nvim.lsp-servers"),
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = settings.use_blink_cmp and require("blink.cmp").get_lsp_capabilities()
                        or require("cmp_nvim_lsp").default_capabilities(),
                })
            end,
            ["rust_analyzer"] = function() end,
            ["lua_ls"] = function()
                lspconfig.lua_ls.setup(require("plugins.lsp-confs.lua-ls"))
            end,
            ["jsonls"] = function()
                lspconfig.jsonls.setup(require("plugins.lsp-confs.jsonls"))
            end,
            ["yamlls"] = function()
                lspconfig.yamlls.setup(require("plugins.lsp-confs.yamlls"))
            end,
            ["markdown_oxide"] = function()
                lspconfig.markdown_oxide.setup(require("plugins.lsp-confs.markdown-oxide"))
            end,
        })

        lspconfig.bashls.setup({})
        lspconfig.cssls.setup({})
        lspconfig.denols.setup({})
        lspconfig.docker_compose_language_service.setup({})
        lspconfig.dockerls.setup({})
        lspconfig.eslint.setup({})
        lspconfig.html.setup({})
        lspconfig.jsonls.setup({})
        lspconfig.lua_ls.setup({})
        lspconfig.luau_lsp.setup({})
        lspconfig.marksman.setup({})
        lspconfig.powershell_es.setup({})
        lspconfig.pyright.setup({})
        lspconfig.taplo.setup({})
        lspconfig.ts_ls.setup({})
        lspconfig.typos_lsp.setup({})
        lspconfig.vimls.setup({})
        lspconfig.yamlls.setup({})
        if not global.is_windows then
            lspconfig.markdown_oxide.setup({})
            lspconfig.svelte.setup({})
            if need_all_servers then
                lspconfig.csharp_ls.setup({})
                lspconfig.esbonio.setup({})
                lspconfig.gopls.setup({})
                lspconfig.jqls.setup({})
                lspconfig.nil_ls.setup({})
                lspconfig.solargraph.setup({})
            end
        end
        if need_all_servers then
            lspconfig.clangd.setup({})
            lspconfig.efm.setup({})
            lspconfig.graphql.setup({})
            lspconfig.neocmake.setup({})
            lspconfig.zls.setup({})
            lspconfig.sqls.setup({})
        end

        mason_conform.setup({
            ensure_installed = require("plugins.mason-nvim.formatters"),
            handlers = {
                function(formatter_name)
                    require("conform").formatters_by_ft = mason_conform.formatter_handler(formatter_name)
                end,
            },
        })

        require("mason-nvim-lint").setup({
            ensure_installed = require("plugins.mason-nvim.linters"),
            automatic_installation = true,
            quiet_mode = false,
        })

        -- DAP
        mason_nvim_dap.setup({
            ensure_installed = require("plugins.mason-nvim.dap-adapters"),
            handlers = {
                function(config)
                    mason_nvim_dap.default_setup(config)
                end,
            },
        })

        -- Utils
        require("mason-lock").setup({
            lockfile_path = global.mason_lockfile,
        })
    end,
    --cond = false,
    --enabled = false,
}

return spec
