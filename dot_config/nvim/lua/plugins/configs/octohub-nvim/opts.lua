-- `private`, `fork`, `template`, `archived`
---@type string
local opt_repo_type = ""

-- `stars`, `forks`, `updated`, `created`, `pushed`, `name`, `size`, `watchers`, `issues`
---@type string
local opt_sort_repos_by = ""

---@type table
local opts = {
    -- Directory where repositories are cloned
    projects_dir = "~/Projects/",
    per_user_dir = true,
    sort_repos_by = opt_sort_repos_by,
    repo_type = opt_repo_type,
    add_default_keybindings = true,
}

return opts
