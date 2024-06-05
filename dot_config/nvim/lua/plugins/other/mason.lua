local global = require("config.global")
local iconsets = require("utils.icons")
local icons = {
    ui = iconsets.get("ui"),
    misc = iconsets.get("misc"),
    kind = iconsets.get("kind"),
}

---@type table
local need_servers = {
    "lua_ls",
    "marksman",
    "efm",
    "jsonls",
    "typos_lsp",
    "bashls",
    "clangd",
    "neocmake",
    "cssls",
    "denols",
    "dockerls",
    "docker_compose_language_service",
    "eslint",
    "graphql",
    "html",
    "tsserver",
    "luau_lsp",
    "powershell_es",
    "pyright",
    "rust_analyzer",
    "taplo",
    "vimls",
    "yamlls",
    "zls",
}

-- Linux or WSL
if global.is_linux or global.is_wsl then
    table.insert(need_servers, "csharp_ls")
    table.insert(need_servers, "gopls")
    table.insert(need_servers, "jqls")
    table.insert(need_servers, "esbonio")
    table.insert(need_servers, "solargraph")
    table.insert(need_servers, "markdown_oxide")
end

---@type table
local lsp_servers = need_servers

---@type table
local dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "zapling/mason-lock.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "folke/neoconf.nvim",
    "folke/neodev.nvim",
}

---@type LazySpec
local spec = {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = dependencies,
    config = function()
        local lspconfig = require("lspconfig")
        local configs = require("lspconfig.configs")

        ---@param names string[]
        ---@return string[]
        local function get_plugin_paths(names)
            local plugins = require("lazy.core.config").plugins
            local paths = {}
            for _, name in ipairs(names) do
                if plugins[name] then
                    table.insert(paths, plugins[name].dir .. "/lua")
                else
                    vim.notify("Invalid plugin name" .. name)
                end
            end
            return paths
        end

        ---@param plugins string[]
        ---@return string[]
        local function library(plugins)
            local paths = get_plugin_paths(plugins)
            table.insert(paths, vim.fn.stdpath("config") .. "/lua")
            table.insert(paths, vim.env.VIMRUNTIME .. "/lua")
            table.insert(paths, "${3rd}/luv/library")
            table.insert(paths, "${3rd}/busted/library")
            table.insert(paths, "${3rd}/luassert/library")
            return paths
        end

        local handlers = {
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                })
            end,

            ["lua_ls"] = function()
                lspconfig.lua_ls.setup({
                    settings = {
                        Lua = {
                            --diagnostics = {},
                            format = {
                                -- Use stylua
                                enable = false,
                            },
                            runtime = {
                                version = "LuaJIT",
                                pathStrict = true,
                                path = { "?.lua", "?/init.lua" },
                            },
                            semantic = {
                                enable = false,
                            },
                            workspace = {
                                checkThirdParty = "Disable",
                                library = library({ "lazy.nvim" }),
                            },
                        },
                    },
                })
            end,
        }

        -- TODO: aiscript-lsp
        -- NOTE: about :h lspconfig-setup
        if not configs.aiscript_lsp then
            configs.aiscript_lsp = {
                default_config = {
                    root_dir = lspconfig.util.root_pattern("*.is", "*.ais"),
                    name = "aiscript-lsp",
                    filetypes = { "is", "ais" },
                    autostart = true,
                    single_file_support = true,
                    --on_new_config = function(new_config, new_root_dir) end,
                    --capabilities = {},
                    cmd = { "aiscript-languageserver", "--stdio" },
                    --handlers = {},
                    --init_options = {},
                    --on_attach = function(client, bufnr)end,
                    settings = {},
                },
            }
        end

        require("neoconf").setup({})
        require("neodev").setup({})
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
            ensure_installed = lsp_servers,
            handlers = handlers,
        })
        lspconfig.fish_lsp.setup({})
        lspconfig.aiscript_lsp.setup({})
        require("mason-lock").setup({
            lockfile_path = table.concat({ global.vim_path, "mason-lock.json" }, global.path_sep),
        })
    end,
    --cond = false,
}

return spec
