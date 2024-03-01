local global = require("core.global")
local settings = require("core.settings")
local iconsets = require("utils.icons")

---@type boolean
local is_human_rights = global.is_human_rights
---@type boolean
local is_windows = global.is_windows
---@type string
local vim_path = global.vim_path
---@type string
local path_sep = global.path_sep

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
if is_windows then
    -- Windows
    -- NOTE: Exclude csharp_ls, gopls, jqls, esbonio
    for i, v in ipairs(lsp_servers) do
        if (v == "csharp_ls") or (v == "gopls") or (v == "jqls") or (v == "esbonio") or (v == "solargraph") then
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
    if is_human_rights then
        limit = 4
    else
        limit = 1
    end
    return limit
end

---@type number
local concurrency = concurrency_limit_check()

---@type string
local mason_lockfile = table.concat({ vim_path, "mason-lock.json" }, path_sep)

return {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "zapling/mason-lock.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_lock = require("mason-lock")
        local nvim_lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

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
                nvim_lspconfig[server_name].setup({
                    capabilities = cmp_nvim_lsp.default_capabilities(),
                })
            end,

            ["lua_ls"] = function()
                nvim_lspconfig.lua_ls.setup({
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
        mason_lock.setup({
            lockfile_path = mason_lockfile,
        })
    end,
    --cond = false,
}
