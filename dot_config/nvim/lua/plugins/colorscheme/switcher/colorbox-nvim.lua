---@type LazySpec
local spec = {
    "linrongbin16/colorbox.nvim",
    build = function()
        require("colorbox").update()
    end,
    -- NOTE: DO NOT LAZY LOADING
    lazy = false,
    cmd = "Colorbox",
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
        require("colorbox").setup()
    end,
    cond = false,
    priority = 1000,
}

return spec
