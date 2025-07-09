---@type LazyKeysSpec[]
local keys = {
    -- Add visual selection to Quickfix List
    {
        "<leader>q",
        function()
            local item = require("ctx.items").selection()
            require("ctx.utils").highlight(item)
            vim.fn.setqflist({ item }, "a")
        end,
        desc = "Add to Quickfix List",
        mode = { "v" },
    },
    -- Add visual selection to Location List
    {
        "<leader>l",
        function()
            local win = vim.api.nvim_get_current_win()
            local item = require("ctx.items").selection()
            require("ctx.utils").highlight(item)
            vim.fn.setloclist(win, { item }, "a")
        end,
        desc = "Add to Location List",
        mode = { "v" },
    },
    -- Yank Quickfix List to clipboard
    {
        "yq",
        function()
            local md = require("ctx").qflist_to_md()
            vim.fn.setreg("+", md)
            vim.notify("Yanked qflist")
        end,
        desc = "Yank Quickfix List",
        mode = { "n" },
    },
    -- Yank Location List to clipboard
    {
        "yl",
        function()
            local nr = vim.api.nvim_get_current_win()
            local md = require("ctx").loclist_to_md(nr)
            vim.fn.setreg("+", md)
            vim.notify("Yanked loclist")
        end,
        desc = "Yank Location List",
        mode = { "n" },
    },
    -- Quickfix List navigation
    {
        "[q",
        vim.cmd.cprev,
        desc = "Previous Quickfix item",
        mode = { "n" },
    },
    {
        "]q",
        vim.cmd.cnext,
        desc = "Next Quickfix item",
        mode = { "n" },
    },
    {
        "[Q",
        vim.cmd.colder,
        desc = "Older Quickfix list",
        mode = { "n" },
    },
    {
        "]Q",
        vim.cmd.cnewer,
        desc = "Newer Quickfix list",
        mode = { "n" },
    },
    -- Location List navigation
    {
        "[l",
        vim.cmd.lprev,
        desc = "Previous Location item",
        mode = { "n" },
    },
    {
        "]l",
        vim.cmd.lnext,
        desc = "Next Location item",
        mode = { "n" },
    },
    {
        "[L",
        vim.cmd.lolder,
        desc = "Older Location list",
        mode = { "n" },
    },
    {
        "]L",
        vim.cmd.lnewer,
        desc = "Newer Location list",
        mode = { "n" },
    },
    -- TODO: it
    --[[
    -- Send code context to LLM
    {
        "<leader>ai",
        function()
            -- Get context from quickfix list
            local context = require("ctx").qflist_to_md()

            -- Combine with user prompt
            local prompt = "Here's my code:\n\n"
                .. context
                .. "\n\nPlease explain what it does and suggest improvements."

            -- Send to LLM (implementation depends on your LLM plugin)
            require("your_llm_plugin").send_prompt(prompt)
        end,
        desc = "Send Context to LLM",
        mode = { "n" },
    },
    ]]
}

return keys
