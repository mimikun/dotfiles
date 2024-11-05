---@type boolean
local human_rights_violation = not require("config.global").is_human_rights

if human_rights_violation then
    vim.g.denops_server_addr = "127.0.0.1:32123"
end

vim.api.nvim_create_user_command("DenopsSharedServerInstall", function()
    vim.fn["denops_shared_server#install"]()
end, {})

vim.api.nvim_create_user_command("DenopsSharedServerUninstall", function()
    vim.fn["denops_shared_server#uninstall"]()
end, {})

vim.api.nvim_create_user_command("DenopsSharedServerRestart", function()
    vim.fn["denops_shared_server#restart"]()
end, {})
