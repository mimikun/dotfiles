local M = {}

M.create = function()
    -- User Commands
    -- Enable eskk
    vim.api.nvim_create_user_command("EskkEnable", function()
        vim.fn["eskk#enable"]()
    end, {})
    -- Disable eskk
    vim.api.nvim_create_user_command("EskkDisable", function()
        vim.fn["eskk#disable"]()
    end, {})
    -- Toggle eskk
    vim.api.nvim_create_user_command("EskkToggle", function()
        vim.fn["eskk#toggle"]()
    end, {})
end

return M
