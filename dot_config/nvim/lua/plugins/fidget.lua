---@type table
local opts = {
    progress = {
        -- Suppress new messages while in insert mode
        suppress_on_insert = false,
        -- Ignore new tasks that are already complete
        ignore_done_already = false,
        -- Ignore new tasks that don't contain a message
        ignore_empty_message = false,
        -- List of LSP servers to ignore
        ignore = {},

        display = {
            -- Icon shown when all LSP progress tasks are complete
            done_icon = "✔",
            -- Icon shown when LSP progress tasks are in progress
            progress_icon = { pattern = "dots", period = 1 },
            -- Override options from the default notification config
            overrides = {
                rust_analyzer = { name = "rust-analyzer" },
            },
        },
    },

    integration = {
        ["nvim-tree"] = {
            -- Integrate with nvim-tree/nvim-tree.lua (if installed)
            enable = true,
        },
    },
}

---@type LazySpec
local spec = {
    "j-hui/fidget.nvim",
    lazy = false,
    cmd = "Fidget",
    --event = "VeryLazy",
    opts = opts,
    --cond = false,
}

return spec
