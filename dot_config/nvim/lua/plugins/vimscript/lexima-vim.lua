---@type LazySpec
local spec = {
    "cohama/lexima.vim",
    --lazy = false,
    event = "BufRead",
    config = function()
        vim.g.lexima_no_default_rules = 0
        vim.g.lexima_map_escape = "<Esc>"
        vim.g.lexima_enable_basic_rules = 1
        vim.g.lexima_enable_newline_rules = 1
        vim.g.lexima_enable_space_rules = 1
        vim.g.lexima_enable_endwise_rules = 1
        vim.g.lexima_accept_pum_with_enter = 1
        vim.g.lexima_ctrlh_as_backspace = 0
        vim.g.lexima_disable_on_nofile = 0
        vim.g.lexima_disable_abbrev_trigger = 0
    end,
    cond = false,
}

return spec
