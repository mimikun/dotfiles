---@type table
local extensions = {
    --frecency = require("plugins.telescope-nvim.extensions.frecency"),
    smart_open = require("plugins.telescope-nvim.extensions.smart-open"),
    --lazy = require("plugins.telescope-nvim.extensions.lazy"),
    --file_browser = require("plugins.telescope-nvim.extensions.file-browser"),
    --package_info = require("plugins.telescope-nvim.extensions.package-info"),
    --zoxide = require("plugins.telescope-nvim.extensions.zoxide"),
    --undo = require("plugins.telescope-nvim.extensions.undo"),
    --aerial = require("plugins.telescope-nvim.extensions.aerial"),
    ecolog = require("plugins.telescope-nvim.extensions.ecolog"),
    --live_grep_args =require("plugins.telescope-nvim.extensions.live-grep-args"),
    --orgmode = require("plugins.telescope-nvim.extensions.orgmode"),
    --prompts = require("plugins.telescope-nvim.extensions.prompts"),
    --import = require("plugins.telescope-nvim.extensions.import"),
    --live_grep_history = require("plugins.telescope-nvim.extensions.live-grep-history"),
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not require("config.global").is_windows then
    table.insert(extensions, { fzf = require("plugins.telescope-nvim.extensions.fzf") })
    --table.insert(extensions, { media = require("plugins.telescope-nvim.extensions.media") })
    table.insert(extensions, { media_files = require("plugins.telescope-nvim.extensions.media-files") })
end

return extensions
