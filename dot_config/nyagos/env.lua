local global = require("global")
local today = require("utils").today()
local path_sep = global.path_sep
local home = global.home
local is_linux = global.is_linux
local is_windows = global.is_windows
local is_azusa = global.is_azusa
local is_not_human_rights = global.is_not_human_rights

nyagos.envadd("HOME", home)
local xdg_config_home = table.concat({ home, ".config" }, path_sep)

-- chezmoi
local chezmoi_dir = table.concat({ home, ".local", "share", "chezmoi" }, path_sep)
nyagos.envadd("CHEZMOI_DIR", nyagos.getenv("CHEZMOI_DIR") or chezmoi_dir)

-- ghq
local ghq_root = nyagos.getenv("GHQ_ROOT") or (table.concat({ home, "ghq" }, path_sep))
nyagos.envadd("GHQ_ROOT", ghq_root)
nyagos.envadd("GHQ_SELECTOR", nyagos.getenv("GHQ_SELECTOR") or "fzf")

-- starship
local starship_path = table.concat({ xdg_config_home, "starship" }, path_sep)
local starship_config = table.concat({ starship_path, "starship.toml" }, path_sep)
nyagos.envadd("STARSHIP_CONFIG", nyagos.getenv("STARSHIP_CONFIG") or starship_config)

-- nyagos configs
local nyagos_config_dir = table.concat({ home, ".config", "nyagos" }, path_sep)
nyagos.envadd("NYAGOS_CONFIG", table.concat({ home, ".nyagos" }, path_sep))
nyagos.envadd("NYAGOS_CONFIG_DIR", nyagos_config_dir)

-- set PATHs
local cargo_path = table.concat({ home, ".cargo" }, path_sep)
local cargo_bin = table.concat({ cargo_path, "bin" }, path_sep)
local deno_path = table.concat({ home, ".deno" }, path_sep)
local deno_bin = table.concat({ deno_path, "bin" }, path_sep)
nyagos.envadd("PATH", cargo_bin)
nyagos.envadd("PATH", deno_bin)

-- neovim config
local windows_nvim_config = table.concat({ home, "AppData", "Local", "nvim" }, path_sep)
local linux_nvim_config = table.concat({ xdg_config_home, "nvim" }, path_sep)
local nvim_config = is_windows and windows_nvim_config or linux_nvim_config
nyagos.envadd("EDITOR", nyagos.getenv("EDITOR") or "nvim")

if is_azusa then
    nyagos.envadd("GTK_IM_MODULE", nyagos.getenv("GTK_IM_MODULE") or "fcitx")
    nyagos.envadd("QT_IM_MODULE", nyagos.getenv("QT_IM_MODULE") or "fcitx")
    nyagos.envadd("XMODIFIERS", nyagos.getenv("XMODIFIERS") or "@im=fcitx")
    -- CapsLock to Ctrl
    nyagos.eval("setxkbmap -option ctrl:nocaps")
end

local lg_conf = {
    win = table.concat({ home, "AppData", "Local", "lazygit", "config.yml" }, path_sep),
    wsl = table.concat({ xdg_config_home, "lazygit", "wsl_config.yml" }, path_sep),
    linux = table.concat({ xdg_config_home, "lazygit", "linux_config.yml" }, path_sep),
}

local github_username
local win_home
local obsidian_vault_root
local lg_config_file

if is_not_human_rights then
    -- Work envs
    github_username = '{{ (bitwardenFields "item" "0f17c992-d0fe-4f36-bde8-95d9e2de3a6d").github_username.value }}'
    win_home =
        '/mnt/c/Users/{{ (bitwardenFields "item" "0f17c992-d0fe-4f36-bde8-95d9e2de3a6d").windows_user_name.value }}'
    obsidian_vault_root =
        '{{ (bitwardenFields "item" "0f17c992-d0fe-4f36-bde8-95d9e2de3a6d").obsidian_vault_root_path.value }}'
    if is_linux then
        lg_config_file = lg_conf.wsl
    else
        lg_config_file = lg_conf.win
    end
