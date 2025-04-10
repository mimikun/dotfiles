---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local git = {
    module = "blink-cmp-git",
    name = "Git",
    -- only enable this source when filetype is gitcommit, markdown, or 'octo'
    enabled = function()
        return vim.tbl_contains({ "octo", "gitcommit", "markdown" }, vim.bo.filetype)
    end,
    opts = {},
}

return git
