---@type LazySpec
local spec = {
    "rbtnn/vim-ambiwidth",
    lazy = false,
    config = function()
        --vim.g.ambiwidth_cica_enabled = false,
        --vim.g.ambiwidth_add_list = {
        --    { 0xfe566, 0xfe568, 2 },
        --    { 0xff500, 0xffd46, 2 },
        --}
    end,
    --cond = false,
}

return spec
