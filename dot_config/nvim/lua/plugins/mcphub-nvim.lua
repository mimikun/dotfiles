---@type table
local opts = {
    port = 3000,
    -- Absolute path to config file
    config = vim.fn.expand("~/mcpservers.json"),
    shutdown_delay = 0,
    log = {
        level = vim.log.levels.WARN,
        to_file = false,
        file_path = nil,
        prefix = "MCPHub",
    },
}

---@type LazySpec
local spec = {
    "ravitemer/mcphub.nvim",
    --lazy = false,
    build = "npm install -g mcp-hub@latest",
    cmd = "MCPHub",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
