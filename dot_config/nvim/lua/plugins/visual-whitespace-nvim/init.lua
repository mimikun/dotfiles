---@type LazySpec
local spec = {
    "mcauley-penney/visual-whitespace.nvim",
    --lazy = false,
    cmd = "ToggleVisualWhitespace",
    keys = require("plugins.visual-whitespace-nvim.keys"),
    event = "ModeChanged *:[vV\22]",
    config = function()
        local vw = require("visual-whitespace")
        vw.setup(require("plugins.visual-whitespace-nvim.opts"))

        vim.api.nvim_create_user_command("ToggleVisualWhitespace", function()
            vw.toggle()
        end, {})
    end,
    --cond = false,
    --enabled = false,
}

return spec
