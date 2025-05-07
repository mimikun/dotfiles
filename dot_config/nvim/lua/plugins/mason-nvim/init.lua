local global = require("config.global")
local settings = require("config.settings")

---@type boolean
local need_all_servers = settings.need_all_servers

---@type LazySpec
local spec = {
    "mason-org/mason.nvim",
    -- WORKAROUND: v2 has BREAKING CHANGE
    commit = "fc98833b6da5de5a9c5b1446ac541577059555be",
    --lazy = false,
    cmds = require("plugins.mason-nvim.cmds"),
    event = "VeryLazy",
    dependencies = require("plugins.mason-nvim.dependencies"),
    config = function()
        local lspconfig = require("lspconfig")
        local configs = require("lspconfig.configs")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_conform = require("mason-conform")
        local mason_nvim_dap = require("mason-nvim-dap")

        require("neoconf").setup({})
        require("mason").setup(require("plugins.mason-nvim.opts"))

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

        if not configs.iwes then
            configs.iwes = {
                default_config = {
                    cmd = { "iwes" },
                    filetypes = { "markdown" },
                    root_dir = function(fname)
                        --local root_git = vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
                        local root_iwe = vim.fs.dirname(vim.fs.find(".iwe", { path = fname, upward = true })[1])
                        --return root_git or root_iwe
                        return root_iwe
                    end,
                    single_file_support = true,
                },
            }
        end

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
            lspconfig.fish_lsp.setup({})
            lspconfig.kulala_ls.setup({})
            lspconfig.superhtml.setup({})
            lspconfig.iwes.setup({})
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
            lspconfig.ctags_lsp.setup({})
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
