-- https://cmp.saghen.dev/configuration/keymap.html
-- https://github.com/Saghen/blink.cmp/blob/main/lua/blink/cmp/init.lua
-- https://github.com/hrsh7th/nvim-cmp/blob/main/doc/cmp.txt#L210

local keymap = {
    preset = "enter",

    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "cancel", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-d>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

    -- TODO:
    ["<CR>"] = {
        function(cmp)
            return cmp.accept()
        end,
        "fallback",
    },
    ["<Tab>"] = {
        "snippet_forward",
        "fallback",
    },
    ["<S-Tab>"] = {
        "snippet_backward",
        "fallback",
    },
}

return keymap
--[[
--nvim-cmp/actions.lua
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

local M = {}

M.tab = function(fallback)
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
end

M.shift_tab = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
        return
    end

    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
        return
    end

    fallback()
end

return M
]]
--[[
--nvim-cmp/init.lua
local cmp = require("cmp")
local luasnip = require("luasnip")

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
})
]]
