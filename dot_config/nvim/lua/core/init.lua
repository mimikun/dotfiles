require("core.options")
require("keymaps")
require("core.lazyvim")
require("core.autocmds")
require("core.usercmds")
require("core.neovide")

-- Set colorscheme
if require("core.settings").use_theme_switcher == "themery" then
    -- themery
    require("core.themery")
end
