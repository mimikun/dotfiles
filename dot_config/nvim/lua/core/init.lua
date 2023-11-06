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

    -- user func を読み込む
    --require("core.userfunc")
end

load_core()
