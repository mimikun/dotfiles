---@type LazySpec
local spec = {
    "ixru/nvim-markdown",
    --lazy = false,
    ft = "markdown",
    config = function()
        -- 折りたたみ無効化
        vim.g.vim_markdown_folding_disabled = 1
        -- YAMLフロントマターの強調表示
        vim.g.vim_markdown_frontmatter = 1
    end,
    --cond = false,
}

return spec
