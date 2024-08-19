---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>k",
        function()
            require("hover").hover()
        end,
        mode = "n",
        desc = "hover.nvim",
    },
    {
        "gK",
        function()
            require("hover").hover_select()
        end,
        mode = "n",
        desc = "hover.nvim (select)",
    },
}

---@type LazySpec
local spec = {
    "lewis6991/hover.nvim",
    --lazy = false,
    keys = keys,
    event = "VeryLazy",
    config = function()
        require("hover").setup({
            init = function()
                require("hover.providers.lsp")
                require("hover.providers.gh")
                require("hover.providers.diagnostic")
                require("hover.providers.gh_user")
                -- require('hover.providers.jira')
                require("hover.providers.dap")
                require("hover.providers.fold_preview")
                require("hover.providers.man")
                require("hover.providers.dictionary")
            end,
        })
    end,
    --cond = false,
}

return spec
