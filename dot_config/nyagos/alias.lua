local global = require("global")
local home = global.home
local is_linux = global.is_linux
local path_sep = global.path_sep

-- alias
if is_linux then
    nyagos.alias.f = "fuck"
    nyagos.alias.rm = "gomi"
    nyagos.alias.rm = "rm -i"
    nyagos.alias.mkdir = "mkdir -p"
    nyagos.alias.untar = "tar xvf"
    nyagos.alias.pueued_enable = "systemctl --user enable pueue"
    nyagos.alias.pueued_start = "systemctl --user start pueue"
    nyagos.alias.pueued_restart = "systemctl --user restart pueue"
    nyagos.alias.patch = "patch -p1 <"
    nyagos.alias.imgcat = "wezterm imgcat"
    nyagos.alias.pip = "python3 -m pip"
    nyagos.alias.pipx = "python3 -m pipx"
    nyagos.alias.open = "wsl-open"
    nyagos.alias.zel = "zellij"
    nyagos.alias.pueuexec = "pueue add --"

    -- asdf
    local asdf_dir = home .. path_sep .. ".asdf"
    local asdf_bin = asdf_dir .. path_sep .. "bin"
    local asdf_shims = asdf_dir .. path_sep .. "shims"
    nyagos.envadd("PATH", asdf_bin, asdf_shims)
    nyagos.envadd("ASDF_DIR", nyagos.getenv("ASDF_DIR") or asdf_dir)
    nyagos.envadd("ASDF_DATA_DIR", nyagos.getenv("ASDF_DATA_DIR") or asdf_dir)
    nyagos.envadd("ASDF_CONFIG_FILE", nyagos.getenv("ASDF_CONFIG_FILE") or home .. path_sep .. ".asdfrc")

    -- vim alias
    local paleovim = asdf_shims .. path_sep .. "vim"
    nyagos.alias.paleovim = paleovim
    nyagos.alias.pvim = paleovim
    local neovim = asdf_shims .. path_sep .. "nvim"
    nyagos.alias.neovim = neovim
    nyagos.alias.vim = neovim
end

-- alias eza
nyagos.alias.ls = "eza"
nyagos.alias.ll = "ls -l"
nyagos.alias.la = "ls -la"
nyagos.alias.l1 = "ls -1"
nyagos.alias.lt = "ls --tree"
nyagos.alias.lat = "ls -l -a --tree"
nyagos.alias.lta = "ls --tree -a"
