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

---@module 'blink.cmp'
---@type blink.cmp.KeymapConfig
local keymap = {
    preset = "none",
    ["<C-e>"] = { "cancel", "hide", "fallback" },
    ["<C-d>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    ["<C-n>"] = { "select_next", "fallback_to_mappings" },
    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
    ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<CR>"] = { "select_and_accept", "fallback" },

    ["<Tab>"] = {
        function(cmp)
            if cmp.is_visible() then
                return cmp.select_next()
                -- nvim-cmp
                --cmp.select_next_item(has_copilot() and { behavior = cmp.SelectBehavior.Select } or {})
                --return
            end
        end,
        "snippet_forward",
        function(cmp)
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
}

return keymap
