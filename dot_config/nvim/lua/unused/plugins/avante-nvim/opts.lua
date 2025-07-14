---@type "claude" | "openai" | "copilot" | "ollama" | string
local avante_provider = "claude"

-- XXX: Can't set 'copilot'!
---@type "claude" | "openai" | "ollama" | string
local auto_suggestions_provider = "claude"

---@type avante.Config
local opts = {
    provider = avante_provider,
    auto_suggestions_provider = auto_suggestions_provider,
    system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub:get_active_servers_prompt()
    end,
    rag_service = {
        enabled = false, -- Enables the rag service, requires OPENAI_API_KEY to be set
        host_mount = os.getenv("HOME"), -- Host mount path for the rag service (docker will mount this path)
        runner = "docker", -- The runner for the rag service, (can use docker, or nix)
        provider = "openai", -- The provider to use for RAG service. eg: openai or ollama
        llm_model = "", -- The LLM model to use for RAG service
        embed_model = "", -- The embedding model to use for RAG service
        endpoint = "https://api.openai.com/v1", -- The API endpoint for RAG service
        docker_extra_args = "", -- Extra arguments to pass to the docker command
    },
    web_search_engine = {
        provider = "kagi",
        providers = {
            google = {
                api_key_name = "GOOGLE_SEARCH_API_KEY",
                engine_id_name = "GOOGLE_SEARCH_ENGINE_ID",
            },
            kagi = {
                api_key_name = "KAGI_API_KEY",
            },
            brave = {
                api_key_name = "BRAVE_API_KEY",
            },
        },
    },
    ---@type AvanteSupportedProvider
    ollama = {
        endpoint = "http://127.0.0.1:11434",
        timeout = 30000, -- ms
        options = {
            temperature = 0,
            num_ctx = 20480,
            keep_alive = "5m",
        },
    },
    ---@type {[string]: AvanteProvider}
    vendors = {
        ---@type AvanteSupportedProvider
        openrouter = {
            __inherited_from = "openai",
            endpoint = "https://openrouter.ai/api/v1",
            api_key_name = "OPENROUTER_API_KEY",
            model = "deepseek/deepseek-r1",
        },
    },
    behaviour = {
        -- Note that avante will safely set these keymap.
        -- See https://github.com/yetone/avante.nvim/wiki#keymaps-and-api-i-guess for more details.
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        -- Whether to support pasting image from clipboard.
        -- This will be determined automatically based whether img-clip is available or not.
        support_paste_from_clipboard = false,
        enable_cursor_planning_mode = false,
        enable_claude_text_editor_tool_mode = false,
    },
    history = {
        max_tokens = 4096,
        carried_entry_count = nil,
        storage_path = vim.fn.stdpath("state") .. "/avante",
    },
    img_paste = {
        url_encode_path = true,
        template = "\nimage: $FILE_PATH\n",
    },
    mappings = {
        ---@class AvanteConflictMappings
        submit = {
            normal = "<CR>",
            insert = "<C-s>",
        },
        cancel = {
            normal = { "<C-c>", "<Esc>", "q" },
            insert = { "<C-c>" },
        },
    },
    windows = {
        ---@alias AvantePosition "right" | "left" | "top" | "bottom" | "smart"
        position = "right",
        fillchars = "eob: ",
        wrap = true, -- similar to vim.o.wrap
        width = 30, -- default % based on available width in vertical layout
        height = 30, -- default % based on available height in horizontal layout
        sidebar_header = {
            enabled = true, -- true, false to enable/disable the header
            align = "center", -- left, center, right for title
            rounded = true,
        },
        input = {
            prefix = "> ",
            height = 8, -- Height of the input window in vertical layout
        },
        edit = {
            border = { " ", " ", " ", " ", " ", " ", " ", " " },
            start_insert = true, -- Start insert mode when opening the edit window
        },
        ask = {
            floating = false, -- Open the 'AvanteAsk' prompt in a floating window
            border = { " ", " ", " ", " ", " ", " ", " ", " " },
            start_insert = true, -- Start insert mode when opening the ask window
            ---@alias AvanteInitialDiff "ours" | "theirs"
            focus_on_apply = "ours", -- which diff to focus after applying
        },
    },
    --- @class AvanteConflictConfig
    diff = {
        autojump = true,
        --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
        --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
        --- Disable by setting to -1.
        override_timeoutlen = 500,
    },
    --- @class AvanteRepoMapConfig
    repo_map = {
        ignore_patterns = { "%.git", "%.worktree", "__pycache__", "node_modules" }, -- ignore files matching these
        negate_patterns = {}, -- negate ignore files matching these.
    },
    --- @class AvanteFileSelectorConfig
    file_selector = {
        provider = "telescope",
    },
    selector = {
        ---@alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
        provider = "native",
        provider_opts = {},
    },
    suggestion = {
        debounce = 600,
        throttle = 600,
    },
    ---@type string[]
    disabled_tools = {
        "list_files",
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
        "bash",
    },
    ---@type AvanteLLMToolPublic[] | fun(): AvanteLLMToolPublic[]
    custom_tools = function()
        return {
            require("mcphub.extensions.avante").mcp_tool(),
        }
    end,
    ---@type AvanteSlashCommand[]
    slash_commands = {},
}

return opts
