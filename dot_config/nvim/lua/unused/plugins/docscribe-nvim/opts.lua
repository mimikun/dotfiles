---@module 'docscribe.config'
---@type table
local opts = {
    ui = {
        highlight = {
            -- "signature" | "full" | "none"
            style = "signature",
        },
    },
    llm = {
        provider = "ollama",
        model = "llama3.2",
    },
}

return opts
