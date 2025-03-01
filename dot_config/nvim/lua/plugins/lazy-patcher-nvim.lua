-- TODO: config it

---@type table
local opts = {
    -- Directory where lazy install the plugins
    lazy_path = vim.fn.stdpath("data") .. "/lazy",
    -- Directory where patch files are stored
    patches_path = vim.fn.stdpath("config") .. "/patches",
    update_patches = true,
    apply_patches = true,
    confirm_mass_changes = true,
    print_logs = true,
}

---@type LazySpec
local spec = {
    "one-d-wide/lazy-patcher.nvim",
    --lazy = false,
    ft = "lazy",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
