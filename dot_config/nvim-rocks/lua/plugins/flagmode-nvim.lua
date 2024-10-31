local flagmode = require("flagmode")

flagmode.register("relative_number", {
    activate = function()
        vim.opt.relativenumber = true
    end,
    deactivate = function()
        vim.opt.relativenumber = false
    end,
})
