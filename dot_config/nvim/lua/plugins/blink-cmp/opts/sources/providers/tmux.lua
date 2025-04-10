---@type table
local opts = {
    all_panes = false,
    capture_history = false,
    -- only suggest completions from `tmux` if the `trigger_chars` are used
    triggered_only = false,
    trigger_chars = { "." },
}

---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local tmux = {
    module = "blink-cmp-tmux",
    name = "tmux",
    opts = opts,
}

return tmux
