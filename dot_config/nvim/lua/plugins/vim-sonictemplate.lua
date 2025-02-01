---@type LazySpec
local spec = {
    "mattn/vim-sonictemplate",
    --lazy = false,
    cmd = "Template",
    config = function()
        vim.g.sonictemplate_vim_template_dir = {
            -- NOTE: write path to template file
            --"$HOME/.vim/template",
            --"/path/to/another/template/directory",
        }
    end,
    cond = false,
    enabled = false,
}

return spec
