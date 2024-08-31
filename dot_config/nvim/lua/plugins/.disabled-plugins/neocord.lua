local opts = {
    -- General options
    -- "auto" or url
    logo = "auto",
    -- nil or string
    logo_tooltip = nil,
    -- "language" or "logo"
    main_image = "language",
    -- Use your own Discord application client id (not recommended)
    client_id = "1157438221865717891",
    -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    log_level = nil,
    -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    debounce_timeout = 10,
    -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    blacklist = {},
    -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    file_assets = {},
    -- Show the timer
    show_time = true,
    -- if set true, timer won't update when any event are triggered
    global_timer = false,

    -- Rich Presence text options
    -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    editing_text = "Editing %s",
    -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    file_explorer_text = "Browsing %s",
    -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    git_commit_text = "Committing changes",
    -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    plugin_manager_text = "Managing plugins",
    -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    reading_text = "Reading %s",
    -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    workspace_text = "Working on %s",
    -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
    line_number_text = "Line %s out of %s",
    -- Format string rendered when in terminal mode.
    terminal_text = "Using Terminal",
}

---@type LazySpec
local spec = {
    "IogaMaster/neocord",
    --lazy = false,
    event = "VeryLazy",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
