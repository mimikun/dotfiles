---@type table
local cmds = {
    "RustAnalyzer",
    "Rustc",
    "RustLsp",
}

---@type LazySpec
local spec = {
    "mrcjkb/rustaceanvim",
    version = "^4",
    -- NOTE: rustaceanvim is already lazy
    lazy = false,
    cmd = cmds,
    dependencies = { "williamboman/mason.nvim" },
    init = function()
        ---@type RustaceanOpts
        vim.g.rustaceanvim = {
            ---@type RustaceanToolsOpts
            tools = {},
            ---@type RustaceanLspClientOpts
            server = {
                cmd = function()
                    local mason_registry = require("mason-registry")
                    ---@type string
                    local ra_bin_name = "rust-analyzer-x86_64-unknown-linux-gnu"
                    ---@type boolean
                    local is_ra_installed = mason_registry.is_installed("rust-analyzer")
                    ---@type string
                    local installed_path = mason_registry.get_package("rust-analyzer"):get_install_path()
                    ---@type string
                    local ra_executable_bin = installed_path .. "/" .. ra_bin_name
                    ---@type string
                    local ra_bin_path = is_ra_installed and ra_executable_bin or ra_bin_name
                    return ra_bin_path
                end,
            },
            ---@type RustaceanDapOpts
            dap = {},
        }
    end,
    cond = false,
}

return spec
