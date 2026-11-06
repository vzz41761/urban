-- cobble hills loader (Urban Exploit)
local baseUrl = "https://raw.githubusercontent.com/vzz41761/urban/main/" 
-- ⚠️ MUDE O "vzz41761" SE O SEU USUÁRIO FOR OUTRO ⚠️

if getgenv().Cobble_Unload then 
    pcall(getgenv().Cobble_Unload) 
end

local function loadFile(name)
    local success, err = pcall(function()
        local src = game:HttpGet(baseUrl .. name, true)
        if not src or src == "" or src:find("404: Not Found") then
            error("Não foi possível baixar o arquivo (link 404 ou vazio).")
        end
        local fn, compileErr = loadstring(src)
        if not fn then
            error("Erro de sintaxe no arquivo: " .. tostring(compileErr))
        end
        fn()
    end)
    
    if not success then
        warn("[cobble] Erro no " .. name .. ": " .. tostring(err))
    end
end

loadFile("Logic.lua")
task.wait(0.5)
loadFile("UI.lua")