else
    -- Home envs
    if is_linux then
        -- home-wsl envs
        github_username = '{{ (rbwFields "dotfiles-chezmoi").github_username.value }}'
        if is_azusa then
            -- Home azusa envs
            obsidian_vault_root = table.concat({ home, "Documents", "Obsidian", "mimikun" }, path_sep)
            lg_config_file = lg_conf.linux
        else
            -- home-wsl envs
            win_home = '/mnt/c/Users/{{ (rbwFields "dotfiles-chezmoi").windows_user_name.value }}'
            obsidian_vault_root = '{{ (rbwFields "dotfiles-chezmoi").obsidian_vault_root_path.value }}'
            lg_config_file = lg_conf.wsl
        end
    elseif is_windows then
        -- home-windows envs
        github_username = '{{ (bitwardenFields "item" "ec557677-82d9-4a61-a4f6-aed300cfb34f").github_username.value }}'
        win_home = home
        obsidian_vault_root =
            '{{ (bitwardenFields "item" "ec557677-82d9-4a61-a4f6-aed300cfb34f").obsidian_vault_root_path.value }}'
        lg_config_file = lg_conf.windows
    end
end

nyagos.envadd("GITHUB_USERNAME", github_username)
nyagos.envadd("OBSIDIAN_VAULT_ROOT", obsidian_vault_root)
nyagos.envadd("LG_CONFIG_FILE", lg_config_file)

local obsidian_vault_root_path = nil

if not is_azusa then
    if is_linux then
        nyagos.envadd("DISPLAY", nyagos.getenv("DISPLAY" or ":0"))
    end

    nyagos.envadd("WIN_HOME", win_home)

    -- workspace
    local workspace = table.concat({ ghq_root, "github.com", github_username }, path_sep)
    nyagos.envadd("WORKSPACE", workspace)

    local workspace_mimikun = table.concat({ ghq_root, "github.com", "mimikun" }, path_sep)
    nyagos.envadd("WORKSPACE_MIMIKUN", workspace_mimikun)

    local nvim_dev_plugins = table.concat({ workspace_mimikun, "dev-plugins" }, path_sep)
    nyagos.envadd("NVIM_DEV_PLUGINS", nvim_dev_plugins)

    -- win_dl
    local win_dl = table.concat({ win_home, "Downloads" }, path_sep)
    nyagos.envadd("WIN_DL", win_dl)
    nyagos.envadd("windl", win_dl)

    -- win_desktop
    local win_desktop = table.concat({ win_home, "Desktop" }, path_sep)
    nyagos.envadd("WIN_DESKTOP", win_desktop)

    -- win_documents
    local win_documents = table.concat({ win_home, "Documents" }, path_sep)
    nyagos.envadd("WIN_DOCUMENTS", win_documents)

    -- home or work obsidian_vault_root_path
    obsidian_vault_root_path = table.concat({ win_documents, obsidian_vault_root }, path_sep)
else
    -- azusa obsidian_vault_root_path
    obsidian_vault_root_path = obsidian_vault_root
end

local obsidian_dailynote_path = table.concat({ obsidian_vault_root_path, "001_DailyNotes" }, path_sep)
local today_dailynote = obsidian_dailynote_path .. path_sep .. (today .. ".md")
nyagos.envadd("OBSIDIAN_VAULT_ROOT_PATH", obsidian_vault_root_path)
nyagos.envadd("obsidian_vault_root_path", obsidian_vault_root_path)
nyagos.envadd("obsidian_vault_path", obsidian_vault_root_path)
nyagos.envadd("obsidian_dailynote_path", obsidian_dailynote_path)
nyagos.envadd("obsidian", obsidian_dailynote_path)
nyagos.envadd("today_dailynote", today_dailynote)

