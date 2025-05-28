---@type DataboxConfig
local opts = {
    -- TODO: my privkey set
    --private_key = "~/.config/age/keys.txt",
    -- TODO: my pubkey set
    --public_key = "age1example...",
    encryption_cmd = "rage -e -r %s",
    decryption_cmd = "rage -d -i %s",
}

---@type boolean
local cond = require("config.global").is_linux
cond = false

---@type LazySpec
local spec = {
    "chrisgve/databox.nvim",
    lazy = false,
    opts = opts,
    cond = cond,
    enabled = cond,
}

return spec
