---@type string
local provider = require("config.global").is_work and "ollama" or "copilot"

---@type table
local opts = {
    provider = provider,
    auto_suggestions_provider = provider,
    vendors = {
        ollama = {
            ["local"] = true,
            endpoint = "127.0.0.1:11434/v1",
            model = "codegemma",
            parse_curl_args = function(opts, code_opts)
                return {
                    url = opts.endpoint .. "/chat/completions",
                    headers = {
                        ["Accept"] = "application/json",
                        ["Content-Type"] = "application/json",
                    },
                    body = {
                        model = opts.model,
                        messages = require("avante.providers").copilot.parse_messages(code_opts),
                        max_tokens = 2048,
                        stream = true,
                    },
                }
            end,
            parse_response = function(data_stream, event_state, opts)
                require("avante.providers").copilot.parse_response(data_stream, event_state, opts)
            end,
        },
    },
    behaviour = {
        -- Experimental stage
        auto_suggestions = false,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
    },
}

return opts
