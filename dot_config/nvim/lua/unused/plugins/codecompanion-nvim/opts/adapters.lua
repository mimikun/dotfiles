---@type table
local adapters = {
    openai = function()
        return require("codecompanion.adapters").extend("openai", {
            env = { api_key = vim.env.OPENAI_API_KEY },
        })
    end,
    openrouter_claude = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
                url = "https://openrouter.ai/api",
                api_key = vim.env.OPENROUTER_API_KEY,
                chat_url = "/v1/chat/completions",
            },
            schema = {
                model = {
                    default = "anthropic/claude-3.7-sonnet",
                },
            },
        })
    end,
    ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
            env = {
                url = "https://my_ollama_url",
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
}

return adapters
