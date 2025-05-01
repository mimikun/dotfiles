---@type boolean
local is_human_rights = require("config.global").is_human_rights

---@type vx.droplet
local droplet = {
    max_size_offset = 5,
    timings = {
        max_fps = is_human_rights and 25 or 15,
        fps_variance = is_human_rights and 3 or 2,
        glitch_fps_divider = 12,
        max_timeout = 200,
        local_glitch_frame_sharing = false,
        global_glitch_frame_sharing = true,
    },
    random = {
        body_to_tail = is_human_rights and 50 or 10,
        head_to_glitch = is_human_rights and 20 or -1,
        head_to_tail = is_human_rights and 50 or 20,
        kill_head = is_human_rights and 150 or 50,
        new_head = is_human_rights and 30 or 80,
    },
}

return droplet
