---@class ConfigOptions
local opts = {
    stackwalk_path = nil,
    symbol_providers = {},
    load_module = nil,
    try_all_providers = false,
    on_symbol_loaded = nil,
    to_local_source = nil,
    jump_to_first_frame = true,

    view = {
        elements = { { "threads", "crash", "stack" }, "modules" },
        modules = { width = 40, height = 80, position = "right", keys = {} },
        threads = { width = 40, height = 20, position = "below", keys = {} },
        crash = { width = 40, height = 20, position = "right", keys = {} },
        stack = { width = 40, height = 20, position = "right", keys = { ["<cr>"] = "jump" } },
    },
}

return opts
