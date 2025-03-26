---@class haskell-tools.dap.Config
local dap = {
    cmd = { "haskell-debug-adapter" },
    logFile = vim.fn.stdpath("data") .. "/haskell-dap.log",
    logLevel = "Warning",
    auto_discover = true,
}

return dap
