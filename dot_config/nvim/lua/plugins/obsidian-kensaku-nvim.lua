--- enabled check
--- 2. and if executable cmigemo command
---@return boolean
local enabled = function()
    local has_cmigemo = (1 == vim.fn.executable("cmigemo")) and true or false
    return has_cmigemo
end

---@type boolean
local use_denops = require("config.settings").use_denops

---@type LazySpec[]
local dependencies = {
    "fdschmidt93/telescope-egrepify.nvim",
}

if use_denops then
    table.insert(dependencies, "vim-denops/denops.vim")
    table.insert(dependencies, "yuki-yano/denops-lazy.nvim")
    table.insert(dependencies, "lambdalisue/kensaku.vim")
end

---@type table
local opts = {
    query_filter = use_denops and "kensaku" or "cmigemo",
    cmigemo_executable = use_denops and nil or "cmigemo",
    picker = "egrepify",
}

---@type LazySpec
local spec = {
    "delphinus/obsidian-kensaku.nvim",
    --lazy = false,
    ft = "markdown",
    cmd = "ObsidianKensaku",
    event = use_denops and "User DenopsReady" or "VeryLazy",
    dependencies = dependencies,
    config = function(spec)
        require("obsidian-kensaku").setup(opts)
        if use_denops then
            require("denops-lazy").load(spec.name)
        end
    end,
    cond = enabled,
    enabled = enabled,
}

return spec
