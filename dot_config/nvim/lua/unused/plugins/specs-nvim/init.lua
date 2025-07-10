---@type table
local cmds = {
    "SpecsToggle",
    "SpecsShow",
}

---@type LazySpec
local spec = {
    "edluffy/specs.nvim",
    --lazy = false,
    cmd = cmds,
    config = function()
        local specs = require("specs")
        specs.setup(require("plugins.specs-nvim.opts"))

        vim.api.nvim_create_user_command("SpecsToggle", function()
            specs.toggle()
        end, { desc = "" })
        vim.api.nvim_create_user_command("SpecsShow", function()
            specs.show_specs()
        end, { desc = "" })
    end,
    cond = false,
    enabled = false,
}

return spec
