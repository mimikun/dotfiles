local global = require("global")
local today = require("utils").today()
local path_sep = global.path_sep
local home = global.home
local is_linux = global.is_linux
local is_windows = global.is_windows
local is_not_human_rights = global.is_not_human_rights

local xdg_config_home = home .. path_sep .. ".config"
local xdg_cache_home = home .. path_sep .. ".cache"
local dot_local = home .. path_sep .. ".local"
local xdg_data_home = dot_local .. path_sep .. "share"
local xdg_state_home = dot_local .. path_sep .. "state"

-- config
nyagos.envadd("HOME", home)

-- XDG base directory
nyagos.envadd("XDG_CONFIG_HOME", nyagos.getenv("XDG_CONFIG_HOME") or xdg_config_home)
nyagos.envadd("XDG_CACHE_HOME", nyagos.getenv("XDG_CACHE_HOME") or xdg_cache_home)
nyagos.envadd("XDG_DATA_HOME", nyagos.getenv("XDG_DATA_HOME") or xdg_data_home)

nyagos.envadd("XDG_STATE_HOME", nyagos.getenv("XDG_STATE_HOME") or xdg_state_home)

-- envs
nyagos.envadd("LANG", nyagos.getenv("LANG") or "en_US.UTF-8")
nyagos.envadd("GHQ_ROOT", nyagos.getenv("GHQ_ROOT") or (home .. path_sep .. "ghq"))
nyagos.envadd("GHQ_SELECTOR", nyagos.getenv("GHQ_SELECTOR") or "fzf")
nyagos.envadd("PIPENV_VENV_IN_PROJECT", nyagos.getenv("PIPENV_VENV_IN_PROJECT") or 1)
nyagos.envadd("TZ", nyagos.getenv("TZ") or "Asia/Tokyo")
-- TODO: settings
nyagos.envadd("TODAY", nyagos.getenv("TODAY") or today)

local starship_path = xdg_config_home .. path_sep .. "starship"
local starship_config = starship_path .. path_sep .. "starship.toml"
local starship_cache = starship_path .. path_sep .. "cache"
nyagos.envadd("STARSHIP_CONFIG", nyagos.getenv("STARSHIP_CONFIG") or starship_config)
nyagos.envadd("STARSHIP_CACHE", nyagos.getenv("STARSHIP_CACHE") or starship_cache)

-- nyagos envs
nyagos.envadd("NYAGOS_CONFIG", (home .. path_sep .. ".nyagos"))

-- workspace, win_home and obsidian
-- TODO: settings

local workspace_path = ""
local win_home_path = ""
local obsidian_dailynotes_path = ""

nyagos.envadd("WORKSPACE", workspace_path)
nyagos.envadd("WIN_HOME", win_home_path)
nyagos.envadd("obsidian", nyagos.getenv("WIN_HOME") .. obsidian_dailynotes_path)
nyagos.envadd("windl", win_home_path .. "Downloads")
nyagos.envadd("WIN_DESKTOP", win_home_path .. "Desktop")
nyagos.envadd("WIN_DOCUMENTS", win_home_path .. "Documents")
nyagos.envadd("obsidian_vault_path", obsidian_dailynotes_path:format("001_dailyNotes", ""))

-- set PATHs
local cargo_path = home .. path_sep .. ".cargo"
local deno_path = home .. path_sep .. ".deno"

-- Windows and Linux tools
nyagos.envadd("PATH", cargo_path .. path_sep .. "bin")

-- TODO: settings
-- Linux tools
if is_linux then
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
        deno_path .. path_sep .. "bin",
        dot_local .. path_sep .. "bin",
        home .. path_sep .. "go" .. path_sep .. "bin",
        home .. path_sep .. ".npm-global" .. path_sep .. "bin",
        home .. path_sep .. ".gem" .. path_sep .. "ruby" .. path_sep .. "2.7.0" .. path_sep .. "bin",
        home .. path_sep .. "depot_tools",
        home .. path_sep .. ".fzf" .. path_sep .. "bin",
        home .. path_sep .. ".dotnet" .. path_sep .. "tools"
    )
end

-- neovim vars
local windows_nvim_config = home .. path_sep .. "AppData" .. path_sep .. "Local" .. path_sep .. "nvim"
local linux_nvim_config = xdg_config_home .. path_sep .. "nvim"
local nvim_config = is_windows and windows_nvim_config or linux_nvim_config
nyagos.envadd("EDITOR", nyagos.getenv("EDITOR") or "nvim")
nyagos.envadd("NVIM_APPNAME", nyagos.getenv("NVIM_APPNAME") or "nvim")
nyagos.envadd("NVIM_CONFIG", nyagos.getenv("NVIM_CONFIG") or nvim_config)

-- Bun
nyagos.envadd("BUN_INSTALL", nyagos.getenv("BUN_INSTALL") or (home .. path_sep .. ".bun"))
nyagos.envadd("PATH", nyagos.getenv("BUN_INSTALL") .. path_sep .. "bin")

