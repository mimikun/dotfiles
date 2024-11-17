---@type LazyKeysSpec[]
local keys = {
    {
        "<CR>",
        "<Plug>(kensaku-search-replace)<CR>",
        mode = "c",
        desc = "Romaji de kensaku",
    },
}

---@type LazySpec[]
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
    "lambdalisue/vim-kensaku-command",
    "lambdalisue/vim-kensaku-search",
}

---@type LazySpec
local spec = {
    "lambdalisue/vim-kensaku",
    --lazy = false,
    cmd = "Kensaku",
    keys = keys,
    event = "User DenopsReady",
    dependencies = dependencies,
    config = function(spec)
        require("denops-lazy").load(spec.name)
        --vim.keymap.set("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>")
    end,
    --cond = false,
    --enabled = false,
}

return spec
