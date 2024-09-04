---@type rest.Opts
local opts = {
    request = {
        ---@type boolean Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
    },
    ---@class rest.Config.Cookies
    cookies = {
        ---@type string Cookies file path
        path = vim.fs.joinpath(vim.fn.stdpath("data"), "rest-nvim.cookies"),
    },
}

---@type LazySpec
local spec = {
    "rest-nvim/rest.nvim",
    --lazy = false,
    ft = "http",
    cmd = "Rest",
    init = function()
        ---@type rest.Opts
        vim.g.rest_nvim = opts
    end,
    cond = false,
    enabled = false,
}

return spec
