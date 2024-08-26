---@type table
local opts = {
    silent = true,
}

---@type LazySpec
local spec = {
    "uga-rosa/translate.nvim",
    --lazy = false,
    cmd = "TranslateJa",
    config = function()
        require("translate").setup(opts)

        vim.api.nvim_create_user_command("TranslateJa", function()
            vim.cmd([[Translate ja]])
        end, {})
    end,
    --cond = false,
}

return spec
