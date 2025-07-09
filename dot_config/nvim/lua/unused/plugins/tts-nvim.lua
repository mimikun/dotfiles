-- XXX: This plugin english only now

--[[
-- NOTE: Need its
ffplay: https://ffmpeg.org/ffplay.html
edge_tts: https://github.com/rany2/edge-tts
]]

---@type LazySpec
local spec = {
    "johannww/tts.nvim",
    --lazy = false,
    cmd = "TTS",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    cond = false,
    enabled = false,
}

return spec
