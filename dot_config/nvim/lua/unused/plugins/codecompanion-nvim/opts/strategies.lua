---@type string
local my_adapter = "anthropic"

---@type string
local my_provider = "snacks"

---@type table
local inline = {
    adapter = my_adapter,
    keymaps = {
        accept_change = {
            modes = { n = "ga" },
            description = "Accept the suggested change",
        },
        reject_change = {
            modes = { n = "gr" },
            description = "Reject the suggested change",
        },
    },
}

---@type table
local cmd = {
    adapter = my_adapter,
}

---@type table
local chat = {
    adapter = my_adapter,
    keymaps = {
        send = {
            modes = { n = "<CR><CR>" },
        },
    },
    slash_commands = {
        ["buffer"] = {
            opts = {
                provider = my_provider,
            },
        },
        ["file"] = {
            opts = {
                provider = my_provider,
            },
        },
        ["help"] = {
            opts = {
                provider = my_provider,
            },
        },
        ["symbols"] = {
            opts = {
                provider = my_provider,
            },
        },
        ["workspace"] = {
            opts = {
                provider = my_provider,
            },
        },
    },
    --tools = {},
    roles = {
        ---The header name for the LLM's messages
        ---@type string|fun(adapter: CodeCompanion.Adapter): string
        llm = function(adapter)
            return "CodeCompanion (" .. adapter.formatted_name .. ")"
        end,

        ---The header name for your messages
        ---@type string
        user = "Me",
    },
}

---@type table
local strategies = {
    chat = chat,
    inline = inline,
    cmd = cmd,
}

return strategies
