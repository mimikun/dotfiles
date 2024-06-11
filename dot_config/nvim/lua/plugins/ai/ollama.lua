---@type boolean
local cond = require("core.settings").use_ai_assistant

---@type table
local cmds = {
    "Ollama",
    "OllamaModel",
    "OllamaServe",
    "OllamaServeStop",
}

---@type table[]
local keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    { "<leader>oo", desc = "ollama prompt" },
    -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
    { "<leader>oG", desc = "ollama Generate Code" },
}

---@type table
local opts = {
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
local spec = {
    "nomnivore/ollama.nvim",
    --lazy = false,
    cmd = cmds,
    keys = keys,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local ollama = require("ollama")
        local key_modes = { "n", "v" }
        local key_opts = {}

        ollama.setup(opts)

        -- "<leader>oo"
        -- ":<c-u>lua require('ollama').prompt()<cr>"
        vim.keymap.set(key_modes, "<leader>oo", ollama.prompt(), key_opts)

        -- "<leader>oG"
        -- ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>"
        vim.keymap.set(key_modes, "<leader>oG", ollama.prompt("Generate_Code"), key_opts)
    end,
    cond = cond,
}

return spec
