---@type LazyKeysSpec[]
local keys = {
    {
        "zR",
        function()
            require("ufo").openAllFolds()
        end,
        mode = "n",
        desc = "",
    },
    {
        "zM",
        function()
            require("ufo").closeAllFolds()
        end,
        mode = "n",
        desc = "",
    },
    {
        "zr",
        function()
            require("ufo").openFoldsExceptKinds()
        end,
        mode = "n",
        desc = "",
    },
    {
        "zm",
        function()
            require("ufo").closeFoldsWith()
        end,
        mode = "n",
        desc = "",
    },
}

return keys
