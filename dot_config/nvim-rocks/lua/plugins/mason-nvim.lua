---@type table
local mlsp_need_servers = {}

---@type table
local mdap_need_adapters = {}

---@type table
local needs = {
    dap = {
        adapters = {
            --"cppdbg",
            --"delve",
            --"node2",
            --"chrome",
            --"firefox",
            --"php",
            --"coreclr",
            --"js",
            --"codelldb",
            --"javadbg",
            --"javatest",
            --"mock",
            --"puppet",
            --"elixir",
            --"kotlin",
            --"dart",
            --"haskell",
        },
    },
    lsp = {
        base = {
            "bashls",
            "cssls",
            "denols",
            "docker_compose_language_service",
            "dockerls",
            "eslint",
            "html",
            "jsonls",
            "lua_ls",
            "luau_lsp",
            "marksman",
            "powershell_es",
            "pyright",
            "rust_analyzer",
            "taplo",
            "ts_ls",
            "typos_lsp",
            "vimls",
            "yamlls",
        },
        not_windows = {
            "markdown_oxide",
        },
        addisional = {
            others = {
                "clangd",
                "efm",
                "graphql",
                "neocmake",
                "zls",
            },
            not_windows = {
                "csharp_ls",
                "esbonio",
                "gopls",
                "jqls",
                "nil_ls",
                "solargraph",
            },
        },
    },
}

-- NOTE: Include DAP_ADAPTER_NAME in is_linux
if require("config.global").is_linux then
    table.insert(needs.dap_adapters, "bash")
    table.insert(needs.dap_adapters, "python")
end

mdap_need_adapters = needs.dap_adapters

---@type table
mlsp_need_servers = vim.list_extend(mlsp_need_servers, needs.lsp.base)
-- NOTE: Include some langservers, NOT Windows
if not require("config.global").is_windows then
    ---@type table
    mlsp_need_servers = vim.list_extend(mlsp_need_servers, needs.lsp.not_windows)
    if require("config.settings").need_all_servers then
        ---@type table
        mlsp_need_servers = vim.list_extend(mlsp_need_servers, needs.addisional.not_windows)
    end
end

-- NOTE: Include some langservers, if need_all_servers set TRUE
if require("config.settings").need_all_servers then
    ---@type table
    mlsp_need_servers = vim.list_extend(mlsp_need_servers, needs.addisional.others)
end

table.sort(mdap_need_adapters)
table.sort(mlsp_need_servers)

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

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local mason_nvim_dap = require("mason-nvim-dap")

require("neoconf").setup({})
require("mason").setup(opts)

-- LSP
mason_lspconfig.setup({
    ensure_installed = mlsp_need_servers,
})

mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
    end,
    ["rust_analyzer"] = function() end,
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
                    },
                },
            },
        })
    end,
    ["jsonls"] = function()
        lspconfig.jsonls.setup({
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
        })
    end,
    ["yamlls"] = function()
        lspconfig.yamlls.setup({
            settings = {
                yaml = {
                    schemaStore = {
                        enable = false,
                        url = "",
                    },
                    schemas = require("schemastore").yaml.schemas(),
                },
            },
        })
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
end

-- DAP
mason_nvim_dap.setup({
    ensure_installed = mdap_need_adapters,
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
