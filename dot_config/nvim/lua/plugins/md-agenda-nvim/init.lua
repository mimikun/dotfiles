---@type LazySpec
local spec = {
    "zenarvus/md-agenda.nvim",
    --lazy = false,
    ft = "markdown",
    cmd = require("plugins.md-agenda-nvim.cmds"),
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("md-agenda").setup(require("plugins.md-agenda-nvim.opts"))

        --optional: set keymaps for commands
        vim.keymap.set("n", "<A-t>", ":CheckTask<CR>")
        vim.keymap.set("n", "<A-c>", ":CancelTask<CR>")

        vim.keymap.set("n", "<A-h>", ":HabitView<CR>")
        vim.keymap.set("n", "<A-a>", ":AgendaView<CR>")
        vim.keymap.set("n", "<A-Left>", ":PrevAgendaPage<CR>")
        vim.keymap.set("n", "<A-Right>", ":NextAgendaPage<CR>")

        vim.keymap.set("n", "<A-s>", ":TaskScheduled<CR>")
        vim.keymap.set("n", "<A-d>", ":TaskDeadline<CR>")

        vim.keymap.set("n", "<A-f>", ":TaskSearch<CR>")

        --optional: create your own agenda view command to show tasks with a specific tag only
        vim.api.nvim_create_user_command("WorkAgenda", function()
            vim.cmd("AgendaViewWTF work companyA") --Run the agenda view with tag filters
        end, {})
    end,
    cond = false,
    enabled = false,
}

return spec
