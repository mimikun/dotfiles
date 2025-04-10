---@type table
local opts = {
    commit_message = {
        language = "English",
    },
    mcp = {
        servers = {},
    },
    prompt_launchers = {
        Senpai = {
            priority = 99,
            system = "Answer as a senpai with a crazy casual tone.",
        },
        Tsundere = {
            priority = 100,
            system = "Answers should be tsundere style.",
        },
    },
    providers = {
        default = "openrouter",
        -- anthropic: `set -Ux ANTHROPIC_API_KEY "hogehoge"`
        -- https://sdk.vercel.ai/providers/ai-sdk-providers/anthropic#model-capabilities
        anthropic = {
            model_id = "claude-3-7-sonnet-20250219",
        },
        -- deepseek: `set -Ux DEEPSEEK_API_KEY "hogehoge"`
        -- https://sdk.vercel.ai/providers/ai-sdk-providers/deepseek#model-capabilities
        deepseek = {
            model_id = "deepseek-chat",
        },
        -- google: `set -Ux GOOGLE_GENERATIVE_AI_API_KEY "hogehoge"`
        -- https://sdk.vercel.ai/providers/ai-sdk-providers/google-generative-ai#model-capabilities
        google = {
            model_id = "gemini-1.5-pro",
        },
        -- openai: `set -Ux OPENAI_API_KEY "hogehoge"`
        -- https://sdk.vercel.ai/providers/ai-sdk-providers/openai#model-capabilities
        openai = {
            model_id = "gpt-4o",
        },
        -- openrouter: `set -Ux OPENROUTER_API_KEY "hogehoge"`
        -- https://openrouter.ai/models
        openrouter = {
            model_id = "anthropic/claude-3.7-sonnet",
        },
    },
    rag = {
        cache_strategy = "ask",
    },
}

return opts
