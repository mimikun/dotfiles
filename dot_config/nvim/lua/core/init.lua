local load_core = function()
    -- options を読み込む
    require("core.options")
    --require("core.more-options")

    -- keymaps を読み込む
    require("keymaps")

    -- plugin を読み込む
    require("core.lazyvim")

    -- colorscheme を読み込む
    require("core.colorscheme")

    -- autocmd を読み込む
    --require("core.autocmds")
end

load_core()
