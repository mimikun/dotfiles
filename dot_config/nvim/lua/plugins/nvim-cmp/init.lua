---@type boolean
local cond = not require("config.settings").use_blink_cmp

---@type LazySpec
local spec = {
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp",
    lazy = false,
    dependencies = require("plugins.nvim-cmp.dependencies"),
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        if require("config.settings").use_github_copilot then
            require("copilot_cmp").setup({})
        end

        local act = require("plugins.nvim-cmp.actions")

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
            sources = cmp.config.sources(require("plugins.nvim-cmp.cmp-config-sources")),

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
                --[[
                format = function(entry, vim_item)
                    local highlights_info = require("colorful-menu").cmp_highlights(entry)

                    -- highlight_info is nil means we are missing the ts parser, it's
                    -- better to fallback to use default `vim_item.abbr`. What this plugin
                    -- offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
                    if highlights_info ~= nil then
                        vim_item.abbr_hl_group = highlights_info.highlights
                        vim_item.abbr = highlights_info.text
                    end

                    return vim_item
                end,
                ]]
            },
            enabled = function()
                local is_prompt_buftype = vim.api.nvim_get_option_value("buftype", {}) ~= "prompt"
                local is_dap_buffer = require("cmp_dap").is_dap_buffer()
                return is_prompt_buftype or is_dap_buffer
            end,
            performance = {
                --fetching_timeout = 2000,
            },
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
    cond = cond,
    enabled = cond,
}

return spec
