local extensions = {
    frecency = require("plugins.telescope-ext.frecency"),
    smart_open = require("plugins.telescope-ext.smart-open"),
    --glyph = require("plugins.telescope-ext.glyph"),
    --emoji = require("plugins.telescope-ext.emoji"),
    lazy = require("plugins.telescope-ext.lazy"),
    --egrepify = require("plugins.telescope-ext.egrepify"),
    file_browser = require("plugins.telescope-ext.file-browser"),
    package_info = require("plugins.telescope-ext.package-info"),
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not require("core.global").is_windows then
    table.insert(extensions, { fzf = require("plugins.telescope-ext.fzf") })
    table.insert(extensions, { media = require("plugins.telescope-ext.media") })
end

return extensions
