---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>sa",
        ":ShadcnAdd<CR>",
        mode = "n",
        desc = "Add shadcn component",
        { noremap = true, silent = true },
    },
}

return keys
