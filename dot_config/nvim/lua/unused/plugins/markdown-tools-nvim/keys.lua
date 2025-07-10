---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>mnt",
        "<cmd>MarkdownNewTemplate<CR>",
        mode = "n",
        desc = "Create from template",
    },
    {
        "<leader>mH",
        "<cmd>MarkdownHeader<CR>",
        mode = { "n", "v" },
        desc = "Header",
    },
    {
        "<leader>mc",
        function()
            require("markdown-tools.commands").insert_code_block({ range = 0 })
        end,
        mode = "n",
        desc = "Code block (Normal)",
    },
    {
        "<leader>mc",
        function()
            -- Still need Lua for prompt, exit visual first
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
            require("markdown-tools.commands").insert_code_block({ range = 2 })
        end,
        mode = "v",
        desc = "Code block (Visual)",
    },
    {
        "<leader>mb",
        function()
            require("markdown-tools.commands").insert_bold({ range = 0 }) -- Explicitly pass range 0
        end,
        mode = "n",
        desc = "Bold text (Normal)",
    },
    {
        "<leader>mb",
        function()
            --vim.cmd('s**<C-r>"**<Esc>')
        end,
        mode = "v",
        desc = "Bold text (Visual)",
        opts = { remap = true },
    },
    {
        "<leader>mh",
        function()
            require("markdown-tools.commands").insert_highlight({ range = 0 })
        end,
        mode = "n",
        desc = "Highlight text (Normal)",
    },
    {
        "<leader>mh",
        function()
            --vim.cmd('s==<C-r>"==<Esc>')
        end,
        mode = "v",
        desc = "Highlight text (Visual)",
        opts = { remap = true },
    },
    {
        "<leader>mi",
        function()
            -- Call command function (prompts for input in normal mode)
            require("markdown-tools.commands").insert_italic({ range = 0 }) -- Explicitly pass range 0
        end,
        mode = "n",
        desc = "Italic text (Normal)",
    },
    {
        "<leader>mi",
        --vim.cmd('s*<C-r>"*<Esc>'),
        mode = "v",
        desc = "Italic text (Visual)",
        opts = { remap = true },
    },
    {
        "<leader>ml",
        function()
            require("markdown-tools.commands").insert_link({ range = 0 })
        end,
        mode = "n",
        desc = "Link (Normal)",
    },
    {
        "<leader>ml",
        -- Use Vim command sequence + Lua helper for prompt
        -- 1. Substitute selection: `s[<C-r>"]()`
        -- 2. Exit substitute mode: `<Esc>`
        -- 3. Move cursor left: `<Cmd>normal! h<CR>`
        -- 4. Enter insert mode (before cursor): `<Cmd>startinsert<CR>`
        -- 5. Call Lua helper to prompt and insert URL
        --[[
        vim.cmd(
            's[<C-r>"]()<Esc><Cmd>normal! h<CR><Cmd>startinsert<CR><Cmd>lua require("markdown-tools.commands").prompt_and_insert_url()<CR>'
        ),
        ]]
        mode = "v",
        desc = "Link (Visual)",
    },
    {
        "<leader>mt",
        "<cmd>MarkdownInsertTable<CR>",
        mode = "n",
        desc = "Insert table",
    },
    {
        "<leader>mk",
        function()
            require("markdown-tools.commands").insert_checkbox()
        end,
        mode = "n",
        desc = "Checkbox (Normal)",
    },
    {
        "<leader>mk",
        function()
            -- Exit visual mode before calling the command
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
            require("markdown-tools.commands").insert_checkbox()
        end,
        mode = "v",
        desc = "Checkbox",
        opts = nil,
    },
    {
        "<leader>mx",
        "<cmd>MarkdownToggleCheckbox<CR>",
        mode = "n",
        desc = "Toggle checkbox",
    },
    {
        "<leader>mp",
        "<cmd>MarkdownPreview<CR>",
        mode = "n",
        desc = "Preview markdown",
    },
}

return keys
