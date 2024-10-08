---@type LazySpec
local spec = {
    --"hrsh7th/nvim-cmp",
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp",
    lazy = false,
    --event = "VeryLazy",
    dependencies = require("plugins.configs.nvim-cmp.dependencies"),
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        if require("config.settings").use_ai then
            require("copilot_cmp").setup({})
        end

        local act = require("plugins.configs.nvim-cmp.actions")

        cmp.setup({
            -- mapping
            mapping = cmp.mapping.preset.insert({
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if luasnip.expandable() then
                            luasnip.expand()
                        else
                            cmp.confirm({
                                select = true,
                            })
                        end
                    else
                        fallback()
                    end
                end),
                ["<Tab>"] = cmp.mapping(act.tab, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(act.shift_tab, { "i", "s" }),
            }),

            -- sources
            sources = cmp.config.sources(require("plugins.configs.nvim-cmp.cmp-config-sources")),

            -- snippet
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            -- formatting
            formatting = {
                format = require("lspkind").cmp_format({
                    -- "text" or "text_symbol", "symbol_text", "symbol"
                    mode = "text_symbol",
                    -- "codicons" or "default"
                    preset = "codicons",
                    symbol_map = { Copilot = "" },
                }),
            },
            enabled = function()
                local is_prompt_buftype = vim.api.nvim_get_option_value("buftype", {}) ~= "prompt"
                local is_dap_buffer = require("cmp_dap").is_dap_buffer()
                return is_prompt_buftype or is_dap_buffer
            end,
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "cmdline" },
                { name = "path" },
            }),
        })
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                {
                    name = "buffer",
                    option = {
                        keyword_pattern = [[\k\+]],
                    },
                },
            }),
        })
        cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
            sources = {
                { name = "dap" },
            },
        })
    end,
    --cond = false,
}

return spec
