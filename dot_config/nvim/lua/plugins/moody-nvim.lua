---@type table
local events = { "ModeChanged", "BufWinEnter", "WinEnter" }

---@type table
local opts = {
    disabled_filetypes = { "TelescopePrompt", "lazy" },
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
