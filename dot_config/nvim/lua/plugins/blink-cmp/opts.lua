---@module 'blink.cmp'
---@type blink.cmp.Config
local opts = {
    enabled = function()
        local bo_buftype = vim.bo.buftype ~= "prompt"
        local b_completion = vim.b.completion ~= false
        local cond = bo_buftype and b_completion
        return cond
    end,
    --[[
enabled = function()
    local is_prompt_buftype = vim.api.nvim_get_option_value("buftype", {}) ~= "prompt"
    local is_dap_buffer = require("cmp_dap").is_dap_buffer()
    return is_prompt_buftype or is_dap_buffer
end,
]]
    keymap = require("plugins.blink-cmp.keymap"),
    snippets = require("plugins.blink-cmp.snippets"),
    completion = {
        list = { selection = "auto_insert" },
        trigger = { prefetch_on_insert = true },
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
    },
    -- Experimental signature help support
    signature = { enabled = true },
    sources = require("plugins.blink-cmp.sources"),
    appearance = require("plugins.blink-cmp.appearance"),
}

return opts
