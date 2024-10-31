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

vim.keymap.set("n", "<leader>k", function()
    require("hover").hover()
end, {})

vim.keymap.set("n", "gK", function()
    require("hover").hover_select()
end, {})
