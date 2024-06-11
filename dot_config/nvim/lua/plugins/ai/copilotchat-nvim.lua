---@type table
local cmds = {
    "CopilotChat",
    "CopilotChatOpen",
    "CopilotChatClose",
    "CopilotChatToggle",
    "CopilotChatReset",
    "CopilotChatSave",
    "CopilotChatLoad",
    "CopilotChatDebugInfo",
    "CopilotChatExplain",
    "CopilotChatReview",
    "CopilotChatFix",
    "CopilotChatOptimize",
    "CopilotChatDocs",
    "CopilotChatTests",
    "CopilotChatFixDiagnostic",
    "CopilotChatCommit",
    "CopilotChatCommitStaged",
}

---@type table
local dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
}

---@type table
local opts = {
    -- Enable debug logging
    debug = false,
    -- [protocol://]host[:port] Use this proxy
    proxy = nil,
    -- Allow insecure server connections
    allow_insecure = false,
    -- System prompt to use
    --system_prompt = prompts.COPILOT_INSTRUCTIONS,
    -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
    model = "gpt-4",
    -- GPT temperature
    temperature = 0.1,

    -- Header to use for user questions
    question_header = "## User ",
    -- Header to use for AI answers
    answer_header = "## Copilot ",
    -- Header to use for errors
    error_header = "## Error ",
    -- Separator to use in chat
    separator = "---",

    -- Shows folds for sections in chat
    show_folds = true,
    -- Shows help message as virtual lines when waiting for user input
    show_help = true,
    -- Auto-follow cursor in chat
    auto_follow_cursor = true,
    -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
    auto_insert_mode = false,
    -- Clears chat on every new prompt
    clear_chat_on_new_prompt = false,

    -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
    context = nil,
    -- Default path to stored history
    history_path = vim.fn.stdpath("data") .. "/copilotchat_history",
    -- Callback to use when ask response is received
    callback = nil,

    -- default selection (visual or line)
    --[[
    selection = function(source)
        return select.visual(source) or select.line(source)
    end,

    -- default prompts
    prompts = {
        Explain = {
            prompt = "/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.",
        },
        Review = {
            prompt = "/COPILOT_REVIEW Review the selected code.",
            callback = function(response, source)
                -- see config.lua for implementation
            end,
        },
        Fix = {
            prompt = "/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.",
        },
        Optimize = {
            prompt = "/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.",
        },
        Docs = {
            prompt = "/COPILOT_GENERATE Please add documentation comment for the selection.",
        },
        Tests = {
            prompt = "/COPILOT_GENERATE Please generate tests for my code.",
        },
        FixDiagnostic = {
            prompt = "Please assist with the following diagnostic issue in file:",
            selection = select.diagnostics,
        },
        Commit = {
            prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
            selection = select.gitdiff,
        },
        CommitStaged = {
            prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
            selection = function(source)
                return select.gitdiff(source, true)
            end,
        },
    },
    ]]

    -- default window options
    window = {
        -- 'vertical', 'horizontal', 'float'
        layout = "vertical",
        -- fractional width of parent, or absolute width in columns when > 1
        width = 0.5,
        -- fractional height of parent, or absolute height in rows when > 1
        height = 0.5,
        -- Options below only apply to floating windows
        -- 'editor', 'win', 'cursor', 'mouse'
        relative = "editor",
        -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        border = "single",
        -- row position of the window, default is centered
        row = nil,
        -- column position of the window, default is centered
        col = nil,
        -- title of chat window
        title = "Copilot Chat",
        -- footer of chat window
        footer = nil,
        -- determines if window is on top or below other floating windows
        zindex = 1,
    },

    -- default mappings
    mappings = {
        complete = {
            detail = "Use @<Tab> or /<Tab> for options.",
            insert = "<Tab>",
        },
        close = {
            normal = "q",
            insert = "<C-c>",
        },
        reset = {
            normal = "<C-l>",
            insert = "<C-l>",
        },
        submit_prompt = {
            normal = "<CR>",
            insert = "<C-m>",
        },
        accept_diff = {
            normal = "<C-y>",
            insert = "<C-y>",
        },
        yank_diff = {
            normal = "gy",
        },
        show_diff = {
            normal = "gd",
        },
        show_system_prompt = {
            normal = "gp",
        },
        show_user_selection = {
            normal = "gs",
        },
    },
}

---@type LazySpec
local spec = {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    --lazy = false,
    cmd = cmds,
    dependencies = dependencies,
    opts = opts,
    cond = require("core.settings").use_ai_assistant,
}

return spec
