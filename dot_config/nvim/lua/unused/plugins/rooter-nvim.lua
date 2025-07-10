---@type table
local opts = {
    root_patterns = { ".git/" },
    outermost = true,
    enable_cache = true,
    project_non_root = "",
    --project_non_root = "home",
    --project_non_root = "current",
    enable_logger = true, -- enable runtime log via logger.nvim
}

---@type LazySpec
local spec = {
    "wsdjeg/rooter.nvim",
    --lazy = false,
    dependencies = { "wsdjeg/logger.nvim" },
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
