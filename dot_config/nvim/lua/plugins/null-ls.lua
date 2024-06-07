local global = require("core.global")
local is_windows = global.is_windows

---@type LazySpec
local spec = {
    "nvimtools/none-ls.nvim",
    lazy = false,
    --event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- TODO: settings
    config = function()
        local null_ls = require("null-ls")
        local code_actions = null_ls.builtins.code_actions
        local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting
        --local completion = null_ls.builtins.completion
        local hover = null_ls.builtins.hover

        ---@type table
        local sources = {
            -- Code Actions
            code_actions.gitsigns,
            -- Completion
            --completion.NAME
            -- Diagnostics
            diagnostics.actionlint,
            diagnostics.checkmake,
            diagnostics.fish,
            diagnostics.selene,
            diagnostics.zsh,
            -- Formatting
            formatting.fish_indent,
            formatting.just,
            formatting.shfmt,
            formatting.stylua,
            -- Hover
            hover.dictionary,
            hover.printenv,
            -- TODO: Fix checkhealth error
            --[[
            diagnostics.editorconfig_checker,
            diagnostics.markdownlint,
            diagnostics.textlint,
            diagnostics.yamllint,
            formatting.textlint,
            formatting.markdownlint,
            formatting.prettier,
            formatting.yamlfmt,
            ]]
        }
        if is_windows then
            for i, v in ipairs(sources) do
                if (v == "formatting.shfmt") or (v == "diagnostics.actionlint") or (v == "diagnostics.checkmake") then
                    table.remove(sources, i)
                end
            end
        end

        null_ls.setup({ sources = sources })
    end,
    --cond = false,
}

return spec
