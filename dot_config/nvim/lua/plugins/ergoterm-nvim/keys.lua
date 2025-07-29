---@type LazyKeysSpec[]
local keys = {
    -- Terminal creation with different layouts
    {
        "<leader>cs",
        ":TermNew layout=below<CR>",
        mode = "n",
        desc = "Split below",
        { noremap = true, silent = true },
    },
    {
        "<leader>cv",
        ":TermNew layout=right<CR>",
        mode = "n",
        desc = "Vertical split",
        { noremap = true, silent = true },
    },
    {
        "<leader>cf",
        ":TermNew layout=float<CR>",
        mode = "n",
        desc = "Floating window",
        { noremap = true, silent = true },
    },
    {
        "<leader>ct",
        ":TermNew layout=tab<CR>",
        mode = "n",
        desc = "New tab",
        { noremap = true, silent = true },
    },

    -- Open terminal picker
    {
        "<leader>cl",
        ":TermSelect<CR>",
        mode = "n",
        desc = "List and select terminals",
        { noremap = true, silent = true },
    },

    -- Send text to last focused terminal
    {
        "<leader>cs",
        ":TermSend! new_line=false<CR>",
        mode = "n",
        desc = "Send line without newline",
        { noremap = true, silent = true },
    },
    {
        "<leader>cs",
        ":TermSend! new_line=false<CR>",
        mode = "x",
        desc = "Send selection without newline",
        { noremap = true, silent = true },
    },

    -- Send and show output without focusing terminal
    {
        "<leader>cx",
        ":TermSend! action=visible<CR>",
        mode = "n",
        desc = "Execute in terminal, keep focus",
        { noremap = true, silent = true },
    },
    {
        "<leader>cx",
        ":TermSend! action=visible<CR>",
        mode = "x",
        desc = "Execute selection in terminal, keep focus",
        { noremap = true, silent = true },
    },

    -- Send as markdown code block
    {
        "<leader>cS",
        ":TermSend! action=visible trim=false decorator=markdown_code<CR>",
        mode = "n",
        desc = "Send as markdown code block",
        { noremap = true, silent = true },
    },
    {
        "<leader>cS",
        ":TermSend! action=visible trim=false decorator=markdown_code<CR>",
        mode = "x",
        desc = "Send as markdown code block",
        { noremap = true, silent = true },
    },
}

return keys
