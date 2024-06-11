---@type table
local cmds = {
    "FiveServer",
}

---@type table
local opts = {
    debug = {
        enabled = false,
        file_name = "fs-debug.log",
    },
    bin = vim.fn.stdpath("data") .. "/five-server/node_modules/.bin/five-server",
    notify = true,
    fiveserverrc = {
        gen_rc = {
            before_start = false,
            force = false,
            path = ".fiveserverrc",
        },
        config = {
            port = 5500,
            logLevel = 3,
        },
    },
}

---@type LazySpec
local spec = {
    "Diogo-ss/five-server.nvim",
    build = function()
        require("fs.utils.install")()
    end,
    --lazy = false,
    cmd = cmds,
    opts = opts,
    --cond = false,
}

return spec
