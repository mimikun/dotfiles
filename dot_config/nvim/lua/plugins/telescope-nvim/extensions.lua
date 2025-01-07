local extensions = {
    --frecency = require("plugins.telescope-nvim.frecency"),
    smart_open = require("plugins.telescope-nvim.smart-open"),
    --lazy = require("plugins.telescope-nvim.lazy"),
    --file_browser = require("plugins.telescope-nvim.file-browser"),
    --package_info = require("plugins.telescope-nvim.package-info"),
    --zoxide = require("plugins.telescope-nvim.zoxide"),
    --undo = require("plugins.telescope-nvim.undo"),
    --aerial = require("plugins.telescope-nvim.aerial"),
    ecolog = require("plugins.telescope-nvim.ecolog"),
    --live_grep_args =require("plugins.telescope-nvim.live-grep-args"),
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not require("config.global").is_windows then
    table.insert(extensions, { fzf = require("plugins.telescope-nvim.fzf") })
    --table.insert(extensions, { media = require("plugins.telescope-nvim.media") })
    table.insert(extensions, { media_files = require("plugins.telescope-nvim.media-files") })
end

return extensions
