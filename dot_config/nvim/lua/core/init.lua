local load_core = function()
    -- options を読み込む
    require("core.options")

    -- keymaps を読み込む
    require("keymaps")

    -- plugin を読み込む
    require("core.lazyvim")

    -- autocmd を読み込む
    require("core.autocmds")

    -- neovide を読み込む
    require("core.neovide")

    -- Set colorscheme
    if require("core.settings").use_theme_switcher == "themery" then
        -- themery
        require("core.themery")
    end
end

load_core()
