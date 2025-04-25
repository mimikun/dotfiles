---@type CopilotChat.config
local opts = {
    system_prompt = "COPILOT_INSTRUCTIONS", -- System prompt to use (can be specified manually in prompt via /).
    model = "gpt-4o", -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
    agent = "none", -- Default agent to use, see ':CopilotChatAgents' for available agents (can be specified manually in prompt via @).
    context = nil, -- Default context or array of contexts to use (can be specified manually in prompt via #).
    sticky = nil, -- Default sticky prompt or array of sticky prompts to use at start of every new chat.
    temperature = 0.1, -- GPT result temperature
    headless = false, -- Do not write to chat buffer and use history (useful for using custom processing)
    stream = nil, -- Function called when receiving stream updates (returned string is appended to the chat buffer)
    callback = nil, -- Function called when full response is received (returned string is stored to history)
    remember_as_sticky = true, -- Remember model/agent/context as sticky prompts when asking questions
    include_contexts_in_prompt = true, -- Include contexts in prompt

    -- default selection
    --selection = select.visual,

    -- default window options
    window = {
        layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace', or a function that returns the layout
        width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
        height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
        -- Options below only apply to floating windows
        relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
        border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        row = nil, -- row position of the window, default is centered
        col = nil, -- column position of the window, default is centered
        title = "Copilot Chat", -- title of chat window
        footer = nil, -- footer of chat window
        zindex = 1, -- determines if window is on top or below other floating windows
    },

    show_help = true, -- Shows help message as virtual lines when waiting for user input
    show_folds = true, -- Shows folds for sections in chat
    highlight_selection = true, -- Highlight selection
    highlight_headers = true, -- Highlight headers in chat, disable if using markdown renderers (like render-markdown.nvim)
    references_display = "virtual", -- 'virtual', 'write', Display references in chat as virtual text or write to buffer
    auto_follow_cursor = true, -- Auto-follow cursor in chat
    auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
    insert_at_end = false, -- Move cursor to end of buffer when inserting text
    clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

    -- Static config starts here (can be configured only via setup function)

    allow_insecure = false, -- Allow insecure server connections

    chat_autocomplete = true, -- Enable chat autocompletion (when disabled, requires manual `mappings.complete` trigger)

    log_path = vim.fn.stdpath("state") .. "/CopilotChat.log", -- Default path to log file
    history_path = vim.fn.stdpath("data") .. "/copilotchat_history", -- Default path to stored history

    question_header = "## User ", -- Header to use for user questions
    answer_header = "## Copilot ", -- Header to use for AI answers
    error_header = "## Error ", -- Header to use for errors
    separator = "───", -- Separator to use in chat
}

return opts
