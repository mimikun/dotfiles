---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>X",
        function()
            vim.api.nvim_command("write")
            local bufname = vim.api.nvim_buf_get_name(0)
            require("docxedit").reload_docx(bufname)
            require("docxedit").watch_edit(bufname)
        end,
        mode = { "n", "i" },
        { desc = "Reload MS Word" },
    },
}

return keys
