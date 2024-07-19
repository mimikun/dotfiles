local global = require("core.global")
local iconsets = require("utils.icons")

---@type table
local icons = {
    kind = iconsets.get("kind"),
    documents = iconsets.get("documents"),
    ui = iconsets.get("ui"),
    ui_sep = iconsets.get("ui", true),
    misc = iconsets.get("misc"),
}

---@type table
local dependencies = {
    -- LSP plugins
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "zapling/mason-lock.nvim",
    "b0o/schemastore.nvim",
    "folke/neoconf.nvim",
    { "folke/lazydev.nvim", ft = "lua" },
    "Bilal2453/luvit-meta",
    "justinsgithub/wezterm-types",
    "hrsh7th/cmp-nvim-lsp",
    -- DAP plugins
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
}

---@type LazySpec
local spec = {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = dependencies,
    config = function()
        local lspconfig = require("lspconfig")
        local configs = require("lspconfig.configs")

        require("neoconf").setup({})
        require("lazydev").setup({
            runtime = vim.env.VIMRUNTIME,
            library = {
                "lazy.nvim",
                { path = "luvit-meta/library", words = { "vim%.uv" } },
                { path = "wezterm-types", mods = { "wezterm" } },
            },
            integrations = {
                lspconfig = true,
                cmp = true,
            },
            enabled = function(root_dir)
                return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
            end,
        })

        local lsp_handlers = {
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                })
            end,

            ["lua_ls"] = function()
                lspconfig.lua_ls.setup(require("plugins.lsp.lua-ls"))
            end,
            ["jsonls"] = function()
                lspconfig.jsonls.setup(require("plugins.lsp.jsonls"))
            end,
            ["yamlls"] = function()
                lspconfig.yamlls.setup(require("plugins.lsp.yamlls"))
            end,
        }

        local dap_handlers = {
            function(config)
                require("mason-nvim-dap").default_setup(config)
            end,
        }

        if not configs.fish_lsp then
            configs.fish_lsp = require("plugins.lsp.fish-lsp")
        end

        if not configs.aiscript_lsp then
            configs.aiscript_lsp = require("plugins.lsp.aiscript-lsp")
        end

        require("mason").setup({
            max_concurrent_installers = global.is_human_rights and 4 or 1,
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
        require("mason-lspconfig").setup({
            ensure_installed = require("plugins.sources.servers").need_servers,
            handlers = lsp_handlers,
        })
        lspconfig.fish_lsp.setup({})
        lspconfig.aiscript_lsp.setup({})
        require("mason-nvim-dap").setup({
            ensure_installed = require("plugins.sources.dap").need_adapters,
            handlers = dap_handlers,
        })
        require("mason-lock").setup({
            lockfile_path = global.mason_lockfile,
        })
    end,
    --cond = false,
}

return spec
