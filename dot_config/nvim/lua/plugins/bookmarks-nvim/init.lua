---@type LazySpec
local spec = {
    "LintaoAmons/bookmarks.nvim",
    --lazy = false,
    cmd = require("plugins.bookmarks-nvim.cmds"),
    keys = require("plugins.bookmarks-nvim.keys"),
    dependencies = require("plugins.bookmarks-nvim.dependencies"),
    config = function()
        require("bookmarks").setup(require("plugins.bookmarks-nvim.opts"))

        ---@param input string
        local function toggle_mark(input)
            require("bookmarks.domain.service").toggle_mark(input)
            require("bookmarks.sign").safe_refresh_signs()
            pcall(require("bookmarks.tree").refresh)
        end

        vim.api.nvim_create_user_command("BookmarksQuickMark", function()
            toggle_mark("")
        end, { desc = "Toggle bookmark for the current line into active BookmarkList (no name)." })
    end,
    cond = false,
    enabled = false,
}

return spec
