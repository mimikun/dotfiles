---@type LazySpec
return {
    "nvim-orgmode/orgmode",
    lazy = false,
    --event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        -- TODO: setting
        local orgmode = require("orgmode")
        orgmode.setup({
            org_agenda_files = "~/orgfiles/**/*",
            org_default_notes_file = "~/orgfiles/refile.org",
        })
    end,
    --cond = false,
}
