-- TODO: config
---@type LazySpec
local spec = {
    "Tronikelis/xylene.nvim",
    --lazy = false,
    cmd = "Xylene",
    --keys = "",
    --event = "VeryLazy",
    --dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("xylene").setup({
            icons = {
                files = true,
                dir_open = "  ",
                dir_close = "  ",
            },
            keymaps = {
                enter = "<cr>",
            },
            indent = 4,
            sort_names = function(a, b)
                return a.name < b.name
            end,
            skip = function(name, filetype)
                return name == ".git"
            end,
            on_attach = function(renderer)
                vim.keymap.set("n", "<c-cr>", function()
                    local row = table.unpack(vim.api.nvim_win_get_cursor(0))

                    local file = renderer:find_file(row)
                    if not file then
                        return
                    end

                    require("oil").open(file.path)
                end, { buffer = renderer.buf })
            end,
        })
    end,
    cond = false,
    enabled = false,
}

return spec
