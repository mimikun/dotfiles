---@type LazySpec[]
local dependencies = {
    -- NOTE: all transparency changeable plugins
}

---@type table
local opts = {
    -- filepath to save transparency state
    transparency_state_file = vim.fn.expand("~") .. "/.local/state/term/transparency.txt",

    -- terminal emulators settings
    term = {
        -- wezterm is the only terminal supported as of now
        wezterm = {
            enabled = true,
            transparency_toggle_file = "", -- filepath to wezterm toggle script
        },
    },

    -- notification settings
    notifications = {
        enabled = true,
    },

    -- setup autocmd to set transparency mode when the neovim instance gains focus
    want_autocmd = false,

    -- callback function to be triggered when transparency changes
    on_transparency_change = function() end,
}

---@type LazySpec
local spec = {
    "IniyanKanmani/term-transparency.nvim",
    --lazy = false,
    --cmd = "CMDNAME",
    --keys = "",
    dependencies = dependencies,
    config = function()
        require("term_transparency").setup(opts)
    end,
    cond = false,
    enabled = false,
}

return spec
