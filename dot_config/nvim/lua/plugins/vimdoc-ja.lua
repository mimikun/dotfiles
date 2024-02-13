local global = require("core.global")
local data_dir = global.data_dir
local path_sep = global.path_sep

local vimdoc_repo = table.concat({ data_dir, "lazy", "vimdoc-ja" }, path_sep)

-- NOTE: Workaround for a FXXING SHXT BUG caused by the combination of vimdoc-ja and lazy.nvim
-- thx: https://github.com/delphinus/dotfiles/blob/master/.config/nvim/lua/core/lazy/init.lua
vim.api.nvim_create_autocmd("User", {
    pattern = "LazyUpdatePre",
    group = vim.api.nvim_create_augroup("lazy-update-pre", {}),
    callback = function()
        vim.system({ "git", "reset", "--hard" }, { cwd = tostring(vimdoc_repo) }, function(info)
            if info.code == 0 then
                vim.schedule(function()
                    vim.notify("SUCCESS: git reset --hard", vim.log.levels.DEBUG)
                end)
            else
                vim.schedule(function()
                    vim.notify("FAILED: git reset --hard", vim.log.levels.ERROR)
                end)
            end
        end):wait()
    end,
})

return {
    "vim-jp/vimdoc-ja",
    --lazy = false,
    --event = "VeryLazy",
    keys = {
        { "h", mode = "c", desc = "open [H]elp" },
    },
    --cond = false,
}
