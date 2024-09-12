local global = require("config.global")
local C = require("plugins.configs.mason-nvim.cmds")
local D = require("plugins.configs.mason-nvim.dependencies")

-- NOTE: Only one can be set to TRUE
---@type table
local use = {
    none_ls = true,
    efmls = false,
    conform = false,
    guard = false,
}

---@type table
local cmds = {}

if use.none_ls then
    cmds = vim.list_extend(C.base, C.none_ls)
elseif use.efmls then
    cmds = vim.list_extend(C.base, C.efmls)
else
    if use.guard then
        cmds = vim.list_extend(C.base, C.guard)
    end
end

---@type LazySpec[]
local dependencies = {}

if use.none_ls then
    dependencies = vim.list_extend(D.base, D.none_ls)
elseif use.efmls then
    dependencies = vim.list_extend(D.base, D.efmls)
else
    dependencies = vim.list_extend(D.base, D.nvim_lint)
    if use.guard then
        dependencies = vim.list_extend(D.base, D.guard)
    elseif use.conform then
        dependencies = vim.list_extend(D.base, D.conform)
    end
end

---@type table
local opts = {
    max_concurrent_installers = global.is_human_rights and 4 or 1,
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
    cmd = cmds,
    event = "VeryLazy",
    dependencies = dependencies,
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

        lspconfig.lua_ls.setup({})
        lspconfig.jsonls.setup({})
        lspconfig.yamlls.setup({})

        -- All-in-one Linter, Formatter
        if use.none_ls then
            require("mason-null-ls").setup({
                handlers = {},
            })
        elseif use.efmls then
            -- TODO: mason-efmls
            print("WIP")
            --require("mason-efmls").setup({})
        else
            -- Linter
            require("mason-nvim-lint").setup({
                ensure_installed = require("plugins.configs.mason-nvim-lint.ensure_installed"),
                automatic_installation = global.is_human_rights,
                quiet_mode = false,
            })
            -- Formatter
            if use.conform then
                require("mason-conform").setup({
                    ignore_install = require("plugins.configs.mason-conform-nvim.ignore_install"),
                })
            elseif use.guard then
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
