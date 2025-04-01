local global = require("config.global")
local home = global.home
local path_sep = global.path_sep

---@type string
local ssh_config = table.concat({ home, ".ssh", "config" }, path_sep)

---@type string
local base_dir = table.concat({ home, ".sshfs" }, path_sep)

---@type table
local opts = {
    connections = {
        ssh_configs = {
            ssh_config,
            "/etc/ssh/ssh_config",
        },
        sshfs_args = {
            "-o reconnect",
            "-o ConnectTimeout=5",
        },
    },
    mounts = {
        base_dir = base_dir,
        unmount_on_exit = true,
    },
    handlers = {
        on_connect = {
            change_dir = true,
        },
        on_disconnect = {
            clean_mount_folders = false,
        },
        on_add = {},
        on_edit = {},
    },
    ui = {
        -- NOTE: not implemented
        select_prompts = false,
        confirm = {
            connect = true,
            change_dir = false,
        },
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            util = false,
            handler = false,
            sshfs = false,
        },
    },
}

return opts
