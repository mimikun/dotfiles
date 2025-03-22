---@type rainbow_delimiters.config
local opts = {
    strategy = {
        [""] = "rainbow-delimiters.strategy.global",
        html = "rainbow-delimiters.strategy.local",
        -- Pick the strategy for LaTeX dynamically based on the buffer size
        latex = function(bufnr)
            -- Disabled for very large files, global strategy for large files,
            -- local strategy otherwise
            local line_count = vim.api.nvim_buf_line_count(bufnr)
            if line_count > 10000 then
                return nil
            elseif line_count > 1000 then
                return "rainbow-delimiters.strategy.global"
            end
            return "rainbow-delimiters.strategy.local"
        end,
        commonlisp = "rainbow-delimiters.strategy.local",
    },
    query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
        -- Determine the query dynamically
        query = function(bufnr)
            -- Use blocks for read-only buffers like in `:InspectTree`
            local is_nofile = vim.bo[bufnr].buftype == "nofile"
            return is_nofile and "rainbow-blocks" or "rainbow-delimiters"
        end,
    },
    priority = {
        [""] = 110,
        lua = 210,
    },
    highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
    },
    whitelist = {},
    blacklist = { "c", "cpp" },
    condition = {},
    log = {},
}

return opts
