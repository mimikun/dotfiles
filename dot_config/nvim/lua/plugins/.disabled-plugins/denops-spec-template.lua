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
