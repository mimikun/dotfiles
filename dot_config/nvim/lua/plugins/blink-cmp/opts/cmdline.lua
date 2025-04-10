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
---@type blink.cmp.CmdlineConfig
local cmdline = {
    enabled = true,
    keymap = {
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
    },
    sources = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == "/" or type == "?" then
            return { "buffer" }
        end
        -- Commands
        if type == ":" or type == "@" then
            return { "cmdline", "path" }
        end
        return {}
    end,
    completion = {
        menu = {
            auto_show = true,
        },
    },
}

return cmdline
