---@type table
local workspaces = {
    {
        name = "mimikun",
        path = vim.fn.expand("$obsidian_vault_path"),
    },
    {
        name = "no-vault",
        path = function()
            -- alternatively use the CWD:
            -- return assert(vim.fn.getcwd())
            return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
        end,
        overrides = {
            notes_subdir = vim.NIL,
            new_notes_location = "current_dir",
            templates = {
                folder = vim.NIL,
            },
            disable_frontmatter = true,
        },
    },
}

return workspaces
