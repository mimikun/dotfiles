---@alias avante.Mode "agentic" | "legacy"
---@type avante.Mode
local avante_mode = "agentic"

---@alias avante.ProviderName "claude" | "openai" | "gemini" | "copilot" | "ollama" | string
---@type avante.ProviderName
local provider_name = "claude"

-- XXX: Can't set 'copilot'!
---@type "claude" | "openai" | "ollama" | string
local auto_suggestions_provider = "claude"

---@type "native" | "snacks" | "telescope" | avante.SelectorProvider
local selector_provider = "telescope"

---@module 'avante'
---@type avante.Config
local opts = {
    mode = avante_mode,
    provider = provider_name,
    auto_suggestions_provider = auto_suggestions_provider,
    ---@type string | fun(): string | nil
    system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub:get_active_servers_prompt()
    end,
    rag_service = require("plugins.avante-nvim.opts.rag_service"),
    web_search_engine = {
        provider = "tavily",
    },
    providers = require("plugins.avante-nvim.opts.providers"),
    behaviour = require("plugins.avante-nvim.opts.behaviour"),
    hints = { enabled = true },
    highlights = {
        ---@type AvanteConflictHighlights
        diff = {
            current = "DiffText",
            incoming = "DiffAdd",
        },
    },
    windows = {
        ---@alias AvantePosition "right" | "left" | "top" | "bottom" | "smart"
        ---@type AvantePosition
        position = "right",
    },
    --- @class AvanteFileSelectorConfig
    file_selector = {
        provider = "telescope",
    },
    selector = {
        provider = selector_provider,
    },
    input = {
        provider = "snacks", -- "native" | "dressing" | "snacks"
        provider_opts = {
            -- Snacks input configuration
            title = "Avante Input",
            icon = " ",
            placeholder = "Enter your API key...",
        },
    },
    ---@type AvanteLLMToolPublic[] | fun(): AvanteLLMToolPublic[]
    custom_tools = function()
        return {
            require("mcphub.extensions.avante").mcp_tool(),
        }
    end,
}

return opts
