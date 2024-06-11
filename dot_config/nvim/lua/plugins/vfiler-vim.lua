---@type table
local dependencies = {
    "obaland/vfiler-column-devicons",
}

---@type LazySpec
local spec = {
    "obaland/vfiler.vim",
    --lazy = false,
    cmd = "VFiler",
    dependencies = dependencies,
    config = function()
        require("vfiler/config").setup({
            options = {
                auto_cd = true,
                auto_resize = true,
                keep = true,
                layout = "left",
                name = "explorer",
                width = 30,
                columns = "indent,devicons,name",
            },
        })
    end,
    --cond = false,
}

return spec
