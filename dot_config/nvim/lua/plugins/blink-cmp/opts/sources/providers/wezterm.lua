---@type table
local opts = {
    all_panes = false,
    capture_history = false,
    triggered_only = false,
    trigger_chars = { "." },
}

---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local wezterm = {
    module = "blink-cmp-wezterm",
    name = "wezterm",
    opts = opts,
}

return wezterm
