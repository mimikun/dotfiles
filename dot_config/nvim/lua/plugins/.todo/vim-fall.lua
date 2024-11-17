---@type LazySpec[]
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
}

---@type LazySpec
local spec = {
    "mimikun/spec-template",
    --dir = ""
    --url = ""
    --name = ""
    --dev = false
    --build = "",
    --branch = "",
    --tag = "",
    --commit = "",
    --version = "",
    --lazy = false,
    enabled = false,
    --ft = "",
    --cmd = "CMDNAME",
    --keys = "",
    event = "User DenopsReady",
    dependencies = dependencies,
    --init = function()
    --    INIT
    --end,
    --opts = {
    --    OPTS
    --},
    config = function(spec)
        require("denops-lazy").load(spec.name)
    end,
    cond = false,
    --main = ""
    --pin = false,
    --submodules = false,
    --module = false,
    --priority = 1000,
    --optional = false,
}

return spec
--[[
"https://github.com/vim-denops/denops.vim",
"https://github.com/vim-denops/denops-shared-server.vim",
"https://github.com/vim-skk/skkeleton",
"https://github.com/delphinus/skkeleton_indicator.nvim",
"https://github.com/Omochice/dps-translate-vim",
"https://github.com/lambdalisue/vim-kensaku",
"https://github.com/lambdalisue/vim-kensaku-command",
"https://github.com/lambdalisue/vim-kensaku-search",
"https://github.com/vim-fall/fall.vim",
]]
