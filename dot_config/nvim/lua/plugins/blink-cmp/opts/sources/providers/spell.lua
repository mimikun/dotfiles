---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local spell = {
    name = "Spell",
    module = "blink-cmp-spell",
    opts = {
        -- EXAMPLE: Only enable source in `@spell` captures, and disable it in `@nospell` captures.
        enable_in_context = function()
            local curpos = vim.api.nvim_win_get_cursor(0)
            local captures = vim.treesitter.get_captures_at_pos(0, curpos[1] - 1, curpos[2] - 1)
            local in_spell_capture = false
            for _, cap in ipairs(captures) do
                if cap.capture == "spell" then
                    in_spell_capture = true
                elseif cap.capture == "nospell" then
                    return false
                end
            end
            return in_spell_capture
        end,
    },
}

return spell
