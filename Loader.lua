-- cobble hills loader (Blindado)
local baseUrl = "https://raw.githubusercontent.com/vzz41761/urban/main/"
-- ⚠️ MUDE O "vzz41761" SE O SEU USUÁRIO FOR OUTRO ⚠️

if getgenv().Cobble_Unload then pcall(getgenv().Cobble_Unload) end

local function loadFile(name)
    print("[cobble] Baixando " .. name .. "...")
    local ok, src = pcall(function() return game:HttpGet(baseUrl .. name, true) end)
    
    if not ok or not src then
        return warn("[cobble] Erro de conexão ao baixar " .. name)
    end
    
    if src:find("404: Not Found") or src:find("<!DOCTYPE html>") then
        return warn("[cobble] Arquivo " .. name .. " não encontrado no GitHub! Verifique a URL.")
    end

    local func, err = loadstring(src)
    if not func then
        return warn("[cobble] Erro de sintaxe no " .. name .. ": " .. tostring(err))
    end
    
    pcall(func)
end

loadFile("Logic.lua")
task.wait(0.5)
loadFile("UI.lua")
