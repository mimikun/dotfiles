local global = require("config.global")
local settings = require("config.settings")

---@type boolean
local need_all_servers = settings.need_all_servers

---@type boolean
local is_human_rights = global.is_human_rights

---@type table
local opts = {
    max_concurrent_installers = is_human_rights and 4 or 1,
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

---@type LazySpec
local spec = {
    "williamboman/mason.nvim",
    --lazy = false,
    cmds = require("plugins.configs.mason-nvim.cmds"),
    event = "VeryLazy",
    dependencies = require("plugins.configs.mason-nvim.deps"),
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_nvim_dap = require("mason-nvim-dap")

        require("neoconf").setup({})
        require("mason").setup(opts)

        -- LSP
        mason_lspconfig.setup({
            ensure_installed = require("plugins.configs.mason-lspconfig.ensure_installed"),
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                })
            end,
            ["rust_analyzer"] = function() end,
            ["lua_ls"] = function()
                lspconfig.lua_ls.setup(require("plugins.configs.lspconfigs.lua-ls"))
            end,
            ["jsonls"] = function()
                lspconfig.jsonls.setup(require("plugins.configs.lspconfigs.jsonls"))
            end,
            ["yamlls"] = function()
                lspconfig.yamlls.setup(require("plugins.configs.lspconfigs.yamlls"))
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
        lspconfig.rust_analyzer.setup({})
        lspconfig.taplo.setup({})
        lspconfig.ts_ls.setup({})
        lspconfig.typos_lsp.setup({})
        lspconfig.vimls.setup({})
        lspconfig.yamlls.setup({})
        if not global.is_windows then
            lspconfig.markdown_oxide.setup({})
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
        end

        -- All-in-one Linter, Formatter
        if settings.use_none_ls then
            require("mason-null-ls").setup({
                handlers = {},
            })
        elseif settings.use_efmls then
            -- TODO: mason-efmls
            print("WIP")
            --require("mason-efmls").setup({})
            -- Only Linter or Only Formatter
        else
            require("mason-nvim-lint").setup({
                -- TODO: select
                --ensure_installed = require("plugins.configs.mason-nvim-lint.ensure_installed"),
                ensure_installed = {},
                automatic_installation = is_human_rights,
                quiet_mode = false,
            })
            if settings.use_conform then
                require("mason-conform").setup({
                    -- TODO: select
                    --ignore_install = require("plugins.configs.mason-conform-nvim.ignore_install"),
                    ignore_install = {},
                })
            elseif settings.use_guard then
                -- TODO: mason-guard
                print("wip")
                --require("mason-guard").setup({})
            end
        end

        -- DAP
        mason_nvim_dap.setup({
            ensure_installed = require("plugins.configs.mason-nvim-dap.ensure_installed"),
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
}

return spec
