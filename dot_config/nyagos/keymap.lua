-- nyagos keymap
--[[
nyagos.key.C_G = function()
    cd $(ghq list -p | fzf)
end
]]
