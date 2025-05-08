local c = require("plugins.lualine-nvim.opts.components")

---@type table
local sections = {
    lualine_a = { "mode" },
    lualine_b = { c.filename },
    lualine_c = {
        c.diagnostics,
        { "lsp-status" },
        { "navic" },
    },
    lualine_x = {
        -- copilot-lualine
        c.copilot,
        -- aerial.nvim
        c.aerial,
        -- mcphub.nvim
        -- BUG: has bug. can't work
        --{ require("mcphub.extensions.lualine") },
        -- LazyDo
        c.lazydo,
        -- obsidian.nvim
        c.obsidian,
        -- improved_encoding
        { c.improved_encoding },
        -- diff
        c.diff,
    },
    lualine_y = { "filetype" },
    lualine_z = { c.fileformat },
}

return sections