--- Neovide env-vars
--[[
--- Functionality
-- Frame
nyagos.envadd("NEOVIDE_FRAME", nyagos.getenv("NEOVIDE_FRAME") or "full")
nyagos.envadd("NEOVIDE_FRAME", nyagos.getenv("NEOVIDE_FRAME") or "none")

-- Maximized
-- NOTE: not documented
nyagos.envadd("NEOVIDE_MAXIMIZED", nyagos.getenv("NEOVIDE_MAXIMIZED") or true)

-- Multigrid
-- NOTE: not documented
nyagos.envadd("NEOVIDE_NO_MULTIGRID", nyagos.getenv("NEOVIDE_NO_MULTIGRID") or true)

-- Fork
nyagos.envadd("NEOVIDE_FORK", nyagos.getenv("NEOVIDE_FORK") or 0)

-- No Idle
nyagos.envadd("NEOVIDE_IDLE", nyagos.getenv("NEOVIDE_IDLE") or 0)

-- sRGB
nyagos.envadd("NEOVIDE_SRGB", nyagos.getenv("NEOVIDE_SRGB") or 0)

-- Tabs
nyagos.envadd("NEOVIDE_TABS", nyagos.getenv("NEOVIDE_TABS") or 0)

-- No VSync
nyagos.envadd("NEOVIDE_VSYNC", nyagos.getenv("NEOVIDE_VSYNC") or 0)

-- Neovim Binary
nyagos.envadd("NEOVIM_BIN", nyagos.getenv("NEOVIM_BIN") or "/path/to/nvim")
]]

