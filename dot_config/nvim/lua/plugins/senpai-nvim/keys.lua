---@type LazyKeysSpec[]
local keys = {
    { "<space>ss", "<Cmd>Senpai toggleChat<CR>" },
    { "<space>sl", "<Cmd>Senpai promptLauncher<CR>" },
    --{ "<space>sv", "<Cmd>Senpai transferToChat<CR>", mode = "v" },
    {
        "<space>sv",
        function()
            require("senpai.api").transfer_visual_to_chat()
        end,
        mode = "v",
        desc = "[senpai] transfer_visual_to_chat",
    },
}

return keys
