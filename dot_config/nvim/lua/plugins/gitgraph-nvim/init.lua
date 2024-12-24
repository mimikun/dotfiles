---@type LazySpec
local spec = {
    "isakbm/gitgraph.nvim",
    --lazy = false,
    cmd = "GitGraphDraw",
    keys = require("plugins.gitgraph-nvim.keys"),
    dependencies = { "sindrets/diffview.nvim" },
    config = function()
        local gitgraph = require("gitgraph")
        gitgraph.setup(require("plugins.gitgraph-nvim.opts"))

        vim.api.nvim_create_user_command("GitGraphDraw", function()
            gitgraph.draw({}, { all = true, max_count = 5000 })
        end, {})
    end,
    --cond = false,
    --enabled = false,
}

return spec
