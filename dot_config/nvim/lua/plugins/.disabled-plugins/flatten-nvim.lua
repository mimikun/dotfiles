---@type table
local opts = {
    ---@type table<string, boolean> dictionary of filetypes that should be blocking
    block_for = {
        gitcommit = true,
        gitrebase = true,
    },
    -- Window options
    window = {
        -- Options:
        -- current        -> open in current window (default)
        -- alternate      -> open in alternate window (recommended)
        -- tab            -> open in new tab
        -- split          -> open in split
        -- vsplit         -> open in vsplit
        -- smart          -> smart open (avoids special buffers)
        -- OpenHandler    -> allows you to handle file opening yourself (see Types)
        open = "alternate",
        -- Options:
        -- vsplit         -> opens files in diff vsplits
        -- split          -> opens files in diff splits
        -- tab_vsplit     -> creates a new tabpage, and opens diff vsplits
        -- tab_split      -> creates a new tabpage, and opens diff splits
        -- OpenHandler    -> allows you to handle file opening yourself (see Types)
        diff = "tab_vsplit",
        -- Affects which file gets focused when opening multiple at once
        -- Options:
        -- "first"        -> open first file of new files (default)
        -- "last"         -> open last file of new files
        focus = "first",
    },
    -- The `default_pipe_path` will treat the first nvim instance within a single kitty/wezterm session as the host
    -- You can configure this behaviour using the following opt-in integrations:
    one_per = {
        -- Flatten all instance in the current Kitty session
        kitty = false,
        -- Flatten all instance in the current Wezterm session
        wezterm = false,
    },
}

---@type LazySpec
local spec = {
    "willothy/flatten.nvim",
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    opts = opts,
    priority = 1001,
    cond = false,
    enabled = false,
}

return spec
