return {
    -- TODO: setting
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    --event = "VimEnter",
    cmd = "Neotree",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function() end,
    cond = false,
}
