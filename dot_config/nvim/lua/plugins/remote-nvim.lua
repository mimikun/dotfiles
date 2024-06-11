local global = require("core.global")

-- Enable Pure-Linux and macOS only.
local is_linux_or_macos = (not global.is_windows) and not global.is_wsl

-- Enable has `devpod` command
local has_devpod = (1 == vim.fn.executable("devpod")) and true or false

---@type boolean
local cond = is_linux_or_macos and has_devpod

---@type table
local cmds = {
    "RemoteStart",
    "RemoteStop",
    "RemoteInfo",
    "RemoteCleanup",
    "RemoteConfigDel",
    "RemoteLog",
}

---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
}

---@type LazySpec
local spec = {
    "amitds1997/remote-nvim.nvim",
    version = "*",
    --lazy = false,
    cmd = cmds,
    dependencies = dependencies,
    --config = true,
    config = function()
        local remote_nvim = require("remove-nvim")
        local utils = require("remote-nvim.utils")
        local constants = require("remote-nvim.constants")

        remote_nvim.setup({
            -- Configuration for devpod connections
            devpod = {
                -- Binary to use for devpod
                binary = "devpod",
                -- Binary to use for docker-related commands
                docker_binary = "docker",
                -- Path where devpod SSH configurations should be stored
                ---@diagnostic disable-next-line:param-type-mismatch
                ssh_config_path = utils.path_join(
                    utils.is_windows,
                    vim.fn.stdpath("data"),
                    constants.PLUGIN_NAME,
                    "ssh_config"
                ),
                -- How should devcontainers be searched
                search_style = "current_dir_only",
                -- For dotfiles, see https://devpod.sh/docs/developing-in-workspaces/dotfiles-in-a-workspace for more information
                dotfiles = {
                    -- Path to your dotfiles which should be copied into devcontainers
                    path = nil,
                    -- Install script that should be called to install your dotfiles
                    install_script = nil,
                },
                -- Should GPG agent be forwarded over the network
                gpg_agent_forwarding = false,
                -- How should docker list containers ("running_only" or "all")
                container_list = "running_only",
            },
            -- Configuration for SSH connections
            ssh_config = {
                -- Binary to use for running SSH command
                ssh_binary = "ssh",
                -- Binary to use for running SSH copy commands
                scp_binary = "scp",
                -- Which files should be considered to contain the ssh host configurations. NOTE: `Include` is respected in the provided files.
                ssh_config_file_paths = { "$HOME/.ssh/config" },

                -- These are useful for password-based SSH authentication.
                -- It provides parsing pattern for the plugin to detect that an input is requested.
                -- Each element contains the following attributes:
                -- match - The string to match (plain matching is done)
                -- type - Supports two values "plain"|"secret". Secret means when you provide the value, it should not be stored in the completion history of Neovim.
                -- value - Default value for the prompt
                -- value_type - "static"|"dynamic". For things like password, it would be needed for each new connection that the plugin initiates which could be obtrusive.
                -- So, we save the value (only for current session's interval) to ease the process. If set to "dynamic", we do not save the value even for the session. You have to provide a fresh value each time.
                ssh_prompts = {
                    {
                        match = "password:",
                        type = "secret",
                        value_type = "static",
                        value = "",
                    },
                    {
                        match = "continue connecting (yes/no/[fingerprint])?",
                        type = "plain",
                        value_type = "static",
                        value = "",
                    },
                    -- There are other values here which can be checked in lua/remote-nvim/init.lua
                },
            },

            -- Path to the script that would be copied to the remote and called to ensure that neovim gets installed.
            -- Default path is to the plugin's own ./scripts/neovim_install.sh file.
            neovim_install_script_path = utils.path_join(
                utils.is_windows,
                vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h:h:h"),
                "scripts",
                "neovim_install.sh"
            ),

            -- Modify the UI for the plugin's progress viewer.
            -- type can be "split" or "popup". All options from https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup and https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/split are supported.
            -- Note that some options like "border" are only available for "popup".
            progress_view = {
                type = "popup",
            },

            -- Offline mode configuration. For more details, see the "Offline mode" section below.
            offline_mode = {
                -- Should offline mode be enabled?
                enabled = false,
                -- Do not connect to GitHub at all. Not even to get release information.
                no_github = false,
                -- What path should be looked at to find locally available releases
                cache_dir = utils.path_join(
                    utils.is_windows,
                    vim.fn.stdpath("cache"),
                    constants.PLUGIN_NAME,
                    "version_cache"
                ),
            },

            -- Remote configuration
            remote = {
                -- List of directories that should be copied over
                copy_dirs = {
                    -- What to copy to remote's Neovim config directory
                    config = {
                        -- Path from where data has to be copied
                        base = vim.fn.stdpath("config"),
                        -- Directories that should be copied over. "*" means all directories. To specify a subset, use a list like {"lazy", "mason"} where "lazy", "mason" are subdirectories
                        dirs = "*",
                        -- under path specified in `base`.
                        compression = {
                            -- Should compression be enabled or not
                            enabled = false,
                            -- Any additional options that should be used for compression. Any argument that is passed to `tar` (for compression) can be passed here as separate elements.
                            additional_opts = {},
                        },
                    },
                    -- What to copy to remote's Neovim data directory
                    data = {
                        base = vim.fn.stdpath("data"),
                        dirs = {},
                        compression = {
                            enabled = true,
                        },
                    },
                    -- What to copy to remote's Neovim cache directory
                    cache = {
                        base = vim.fn.stdpath("cache"),
                        dirs = {},
                        compression = {
                            enabled = true,
                        },
                    },
                    -- What to copy to remote's Neovim state directory
                    state = {
                        base = vim.fn.stdpath("state"),
                        dirs = {},
                        compression = {
                            enabled = true,
                        },
                    },
                },
            },

            -- You can supply your own callback that should be called to create the local client. This is the default implementation.
            -- Two arguments are passed to the callback:
            -- port: Local port at which the remote server is available
            -- workspace_config: Workspace configuration for the host. For all the properties available, see https://github.com/amitds1997/remote-nvim.nvim/blob/main/lua/remote-nvim/providers/provider.lua#L4
            -- A sample implementation using WezTerm tab is at: https://github.com/amitds1997/remote-nvim.nvim/wiki/Configuration-recipes
            client_callback = function(port, _)
                require("remote-nvim.ui").float_term(
                    ("nvim --server localhost:%s --remote-ui"):format(port),
                    function(exit_code)
                        if exit_code ~= 0 then
                            vim.notify(
                                ("Local client failed with exit code %s"):format(exit_code),
                                vim.log.levels.ERROR
                            )
                        end
                    end
                )
            end,

            -- Plugin log related configuration [PREFER NOT TO CHANGE THIS]
            log = {
                -- Where is the log file
                filepath = utils.path_join(
                    utils.is_windows,
                    vim.fn.stdpath("state"),
                    ("%s.log"):format(constants.PLUGIN_NAME)
                ),
                -- Level of logging
                level = "info",
                -- At what size, should we truncate the logs
                -- 2MB
                max_size = 1024 * 1024 * 2,
            },
        })
    end,
    cond = cond,
}

return spec
