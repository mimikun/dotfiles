---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>ho",
        "<cmd>DevDocs get<cr>",
        mode = "n",
        desc = "Get Devdocs",
    },
    {
        "<leader>hi",
        "<cmd>DevDocs install<cr>",
        mode = "n",
        desc = "Install Devdocs",
    },
    {
        "<leader>hv",
        function()
            local devdocs = require("devdocs")
            local installedDocs = devdocs.GetInstalledDocs()
            vim.ui.select(installedDocs, {}, function(selected)
                if not selected then
                    return
                end
                local docDir = devdocs.GetDocDir(selected)
                require("snacks").picker.files({ cwd = docDir })
            end)
        end,
        mode = "n",
        desc = "View Devdocs",
    },
}

return keys
