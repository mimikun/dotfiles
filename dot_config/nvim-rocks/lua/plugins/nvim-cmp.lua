local use_github_copilot = require("config.settings").use_github_copilot

local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local has_copilot = function()
    if vim.api.nvim_get_option_value("buftype", {}) == "prompt" then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

local act = {
    tab = function(fallback)
        if cmp.visible() then
            cmp.select_next_item(has_copilot() and { behavior = cmp.SelectBehavior.Select } or {})
            return
        end

        if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
            return
        end

        if has_words_before() then
            cmp.complete()
            return
        end

        fallback()
    end,

    shift_tab = function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
            return
        end

        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
            return
        end

        fallback()
    end,
}

-----@type table
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

if use_github_copilot then
    table.insert(cmp_config_sources, { name = "copilot" })
    require("copilot_cmp").setup({})
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
        ["<Tab>"] = cmp.mapping(act.tab, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(act.shift_tab, { "i", "s" }),
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
