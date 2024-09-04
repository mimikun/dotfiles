-- TODO: check cmigemo executable
-- TODO: denops flag
local use_denops = require("config.settings").use_denops

---@type LazySpec[]
local dependencies = {
    "fdschmidt93/telescope-egrepify.nvim",
}

---@type table
local opts = {
    query_filter = use_denops and "kensaku" or "cmigemo",
    picker = "egrepify",
}

---@type table
local denops = {
    ---@type string
    event = "User DenopsReady",
    ---@type LazySpec[]
    dependencies = {
        "vim-denops/denops.vim",
        "yuki-yano/denops-lazy.nvim",
        "lambdalisue/vim-kensaku",
        "fdschmidt93/telescope-egrepify.nvim",
    },
}

---@type LazySpec
local spec = {
    "delphinus/obsidian-kensaku.nvim",
    --lazy = false,
    ft = "markdown",
    cmd = "ObsidianKensaku",
    --event = "VeryLazy",
    dependencies = dependencies,
    config = function(spec)
        require("obsidian-kensaku").setup(opts)
        require("denops-lazy").load(spec.name)
    end,
    cond = false,
    enabled = false,
}

return spec
