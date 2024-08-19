local extensions = {
    frecency = require("plugins.configs.telescope-nvim.frecency"),
    smart_open = require("plugins.configs.telescope-nvim.smart-open"),
    --glyph = require("plugins.configs.telescope-nvim.glyph"),
    --emoji = require("plugins.configs.telescope-nvim.emoji"),
    --lazy = require("plugins.configs.telescope-nvim.lazy"),
    --egrepify = require("plugins.configs.telescope-nvim.egrepify"),
    --file_browser = require("plugins.configs.telescope-nvim.file-browser"),
    --package_info = require("plugins.configs.telescope-nvim.package-info"),
    --zoxide = require("plugins.configs.telescope-nvim.zoxide"),
    --undo = require("plugins.configs.telescope-nvim.undo"),
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not require("config.global").is_windows then
    table.insert(extensions, { fzf = require("plugins.configs.telescope-nvim.fzf") })
    --table.insert(extensions, { media = require("plugins.configs.telescope-nvim.media") })
end

return extensions
