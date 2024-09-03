---@type boolean
local human_rights_violation = not require("config.global").is_human_rights

---@type table
local cmds = {
    "DenopsSharedServerInstall",
    "DenopsSharedServerUninstall",
    "DenopsSharedServerRestart",
}

---@type LazySpec
local spec = {
    "vim-denops/denops-shared-server.vim",
    --lazy = false,
    cmd = cmds,
    event = "VeryLazy",
    dependencies = { "vim-denops/denops.vim" },
    init = function()
        if human_rights_violation then
            vim.g.denops_server_addr = "127.0.0.1:32123"
        end
    end,
    config = function()
        vim.api.nvim_create_user_command("DenopsSharedServerInstall", function()
            vim.fn["denops_shared_server#install"]()
        end, {})
        vim.api.nvim_create_user_command("DenopsSharedServerUninstall", function()
            vim.fn["denops_shared_server#uninstall"]()
        end, {})
        vim.api.nvim_create_user_command("DenopsSharedServerRestart", function()
            vim.fn["denops_shared_server#restart"]()
        end, {})
    end,
    --cond = false,
    --enabled = false,
}

return spec
