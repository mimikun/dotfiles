---@type table
local cmds = {
    "SmoothCursorStart",
    "SmoothCursorStop",
    "SmoothCursorStatus",
    "SmoothCursorToggle",
    "SmoothCursorFancyToggle",
    "SmoothCursorFancyOn",
    "SmoothCursorFancyOff",
    "SmoothCursorDeleteSigns",
    "SmoothCursorJump",
}

---@type table
local opts = {
    -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
    cursor = "",
    fancy = {
        -- enable fancy mode
        enable = false,
        -- false to disable fancy head
        head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil },
        body = {
            { cursor = "󰝥", texthl = "SmoothCursorRed" },
            { cursor = "󰝥", texthl = "SmoothCursorOrange" },
            { cursor = "●", texthl = "SmoothCursorYellow" },
            { cursor = "●", texthl = "SmoothCursorGreen" },
            { cursor = "•", texthl = "SmoothCursorAqua" },
            { cursor = ".", texthl = "SmoothCursorBlue" },
            { cursor = ".", texthl = "SmoothCursorPurple" },
        },
        -- false to disable fancy tail
        tail = { cursor = nil, texthl = "SmoothCursor" },
    },
    disabled_filetypes = {
        "TelescopePrompt",
        "NvimTree",
        "lazy",
        "alpha",
        "lspinfo",
        "packer",
        "startify",
        "TelescopeResults",
        "dashboard",
        "Trouble",
    },
}

---@type LazySpec
local spec = {
    "gen740/SmoothCursor.nvim",
    --lazy = false,
    cmd = cmds,
    event = "BufEnter",
    opts = opts,
    --cond = false,
}

return spec
