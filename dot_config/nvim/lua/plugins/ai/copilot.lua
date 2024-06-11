---@type table
local opts = {
    panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
        },
        layout = {
            -- | top | left | right
            position = "bottom",
            ratio = 0.4,
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
        keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
    },
    filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
    },
    -- Node.js version must be > 18.x
    copilot_node_command = "node",
    server_opts_overrides = {},
}

---@type LazySpec
local spec = {
    "zbirenbaum/copilot.lua",
    --lazy = false,
    event = "InsertEnter",
    cmd = "Copilot",
    opts = opts,
    cond = require("core.settings").use_ai_assistant,
}

return spec
