---@type table
local opts = {
    always_include_current_line = false,
    -- "always" | "ask_first" | "never"
    switch_branch_or_commit_upon_ingestion = "always",
}

---@type LazySpec
local spec = {
    "trevorhauter/gitportal.nvim",
    --lazy = false,
    cmd = "GitPortal",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
