local settings = require("core.settings")
local use_ai_assistant = settings.use_ai_assistant

---@type table
local ollama_nvim_cmds = {
    "Ollama",
    "OllamaModel",
    "OllamaServe",
    "OllamaServeStop",
}

---@type table[]
local ollama_nvim_keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
        "<leader>oo",
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = "ollama prompt",
        mode = { "n", "v" },
    },

    -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
    {
        "<leader>oG",
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = "ollama Generate Code",
        mode = { "n", "v" },
    },
}
local ollama_nvim_opts = {
    model = "mistral",
    url = "http://127.0.0.1:11434",
    serve = {
        on_start = false,
        command = "ollama",
        args = { "serve" },
        stop_command = "pkill",
        stop_args = { "-SIGTERM", "ollama" },
    },
    -- View the actual default prompts in ./lua/ollama/prompts.lua
    prompts = {
        Sample_Prompt = {
            prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
            input_label = "> ",
            model = "mistral",
            action = "display",
        },
    },
}

---@type LazySpec
local ollama_nvim = {
    "nomnivore/ollama.nvim",
    --lazy = false,
    cmd = ollama_nvim_cmds,
    keys = ollama_nvim_keys,
    --event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = ollama_nvim_opts,
    --config = true,
    cond = use_ai_assistant,
}

---@type table
local nvim_llama_opts = {
    debug = false,
    model = "llama2",
}

---@type LazySpec
local nvim_llama = {
    "jpmcb/nvim-llama",
    --lazy = false,
    enabled = false,
    cmd = "Llama",
    --event = "VeryLazy",
    opts = nvim_llama_opts,
    --config = true,
    cond = use_ai_assistant,
}

---@type LazySpec[]
local specs = {
    ollama_nvim,
    nvim_llama,
}

return specs
