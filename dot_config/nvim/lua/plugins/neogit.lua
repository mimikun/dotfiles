---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
}

---@type table
local opts = {
    graph_style = "unicode",
    telescope_sorter = function()
        -- NOTE: Add fzf_sorter if not a Windows
        -- Very difficult to build fzf on Windows
        return require("config.global").is_windows and nil or require("telescope").extensions.fzf.native_fzf_sorter()
    end,
    signs = {
        -- { CLOSED, OPENED }
        hunk = { "", "" },
        item = { ">", "v" },
        section = { ">", "v" },
    },
    integrations = {
        telescope = true,
        diffview = true,
    },
}

---@type LazySpec
local spec = {
    "NeogitOrg/neogit",
    --lazy = false,
    cmd = "Neogit",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
