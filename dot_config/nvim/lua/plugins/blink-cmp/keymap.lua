local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

--[[
local has_copilot = function()
    if vim.api.nvim_get_option_value("buftype", {}) == "prompt" then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end
]]

--local cmp = require("cmp")
--local luasnip = require("luasnip")

local keymap = {
    --preset = "super-tab",
    preset = "none",

    -- cmp.mapping.complete(),
    ["<C-space>"] = {
        "show",
        "show_documentation",
        "hide_documentation",
    },
    -- cmp.mapping.abort(),
    ["<C-e>"] = {
        "cancel",
        "hide",
        "fallback",
    },

    --[[
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
    ]]
    ["<CR>"] = {
        "select_and_accept",
        "fallback",
    },

    ["<Tab>"] = {
        function(cmp)
            if cmp.is_visible() then
                return cmp.select_next()
            end

            if cmp.snippet_active() then
                return cmp.snippet_forward()
            end

            if has_words_before() then
                return cmp.accept()
            end
        end,
        "fallback",
    },

    ["<S-Tab>"] = {
        function(cmp)
            if cmp.is_visible() then
                return cmp.select_prev()
            end
        end,
        "snippet_backward",
        "fallback",
    },

    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },

    ["<C-d>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

    ["<C-g>"] = {
        function()
            require("blink-cmp").show({ providers = { "ripgrep" } })
        end,
    },
}

return keymap
--[[
["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
        return
    end

    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
        return
    end

    fallback()
end, { "i", "s" }),
]]
--[[
["<Tab>"] = cmp.mapping(function(fallback)
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
end, { "i", "s" }),
]]
