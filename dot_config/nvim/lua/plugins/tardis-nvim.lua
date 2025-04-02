---@type table
local opts = {
    keymap = {
        ["next"] = "<C-j>",
        ["prev"] = "<C-k>",
        ["quit"] = "q",
        ["revision_message"] = "<C-m>",
        ["commit"] = "<C-g>",
    },
    initial_revisions = 10,
    max_revisions = 256,
}

---@type LazySpec
local spec = {
    "fredeeb/tardis.nvim",
    --lazy = false,
    cmd = "Tardis",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
