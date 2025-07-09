---@type table
local opts = {
    icons = false,
    git_conventions = {
        docs = { icon = "📖", prefix = "docs", type = "Documentation changes" },
        fix = { icon = "🐛", prefix = "fix", type = "Bug fix" },
        feat = { icon = "✨", prefix = "feat", type = "New feature" },
        enhance = { icon = "⚡", prefix = "enhance", type = "Enhancement" },
        chore = { icon = "🧹", prefix = "chore", type = "Chore" },
        refactor = { icon = "⚠️", prefix = "refactor", type = "Breaking change" },
    },
    provider_options = {
        gemini = {
            model = "gemini-2.0-flash",
            api_key = "YOUR_API_KEY",
            stream = false,
        },
        openai = {
            model = "gpt-4o",
            api_key = "YOUR_API_KEY",
            stream = false,
        },
        claude = {
            model = "sonnet",
            api_key = "YOUR_API_KEY",
            stream = false,
        },
    },
}

return opts
