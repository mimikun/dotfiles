---@type boolean
local use_ai = require("config.settings").use_ai

---@type LazySpec[]
local dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "folke/lazydev.nvim",
    "hrsh7th/cmp-emoji",
    "nvim-orgmode/orgmode",
    "SergioRibera/cmp-dotenv",
    "rcarriga/cmp-dap",
}

---@type table
local cmp_config_sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "lazydev" },
    {
        name = "nvim_lsp",
        option = {
            markdown_oxide = {
                keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
            },
        },
    },
    { name = "emoji" },
    { name = "orgmode" },
    { name = "dotenv" },
    { name = "crates" },
}

if use_ai then
    table.insert(dependencies, "zbirenbaum/copilot.lua")
    table.insert(dependencies, "zbirenbaum/copilot-cmp")
    table.insert(cmp_config_sources, { name = "copilot" })
end

---@type LazySpec
local spec = {
    "hrsh7th/nvim-cmp",
    lazy = false,
    --event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        if use_ai then
            require("copilot_cmp").setup({})
        end

        -- TODO: https://coralpink.github.io/commentary/neovim/lsp/copilot-cmp.html
        local has_words_before = function()
            -- selene: allow(incorrect_standard_library_use)
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

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
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            -- sources
            sources = cmp.config.sources(cmp_config_sources),

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
                return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
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
