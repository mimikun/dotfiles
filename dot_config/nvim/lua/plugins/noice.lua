---@type table
local dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "hrsh7th/nvim-cmp",
}

---@type table
local opts = {
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            -- requires hrsh7th/nvim-cmp
            ["cmp.entry.get_documentation"] = true,
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        -- use a classic bottom cmdline for search
        bottom_search = true,
        -- position the cmdline and popupmenu together
        command_palette = true,
        -- long messages will be sent to a split
        long_message_to_split = true,
        -- enables an input dialog for inc-rename.nvim
        inc_rename = false,
        -- add a border to hover docs and signature help
        lsp_doc_border = false,
    },
}

---@type LazySpec
local spec = {
    "folke/noice.nvim",
    --lazy = false,
    event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        require("noice").setup(opts)
        require("notify").setup({
            background_colour = "#000000",
        })
    end,
    --cond = false,
}

return spec