-- Linux only tools
if is_linux then
    local xdg_cache_home = table.concat({ home, ".cache" }, path_sep)
    local dot_local = table.concat({ home, ".local" }, path_sep)
    local xdg_data_home = table.concat({ dot_local, "share" }, path_sep)
    local xdg_state_home = table.concat({ dot_local, "state" }, path_sep)
    -- XDG base directory
    nyagos.envadd("XDG_CONFIG_HOME", nyagos.getenv("XDG_CONFIG_HOME") or xdg_config_home)
    nyagos.envadd("XDG_CACHE_HOME", nyagos.getenv("XDG_CACHE_HOME") or xdg_cache_home)
    nyagos.envadd("XDG_DATA_HOME", nyagos.getenv("XDG_DATA_HOME") or xdg_data_home)
    nyagos.envadd("XDG_STATE_HOME", nyagos.getenv("XDG_STATE_HOME") or xdg_state_home)
    -- envs
    nyagos.envadd("LANG", nyagos.getenv("LANG") or "en_US.UTF-8")
    nyagos.envadd("PIPENV_VENV_IN_PROJECT", nyagos.getenv("PIPENV_VENV_IN_PROJECT") or 1)
    nyagos.envadd("TZ", nyagos.getenv("TZ") or "Asia/Tokyo")
    nyagos.envadd("TODAY", nyagos.getenv("TODAY") or today)
    local starship_cache = table.concat({ starship_path, "cache" }, path_sep)
    nyagos.envadd("STARSHIP_CACHE", nyagos.getenv("STARSHIP_CACHE") or starship_cache)

    nyagos.envadd(
        "PATH",
        "/bin",
        "/sbin",
        "/usr/bin",
        "/usr/sbin",
        "/usr/games",
        "/usr/local/bin",
        "/usr/local/sbin",
        "/usr/local/games",
        "/usr/local/go/bin/",
        "/snap/bin",
        table.concat({ dot_local, "bin" }, path_sep),
        table.concat({ home, "go", "bin" }, path_sep),
        table.concat({ home, ".npm-global", "bin" }, path_sep),
        table.concat({ home, ".gem", "ruby", "2.7.0", "bin" }, path_sep),
        table.concat({ home, "depot_tools" }, path_sep),
        table.concat({ home, ".fzf", "bin" }, path_sep),
        table.concat({ home, ".dotnet", "tools" }, path_sep)
    )

    -- mise
    local mise_config_dir = table.concat({ xdg_config_home, "mise" }, path_sep)
    local mise_data_dir = table.concat({ xdg_data_home, "mise" }, path_sep)
    local mise_cache_dir = table.concat({ xdg_cache_home, "mise" }, path_sep)
    local mise_config_file = table.concat({ mise_config_dir, "config.toml" }, path_sep)
    local mise_log_file = table.concat({ mise_cache_dir, "mise.log" }, path_sep)
    -- If not human rights, MISE_JOBS = 1.
    local mise_jobs = is_not_human_rights and 1 or 4
    --local mise_shorthands_file = table.concat({ mise_config_dir, "shorthands.toml" }, path_sep)
    nyagos.envadd("MISE_CONFIG_DIR", nyagos.getenv("MISE_CONFIG_DIR") or mise_config_dir)
    nyagos.envadd("MISE_DATA_DIR", nyagos.getenv("MISE_DATA_DIR") or mise_data_dir)
    nyagos.envadd("MISE_CACHE_DIR", nyagos.getenv("MISE_CACHE_DIR") or mise_cache_dir)
    nyagos.envadd("MISE_GLOBAL_CONFIG_FILE", nyagos.getenv("MISE_GLOBAL_CONFIG_FILE") or mise_config_file)
    nyagos.envadd("MISE_USE_VERSIONS_HOST", nyagos.getenv("MISE_USE_VERSIONS_HOST") or true)
    nyagos.envadd("MISE_LEGACY_VERSION_FILE", nyagos.getenv("MISE_LEGACY_VERSION_FILE") or 1)
    nyagos.envadd("MISE_LOG_FILE", nyagos.getenv("MISE_LOG_FILE") or mise_log_file)
    nyagos.envadd("MISE_ASDF_COMPAT", nyagos.getenv("MISE_ASDF_COMPAT") or 1)
    nyagos.envadd("MISE_JOBS", nyagos.getenv("MISE_JOBS") or mise_jobs)
    --nyagos.envadd("MISE_SHORTHANDS_FILE", nyagos.getenv("MISE_SHORTHANDS_FILE") or mise_shorthands_file)
    nyagos.envadd("MISE_YES", nyagos.getenv("MISE_YES") or 1)
    nyagos.envadd("MISE_NOT_FOUND_AUTO_INSTALL", nyagos.getenv("MISE_NOT_FOUND_AUTO_INSTALL") or false)
    nyagos.envadd("MISE_EXPERIMENTAL", nyagos.getenv("MISE_EXPERIMENTAL") or 1)

    -- cabal config
    local cabal_bin = table.concat({ home, ".cabal", "bin" }, path_sep)
    nyagos.envadd("PATH", cabal_bin)

    -- https://github.com/antfu/ni config
    local ni_config_file = table.concat({ xdg_config_home, "ni", ".nirc" }, path_sep)
    nyagos.envadd("NI_CONFIG_FILE", nyagos.getenv("NI_CONFIG_FILE") or ni_config_file)

    -- codon config
    local codon_bin = table.concat({ home, ".codon", "bin" }, path_sep)
    nyagos.envadd("PATH", codon_bin)

    -- Rye
    local rye_shims = table.concat({ home, ".rye", "shims" }, path_sep)
    nyagos.envadd("PATH", rye_shims)

    -- luarocks
    local luarocks_bin = table.concat({ home, ".luarocks", "bin" }, path_sep)
    nyagos.envadd("PATH", luarocks_bin)
    nyagos.envadd(
        "LUA_PATH",
        "/usr/local/share/lua/5.3/?.lua",
        "/usr/local/share/lua/5.3/?/init.lua",
        "/usr/local/lib/lua/5.3/?.lua",
        "/usr/local/lib/lua/5.3/?/init.lua",
        "./?.lua",
        "./?/init.lua",
        table.concat({ home, ".luarocks/share/lua/5.3/?.lua" }, path_sep),
        table.concat({ home, ".luarocks/share/lua/5.3/?/init.lua" }, path_sep)
    )
    nyagos.envadd(
        "LUA_CPATH",
        "/usr/local/lib/lua/5.3/?.so",
        "/usr/local/lib/lua/5.3/loadall.so",
        "./?.so",
        "$HOME/.luarocks/lib/lua/5.3/?.so"
    )

    -- Bun
    local bun_install_dir = table.concat({ home, ".bun" }, path_sep)
    nyagos.envadd("BUN_INSTALL", nyagos.getenv("BUN_INSTALL") or bun_install_dir)
    local bun_bin = table.concat({ bun_install_dir, "bin" }, path_sep)
    nyagos.envadd("PATH", bun_bin)

    -- fly.io
    local flyctl_dir = table.concat({ home, ".fly" }, path_sep)
    nyagos.envadd("FLYCTL_INSTALL", nyagos.getenv("FLYCTL_INSTALL") or flyctl_dir)
    local flyctl_bin = table.concat({ nyagos.getenv("FLYCTL_INSTALL"), "bin" }, path_sep)
    nyagos.envadd("PATH", flyctl_bin)

    -- pnpm
    local pnpm_home = table.concat({ xdg_config_home, "pnpm" }, path_sep)
    nyagos.envadd("PNPM_HOME", nyagos.getenv("PNPM_HOME") or pnpm_home)
    nyagos.envadd("PATH", nyagos.getenv("PNPM_HOME"))

    if is_not_human_rights then
        local java_home = table.concat({
            xdg_cache_home,
            "coursier",
            "arc",
            "https",
            "github.com",
            "AdoptOpenJDK",
            "openjdk8-binaries",
            "releases",
            "download",
            "jdk8u292-b10",
            "OpenJDK8U-jdk_x64_linux_hotspot_8u292b10.tar.gz",
            "jdk8u292-b10",
        }, path_sep)
        -- JVM path
        nyagos.envadd("JAVA_HOME", nyagos.getenv("JAVA_HOME") or java_home)
        nyagos.envadd("PATH", table.concat({ nyagos.getenv("JAVA_HOME"), "bin" }, path_sep))

        -- coursier path
        local coursier_path = table.concat({ xdg_data_home, "coursier", "bin" }, path_sep)
        nyagos.envadd("PATH", coursier_path)
        -- # windowsのpathとかぶる問題防止
        nyagos.alias.cs = coursier_path .. "bin"
    end

    -- aqua
    local aqua_root_dir = table.concat({ xdg_data_home, "aquaproj-aqua" }, path_sep)
    nyagos.envadd("AQUA_ROOT_DIR", nyagos.getenv("AQUA_ROOT_DIR") or aqua_root_dir)
    local aqua_bin = table.concat({ nyagos.getenv("AQUA_ROOT_DIR"), "bin" }, path_sep)
    nyagos.envadd("PATH", aqua_bin)

    -- bob neovim version manager
    local bob_config = table.concat({ xdg_config_home, "bob", "config.toml" }, path_sep)
    local bob_bin = table.concat({ xdg_data_home, "bob", "nvim-bin" }, path_sep)
    nyagos.envadd("BOB_CONFIG", bob_config)
    nyagos.envadd("PATH", bob_bin)

    -- Neovide env-vars
    --[[
    -- Wayland / X11
    -- NOTE: Incomprehensible
    nyagos.envadd("NEOVIDE_APP_ID", nyagos.getenv("NEOVIDE_APP_ID") or "wayland_app_id")
    nyagos.envadd("NEOVIDE_WM_CLASS_INSTANCE", nyagos.getenv("NEOVIDE_WM_CLASS_INSTANCE") or "x11_wm_class_instance")
    nyagos.envadd("NEOVIDE_WM_CLASS", nyagos.getenv("NEOVIDE_WM_CLASS") or "x11_wm_class")
    ]]
end
