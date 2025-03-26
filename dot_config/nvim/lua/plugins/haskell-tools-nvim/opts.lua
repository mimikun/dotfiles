---@type haskell-tools.Opts
local opts = {
    ---@type haskell-tools.tools.Opts
    tools = require("plugins.haskell-tools-nvim.tools"),
    ---@type haskell-tools.lsp.ClientOpts
    hls = require("plugins.haskell-tools-nvim.hls"),
    ---@type haskell-tools.dap.Opts
    dap = require("plugins.haskell-tools-nvim.dap"),
}

return opts
