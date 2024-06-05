---@type LazySpec
local spec = {
    "alker0/chezmoi.vim",
    -- this plugin DO NOT lazy loading
    -- see: https://github.com/alker0/chezmoi.vim#install
    lazy = false,
    init = function()
        -- see: https://github.com/alker0/chezmoi.vim/issues/57
        vim.g["chezmoi#use_tmp_buffer"] = true
    end,
    --cond = false,
}

return spec
