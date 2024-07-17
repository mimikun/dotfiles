---@type table
local events = { "ModeChanged", "BufWinEnter", "WinEnter" }

---@type table
local opts = {
    -- disable filetypes here. Add for example "TelescopePrompt" to
    -- not have any coloured cursorline for the telescope prompt.
    disabled_filetypes = { "TelescopePrompt" },
    -- you can turn on or off bold characters for the line numbers
    bold_nr = true,
}

---@type LazySpec
local spec = {
    "svampkorg/moody.nvim",
    --lazy = false,
    event = events,
    opts = opts,
    --cond = false,
}

return spec
