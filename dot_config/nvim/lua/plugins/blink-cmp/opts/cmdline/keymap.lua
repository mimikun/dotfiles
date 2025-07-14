local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

---@type table
local keymap = {
    ["<CR>"] = {
        "accept_and_enter",
        "fallback",
    },
    ["<Tab>"] = {
        --"show",
        --"accept",
        function(cmp)
            if cmp.is_visible() then
                return cmp.select_next()
            end
        end,
        function(cmp)
            if has_words_before() then
                return cmp.accept()
            end
        end,
        --"select_next",
        "fallback",
    },
    ["<S-Tab>"] = {
        function(cmp)
            if cmp.is_visible() then
                return cmp.select_prev()
            end
        end,
        --"select_prev",
        "fallback",
    },
}

return keymap
