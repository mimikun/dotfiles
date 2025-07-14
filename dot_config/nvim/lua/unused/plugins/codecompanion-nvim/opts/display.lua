---@type table
local action_palette = {
    width = 95,
    height = 10,
    prompt = "Prompt ", -- Prompt used for interactive LLM calls
    provider = "default", -- default|telescope|mini_pick
    opts = {
        show_default_actions = true, -- Show the default actions in the action palette?
        show_default_prompt_library = true, -- Show the default prompt library in the action palette?
    },
}

---@type table
local chat = {
    -- Change the default icons
    icons = {
        pinned_buffer = " ",
        watched_buffer = "👀 ",
    },

    -- Alter the sizing of the debug window
    debug_window = {
        ---@return number|fun(): number
        width = vim.o.columns - 5,
        ---@return number|fun(): number
        height = vim.o.lines - 2,
    },

    -- Options to customize the UI of the chat buffer
    window = {
        layout = "vertical", -- float|vertical|horizontal|buffer
        position = nil, -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
        border = "single",
        height = 0.8,
        width = 0.45,
        relative = "editor",
        full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
        opts = {
            breakindent = true,
            cursorcolumn = false,
            cursorline = false,
            foldcolumn = "0",
            linebreak = true,
            list = false,
            numberwidth = 1,
            signcolumn = "no",
            spell = false,
            wrap = true,
        },
    },

    ---Customize how tokens are displayed
    ---@param tokens number
    ---@param adapter CodeCompanion.Adapter
    ---@return string
    token_count = function(tokens, adapter)
        return " (" .. tokens .. " tokens)"
    end,
    auto_scroll = false,
    intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
    show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
    --show_header_separator = true,
    separator = "─", -- The separator between the different messages in the chat buffer
    show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
    show_settings = false, -- Show LLM settings at the top of the chat buffer?
    show_token_count = true, -- Show the token count for each response?
    start_in_insert_mode = false, -- Open the chat buffer in insert mode?
}

---@type table
local diff = {
    enabled = true,
    close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
    layout = "vertical", -- vertical|horizontal split for default provider
    opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
    provider = "default", -- default|mini_diff
}

---@type table
local inline = {
    layout = "vertical", -- vertical|horizontal|buffer
}

---@type table
local display = {
    action_palette = action_palette,
    chat = chat,
    diff = diff,
    inline = inline,
}

return display
