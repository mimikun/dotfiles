local global = require("config.global")

---@type LazySpec[]
local dependencies = {
    "windwp/nvim-ts-autotag",
    "LhKipp/nvim-nu",
    "RRethy/nvim-treesitter-textsubjects",
}

---@type LazySpec
local spec = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    --lazy = false,
    event = "VeryLazy",
    dependencies = dependencies,
    init = function()
        vim.opt.runtimepath:prepend(global.parser_install_dir)
    end,
    config = function()
        require("nu").setup({})
        require("nvim-ts-autotag").setup({})

        require("nvim-treesitter.configs").setup({
            parser_install_dir = global.parser_install_dir,
            highlight = {
                enable = true,
                disable = {},
            },
            ensure_installed = require("plugins.configs.nvim-treesitter.ensure_installed"),
            -- NOTE:
            -- If your human rights are being violated,
            -- you will need to repeatedly press the Enter-key during initial setup.
            sync_install = not global.is_human_rights,
            textsubjects = {
                enable = true,
                -- (Optional) keymap to select the previous selection
                prev_selection = ",",
                keymaps = {
                    ["."] = "textsubjects-smart",
                    [";"] = "textsubjects-container-outer",
                    ["i;"] = {
                        "textsubjects-container-inner",
                        desc = "Select inside containers (classes, functions, etc.)",
                    },
                },
            },
        })
    end,
    --cond = false,
}

return spec
