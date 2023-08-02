--[[
[nvim-nu](https://github.com/LhKipp/nvim-nu)
]]
return {
    "LhKipp/nvim-nu",
    event = "VeryLazy",
    build = ":TSInstall nu",
    ft = {
        "nu",
    },
    config = function()
        require("nu").setup({})
    end,
    cond = false,
}
