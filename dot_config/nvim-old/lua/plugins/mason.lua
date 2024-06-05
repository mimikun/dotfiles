local global = require("core.global")
--local settings = require("core.settings")
local iconsets = require("utils.icons")

--local lsp_servers = settings["lsp_servers"]
---@type table
local lsp_servers = {
    -- OK Lsp
    "lua_ls",
    "marksman",
    "efm",
    "jsonls",
    -- NG Lsp
    "typos_lsp",
    -- Not tested Lsp
    "bashls",
    "clangd",
    "csharp_ls",
    "neocmake",
    "cssls",
    "denols",
    "dockerls",
    "docker_compose_language_service",
    "eslint",
    "gopls",
    "graphql",
    "html",
    "tsserver",
    "jqls",
    "luau_lsp",
    "markdown_oxide",
    "powershell_es",
    "pyright",
    "solargraph",
    "rust_analyzer",
    "esbonio",
    "taplo",
    "vimls",
    "yamlls",
    "zls",
}
if global.is_windows then
    -- Windows
    -- NOTE: Exclude csharp_ls, gopls, jqls, esbonio, markdown_oxide
    for i, v in ipairs(lsp_servers) do
        if
            (v == "csharp_ls")
            or (v == "gopls")
            or (v == "jqls")
            or (v == "esbonio")
            or (v == "solargraph")
            or (v == "markdown_oxide")
        then
            table.remove(lsp_servers, i)
        end
    end
end

---@type table
local icons = {
    kind = iconsets.get("kind"),
    documents = iconsets.get("documents"),
    ui = iconsets.get("ui"),
    ui_sep = iconsets.get("ui", true),
    misc = iconsets.get("misc"),
}

-- Limit the number of concurrent task depending on human rights or OS
---@type number|function limit the maximum amount of concurrent tasks
local concurrency_limit_check = function()
    local limit
    if global.is_human_rights then
        limit = 4
    else
        limit = 1
    end
    return limit
end

---@type number
local concurrency = concurrency_limit_check()

---@type string
local mason_lockfile = table.concat({ global.vim_path, "mason-lock.json" }, global.path_sep)

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
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_lock = require("mason-lock")
        local lspconfig = require("lspconfig")
        local configs = require("lspconfig.configs")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local neoconf = require("neoconf")
        local neodev = require("neodev")

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
                    capabilities = cmp_nvim_lsp.default_capabilities(),
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

        ---@type table
        local fish_lsp_root_files = {
            "config.fish",
            "$HOME/.config/fish",
            "/usr/share/fish",
        }

        -- TODO: fish-lsp
        -- NOTE: about :h lspconfig-setup
        -- NOTE: ref: https://github.com/ndonfris/fish-lsp/issues/22
        if not configs.fish_lsp then
            configs.fish_lsp = {
                default_config = {
                    root_dir = function(fname)
                        local root_files = lspconfig.util.root_pattern(unpack(fish_lsp_root_files))(fname)
                        return root_files
                    end,
                    name = "fish-lsp",
                    filetypes = { "fish" },
                    autostart = true,
                    single_file_support = true,
                    --on_new_config = function(new_config, new_root_dir) end,
                    --capabilities = {},
                    cmd = { "fish-lsp", "start" },
                    --handlers = {},
                    --init_options = {},
                    --on_attach = function(client, bufnr)end,
                    settings = {},
                },
            }
        end

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

        neoconf.setup({})
        neodev.setup({})
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
        lspconfig.fish_lsp.setup({})
        lspconfig.aiscript_lsp.setup({})
        mason_lock.setup({
            lockfile_path = mason_lockfile,
        })
    end,
    --cond = false,
}

return spec
