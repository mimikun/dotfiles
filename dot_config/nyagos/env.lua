local global = require("global")
local today = require("utils").today()
local path_sep = global.path_sep
local home = global.home
local is_linux = global.is_linux
local is_windows = global.is_windows
local is_azusa = global.is_azusa
local is_work_pc = global.is_work_pc

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
    -- TODO: set browser name
    nyagos.envadd("BROWSER", nyagos.getenv("BROWSER") or "vivaldi")
else
    nyagos.envadd("BROWSER", nyagos.getenv("BROWSER") or "wsl-open")
end

---@type table
local lg_conf = {
    windows = table.concat({ home, "AppData", "Local", "lazygit", "config.yml" }, path_sep),
    wsl = table.concat({ xdg_config_home, "lazygit", "wsl_config.yml" }, path_sep),
    linux = table.concat({ xdg_config_home, "lazygit", "linux_config.yml" }, path_sep),
}

---@type string
local lg_config_file

if is_azusa then
    lg_config_file = lg_conf.linux
else
    if is_windows then
        lg_config_file = lg_conf.windows
    else
        lg_config_file = lg_conf.wsl
    end
end

nyagos.envadd("LG_CONFIG_FILE", lg_config_file)

---@type string
local github_username

if is_work_pc then
    -- Work envs
    if is_windows then
        -- on Windows
        github_username = '{{ (bitwardenFields "item" "083a244a-2d41-44a9-8e29-8f6434e74133").github_username.value }}'
    else
        -- on Linux
        github_username = '{{ (rbwFields "dotfiles-chezmoi").github_username.value }}'
    end
else
    -- Home envs
    github_username = "mimikun"
end

nyagos.envadd("GITHUB_USERNAME", github_username)

---@type string
local win_home

if is_windows then
    -- Windows envs
    win_home = home
else
    -- Linux envs
    if is_work_pc then
        -- Work envs
        win_home = '/mnt/c/Users/{{ (rbwFields "dotfiles-chezmoi").windows_user_name.value }}'
    else
        -- Home envs
        win_home = "/mnt/c/Users/mimikun"
    end
end

---@type string
local obsidian_vault_root

if is_work_pc then
    -- Work envs
    if is_windows then
        -- Windows envs
        obsidian_vault_root =
            '{{ (bitwardenFields "item" "083a244a-2d41-44a9-8e29-8f6434e74133").obsidian_vault_root_path.value }}'
    else
        -- Linux envs
        obsidian_vault_root = '{{ (rbwFields "dotfiles-chezmoi").obsidian_vault_root_path.value }}'
    end
elseif is_azusa then
    obsidian_vault_root = table.concat({ home, "Documents", "Obsidian", "mimikun" }, path_sep)
else
    -- Home envs
    obsidian_vault_root = table.concat({ "Obsidian", "mimikun" }, path_sep)
end

nyagos.envadd("OBSIDIAN_VAULT_ROOT", obsidian_vault_root)

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

-- zettelkasten
local zettelkasten_root = table.concat({ ghq_root, "codeberg.org", "mimikun", "zettelkasten" }, path_sep)
nyagos.envadd("zettelkasten_root", zettelkasten_root)

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
    nyagos.envadd("LC_ALL", nyagos.getenv("LC_ALL") or "en_US.UTF-8")
    nyagos.envadd("PIPENV_VENV_IN_PROJECT", nyagos.getenv("PIPENV_VENV_IN_PROJECT") or 1)
    nyagos.envadd("TZ", nyagos.getenv("TZ") or "Asia/Tokyo")
    nyagos.envadd("TODAY", nyagos.getenv("TODAY") or today)
    local starship_cache = table.concat({ xdg_cache_home, "cache" }, path_sep)
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

    if is_work_pc then
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

    -- bob-nvim
    local bob_config = table.concat({ xdg_config_home, "bob", "config.toml" }, path_sep)
    local bob_bin = table.concat({ xdg_data_home, "bob", "nvim-bin" }, path_sep)
    nyagos.envadd("BOB_CONFIG", bob_config)

    -- nvs
    local nvs_bin = table.concat({ xdg_data_home, "nvs", "bin" }, path_sep)

    -- NOTE: neovim version manager
    local use_nvs = false

    if use_nvs then
        nyagos.envadd("PATH", nvs_bin)
    else
        nyagos.envadd("PATH", bob_bin)
    end

    -- Neovide env-vars
    --[[
    -- Wayland / X11
    -- NOTE: Incomprehensible
    nyagos.envadd("NEOVIDE_APP_ID", nyagos.getenv("NEOVIDE_APP_ID") or "wayland_app_id")
    nyagos.envadd("NEOVIDE_WM_CLASS_INSTANCE", nyagos.getenv("NEOVIDE_WM_CLASS_INSTANCE") or "x11_wm_class_instance")
    nyagos.envadd("NEOVIDE_WM_CLASS", nyagos.getenv("NEOVIDE_WM_CLASS") or "x11_wm_class")
    ]]

    -- nimble
    local nimble_bin = table.concat({ home, ".nimble", "bin" }, path_sep)
    nyagos.envadd("PATH", nimble_bin)

    -- rebar3
    local rebar3_bin = table.concat({ xdg_cache_home, "rebar3", "bin" }, path_sep)
    nyagos.envadd("PATH", rebar3_bin)

    -- age public keys
    local age_pubkeys = {
        home = "age1cktdwc8u4z76kawluyswaruyeg7eg6078rw3t0kkmx5wqkk40d2qzajn8y",
        work = "age1n03v0casqk2djs2jw3xq5ldpdjtp2s6r0u3uhtmd7zv9j2xuyf6qpl9x7l",
        -- TODO: config
        azusa = "",
    }

    nyagos.envadd("AGE_PUBKEY_HOME", nyagos.getenv("AGE_PUBKEY_HOME") or age_pubkeys.home)
    nyagos.envadd("AGE_PUBKEY_WORK", nyagos.getenv("AGE_PUBKEY_WORK") or age_pubkeys.work)

    if is_work_pc then
        nyagos.envadd("AGE_PUBKEY", nyagos.getenv("AGE_PUBKEY") or age_pubkeys.home)
    else
        nyagos.envadd("AGE_PUBKEY", nyagos.getenv("AGE_PUBKEY") or age_pubkeys.work)
    end

    -- golang
    local go_path = table.concat({ home, "go" }, path_sep)
    local go_bin = table.concat({ go_path, "bin" }, path_sep)

    nyagos.envadd("GOPATH", nyagos.getenv("GOPATH") or go_path)
    nyagos.envadd("GOBIN", nyagos.getenv("GOBIN") or go_bin)
    nyagos.envadd("PATH", go_bin)
end
