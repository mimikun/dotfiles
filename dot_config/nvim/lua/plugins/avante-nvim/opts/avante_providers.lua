---@type {[string]: AvanteProvider}
local avante_providers = {
    ---@type AvanteSupportedProvider
    copilot = {
        model = "gpt-4o-2024-11-20",
        allow_insecure = false, -- Allow insecure server connections
        timeout = 30000, -- Timeout in milliseconds
        context_window = 64000, -- Number of tokens to send to the model for context
        extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
        },
    },
    ---@type AvanteSupportedProvider
    claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        timeout = 30000, -- Timeout in milliseconds
        context_window = 200000,
        extra_request_body = {
            temperature = 0.75,
            max_tokens = 64000,
        },
    },
    ---@type AvanteSupportedProvider
    gemini = {
        endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
        model = "gemini-2.0-flash",
        timeout = 30000, -- Timeout in milliseconds
        context_window = 1048576,
        use_ReAct_prompt = true,
        extra_request_body = {
            generationConfig = {
                temperature = 0.75,
            },
        },
    },
    ---@type AvanteSupportedProvider
    ollama = {
        --endpoint = "http://127.0.0.1:11434",
        endpoint = "http://localhost:11434",
        model = "qwq:32b",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
            options = {
                temperature = 0.75,
                num_ctx = 20480,
                keep_alive = "5m",
            },
        },
    },
}

return avante_providers
