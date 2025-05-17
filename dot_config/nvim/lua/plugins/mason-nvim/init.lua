local settings = require("config.settings")

---@type boolean | string[] | { exclude: string[] }
local automatic_enable = true

---@type LazySpec
local spec = {
    "mason-org/mason.nvim",
    --lazy = false,
    cmds = require("plugins.mason-nvim.cmds"),
    event = "VeryLazy",
    dependencies = require("plugins.mason-nvim.dependencies"),
    config = function()
        local configs = require("lspconfig.configs")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_conform = require("mason-conform")
        local mason_nvim_dap = require("mason-nvim-dap")

        require("neoconf").setup({})
        require("mason").setup(require("plugins.mason-nvim.opts"))

        -- LSP
        mason_lspconfig.setup({
            ensure_installed = require("plugins.mason-nvim.lsp-servers"),
            automatic_enable = automatic_enable,
        })

        -- setup capabilities
        local capabilities = settings.use_blink_cmp and require("blink.cmp").get_lsp_capabilities()
            or require("cmp_nvim_lsp").default_capabilities()

        -- default lsp settings
        vim.lsp.config.defaults = {
            capabilities = capabilities,
        }

        vim.lsp.config["lua_ls"] =
            vim.tbl_deep_extend("force", vim.lsp.config.defaults or {}, require("plugins.lsp-confs.lua-ls"))

        vim.lsp.config["jsonls"] =
            vim.tbl_deep_extend("force", vim.lsp.config.defaults or {}, require("plugins.lsp-confs.jsonls"))

        vim.lsp.config["yamlls"] =
            vim.tbl_deep_extend("force", vim.lsp.config.defaults or {}, require("plugins.lsp-confs.yamlls"))

        vim.lsp.config["markdown_oxide"] =
            vim.tbl_deep_extend("force", vim.lsp.config.defaults or {}, require("plugins.lsp-confs.markdown-oxide"))

        vim.lsp.config["rust_analyzer"] = { enabled = false }

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
        -- NOTE: mason-lock.nvim not support mason v2
        --require("mason-lock").setup({
        --    require("config.global").mason_lockfile,
        --})
    end,
    --cond = false,
    --enabled = false,
}

return spec
