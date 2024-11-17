local constants = {
    LLM_ROLE = "llm",
    USER_ROLE = "user",
    SYSTEM_ROLE = "system",
}

---@type table
local adapters = {
    -- LLMs
    ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
            env = {
                url = "http://127.0.0.1:11434",
                api_key = "OLLAMA_API_KEY",
            },
            headers = {
                ["Content-Type"] = "application/json",
                ["Authorization"] = "Bearer ${api_key}",
            },
            parameters = {
                sync = true,
            },
        })
    end,
    -- OPTIONS
    opts = {
        -- Allow insecure connections?
        allow_insecure = false,
        -- [protocol://]host[:port] e.g. socks5://127.0.0.1:9999
        proxy = nil,
    },
}

-- STRATEGIES
---@type table
local strategies = {
    -- CHAT STRATEGY
    chat = {
        adapter = "ollama",
        roles = {
            -- The markdown header content for the LLM's responses
            llm = "CodeCompanion",
            -- The markdown header for your questions
            user = "Me",
        },
        slash_commands = {
            ["buffer"] = {
                opts = {
                    -- default|telescope|mini_pick|fzf_lua
                    provider = "default",
                },
            },
            ["file"] = {
                opts = {
                    -- telescope|mini_pick|fzf_lua
                    provider = "telescope",
                },
            },
            ["help"] = {
                opts = {
                    -- telescope|mini_pick
                    provider = "telescope",
                },
            },
        },
    },
    -- INLINE STRATEGY
    inline = {
        adapter = "ollama",
    },
    -- AGENT STRATEGY
    agent = {
        --NOTE: This uses the adapter specified in the chat strategy
        tools = {
            ["rag"] = {
                --- Uses the awesome http://jina.ai tool (which is free!)
                callback = "helpers.tools.rag",
                description = "Supplement the LLM with real-time info from the internet",
                opts = {
                    api_key = nil,
                },
            },
            opts = {
                -- Send any errors to the LLM automatically?
                auto_submit_errors = false,
                -- Send any successful output to the LLM automatically?
                auto_submit_success = true,
                system_prompt = [[## Tools

You now have access to tools:
- These enable you to assist the user with specific tasks
- The user will outline which specific tools you have access to in due course
- You trigger a tool by following a specific XML schema which is defined for each tool

You must:
- Only use the tool when prompted by the user, despite having access to it
- Follow the specific tool's schema, which will be provided
- Respond with the schema in XML format
- Ensure the schema is in a markdown code block that is designated as XML
- Ensure any output you're intending to execute will be able to parsed as valid XML

Points to note:
- The user detects that you've triggered a tool by using Tree-sitter to parse your markdown response
- It will only ever parse the last XML code block in your response
- If your response doesn't follow the tool's schema, the tool will not execute
- Tools should not alter your core tasks and how you respond to a user]],
            },
        },
    },
}

---@type table
local display = {
    chat = {
        window = {
            -- float|vertical|horizontal|buffer
            layout = "vertical",
            border = "single",
            height = 0.8,
            width = 0.45,
            relative = "editor",
        },
        -- The separator between the different messages in the chat buffer
        separator = "─",
        -- Show LLM settings at the top of the chat buffer?
        show_settings = false,
        -- Show the token count for each response?
        show_token_count = true,
        -- Open the chat buffer in insert mode?
        start_in_insert_mode = false,
    },
    diff = {
        -- vertical|horizontal split for default provider
        layout = "vertical",
        -- default|mini_diff
        provider = "default",
    },
    inline = {
        -- vertical|horizontal|buffer
        layout = "vertical",
    },
}

---@type table
local general_opts = {
    send_code = false,
}

---@type table
local opts = {
    adapters = adapters,
    strategies = strategies,
    --prompt_library = prompt_library,
    display = display,
    opts = general_opts,
}

return opts
