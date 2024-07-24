---@type boolean
local use_ai_assistant = require("core.settings").use_ai_assistant

---@type table
local dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "nvim-orgmode/orgmode",
    "onsails/lspkind.nvim",
    "SergioRibera/cmp-dotenv",
    "staticWagomU/cmp-my-git-commit-prefix",
    "rcarriga/cmp-dap",
}

if use_ai_assistant then
    table.insert(dependencies, "zbirenbaum/copilot.lua")
    table.insert(dependencies, "zbirenbaum/copilot-cmp")
end

---@type table
local cmp_config_sources = {
    {
        name = "nvim_lsp",
        option = {
            markdown_oxide = {
                keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
            },
        },
    },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "emoji" },
    { name = "orgmode" },
    { name = "dotenv" },
    { name = "crates" },
    { name = "lazydev" },
    { name = "my-commit-prefix" },
}

if use_ai_assistant then
    table.insert(cmp_config_sources, { name = "copilot" })
end

---@type LazySpec
local spec = {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = dependencies,
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        if use_ai_assistant then
            require("copilot_cmp").setup({})
        end

        local has_words_before = function()
            -- selene: allow(incorrect_standard_library_use)
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                    -- that way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources(cmp_config_sources),
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            formatting = {
                format = require("lspkind").cmp_format({
                    -- "text" or "text_symbol", "symbol_text", "symbol"
                    mode = "text_symbol",
                    -- "codicons" or "default"
                    preset = "codicons",
                    -- TODO: Use utils/icons.lua
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
