---@type LazySpec[]
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
}

---@type LazySpec
local spec = {
    "Omochice/dps-translate-vim",
    --lazy = false,
    cmd = "Translate",
    event = "User DenopsReady",
    dependencies = dependencies,
    init = function()
        vim.g.dps_translate_source = "en"
        vim.g.dps_translate_target = "ja"
    end,
    config = function(spec)
        require("denops-lazy").load(spec.name)
    end,
    --cond = false,
    --enabled = false,
}

return spec
