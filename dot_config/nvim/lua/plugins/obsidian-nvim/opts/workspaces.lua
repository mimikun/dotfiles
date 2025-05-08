---@type table
local mimikun = {
    name = "mimikun",
    path = vim.fn.expand("$obsidian_vault_path"),
}

---@type table
local no_vault = {
    name = "no-vault",
    path = function()
        -- alternatively use the CWD:
        -- return assert(vim.fn.getcwd())
        return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
    end,
    overrides = {
        notes_subdir = vim.NIL,
        daily_notes = {
            folder = vim.NIL,
        },
        new_notes_location = "current_dir",
        templates = {
            folder = vim.NIL,
        },
        disable_frontmatter = true,
        attachments = {
            img_folder = vim.NIL,
        },
    },
}

---@type table
local workspaces = {
    mimikun,
    no_vault,
}

return workspaces
