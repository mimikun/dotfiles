local keys = {
    {
        -- 👇 choose your own keymapping
        "<leader>-",
        function()
            require("yazi").yazi()
        end,
        { desc = "Open the file manager" },
    },
}

---@type table
local opts = {
    open_for_directories = false,
    floating_window_scaling_factor = 0.9,
    yazi_floating_window_winblend = 0,
    chosen_file_path = "/tmp/yazi_filechosen",
    events_file_path = "/tmp/yazi.nvim.events.txt",
    --'none', 'rounded', 'single', 'double', 'shadow'
    yazi_floating_window_border = "rounded",
}

---@type LazySpec
local spec = {
    "mikavilpas/yazi.nvim",
    --lazy = false,
    keys = keys,
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = opts,
    --cond = false,
}

return spec