-- fly.io
nyagos.envadd("FLYCTL_INSTALL", nyagos.getenv("FLYCTL_INSTALL") or (home .. path_sep .. ".fly"))
nyagos.envadd("PATH", nyagos.getenv("FLYCTL_INSTALL") .. path_sep .. "bin")

-- pnpm
local pnpm_home = xdg_config_home .. path_sep .. "pnpm"
nyagos.envadd("PNPM_HOME", nyagos.getenv("PNPM_HOME") or pnpm_home)
nyagos.envadd("PATH", nyagos.getenv("PNPM_HOME"))

if is_not_human_rights then
    local java_home = xdg_cache_home
        .. path_sep
        .. "coursier"
        .. path_sep
        .. "arc"
        .. path_sep
        .. "https"
        .. path_sep
        .. "github.com"
        .. path_sep
        .. "AdoptOpenJDK"
        .. path_sep
        .. "openjdk8-binaries"
        .. path_sep
        .. "releases"
        .. path_sep
        .. "download"
        .. path_sep
        .. "jdk8u292-b10"
        .. path_sep
        .. "OpenJDK8U-jdk_x64_linux_hotspot_8u292b10.tar.gz"
        .. path_sep
        .. "jdk8u292-b10"
    -- JVM path
    nyagos.envadd("JAVA_HOME", nyagos.getenv("JAVA_HOME") or java_home)
    nyagos.envadd("PATH", nyagos.getenv("JAVA_HOME") .. "bin")

    -- coursier path
    local coursier_path = xdg_data_home .. path_sep .. "coursier" .. path_sep .. "bin"
    nyagos.envadd("PATH", coursier_path)
    -- # windowsのpathとかぶる問題防止
    nyagos.alias.cs = coursier_path .. "bin"
end

-- cabal config
nyagos.envadd("PATH", home .. path_sep .. ".cabal" .. path_sep .. "bin")
nyagos.envadd("PATH", home .. path_sep .. ".ghcup" .. path_sep .. "bin")

-- wsl2-ssh-agent
nyagos.envadd(
    "SSH_AUTH_SOCK",
    nyagos.getenv("SSH_AUTH_SOCK") or (home .. path_sep .. ".ssh" .. path_sep .. "wsl2-ssh-agent.sock")
)

-- https://github.com/antfu/ni config
nyagos.envadd(
    "NI_CONFIG_FILE",
    nyagos.getenv("NI_CONFIG_FILE") or (xdg_config_home .. path_sep .. "ni" .. path_sep .. ".nirc")
)

-- codon config
nyagos.envadd("PATH", home .. path_sep .. ".codon" .. path_sep .. "bin")

-- Rye
nyagos.envadd("PATH", home .. path_sep .. ".rye" .. path_sep .. "shims")

-- rtx PATHs
nyagos.envadd("RTX_DATA_DIR", nyagos.getenv("RTX_DATA_DIR") or (home .. path_sep .. ".rtx"))
nyagos.envadd("RTX_CACHE_DIR", nyagos.getenv("RTX_DATA_DIR") .. path_sep .. "cache")

-- luarocks
nyagos.envadd("PATH", home .. path_sep .. ".luarocks" .. path_sep .. "bin")
nyagos.envadd(
    "LUA_PATH",
    "/usr/local/share/lua/5.3/?.lua",
    "/usr/local/share/lua/5.3/?/init.lua",
    "/usr/local/lib/lua/5.3/?.lua",
    "/usr/local/lib/lua/5.3/?/init.lua",
    "./?.lua",
    "./?/init.lua",
    home .. ".luarocks/share/lua/5.3/?.lua",
    home .. ".luarocks/share/lua/5.3/?/init.lua"
)
nyagos.envadd(
    "LUA_CPATH",
    "/usr/local/lib/lua/5.3/?.so",
    "/usr/local/lib/lua/5.3/loadall.so",
    "./?.so",
    "$HOME/.luarocks/lib/lua/5.3/?.so"
)

if is_linux then
    -- asdf
    local asdf_dir = home .. path_sep .. ".asdf"
    local asdf_bin = asdf_dir .. path_sep .. "bin"
    local asdf_shims = asdf_dir .. path_sep .. "shims"
    nyagos.envadd("PATH", asdf_bin, asdf_shims)
    nyagos.envadd("ASDF_DIR", nyagos.getenv("ASDF_DIR") or asdf_dir)
    nyagos.envadd("ASDF_DATA_DIR", nyagos.getenv("ASDF_DATA_DIR") or asdf_dir)
    nyagos.envadd("ASDF_CONFIG_FILE", nyagos.getenv("ASDF_CONFIG_FILE") or home .. path_sep .. ".asdfrc")
end

-- aqua
nyagos.envadd("AQUA_ROOT_DIR", nyagos.getenv("AQUA_ROOT_DIR") or xdg_data_home .. path_sep .. "aquaproj-aqua")
nyagos.envadd("PATH", nyagos.getenv("AQUA_ROOT_DIR") .. path_sep .. "bin")
