---@type table
local opts = {
    directory = "~/orgroamfiles",
    org_files = { "~/orgfiles" },
}

---@type LazySpec
local spec = {
    "chipsenkbeil/org-roam.nvim",
    --lazy = false,
    ft = "org",
    dependencies = { "nvim-orgmode/orgmode" },
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
