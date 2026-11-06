-- cobble hills loader (Urban Exploit)
-- ⚠️ Se o seu usuário do GitHub NÃO for "vzz41761", troque abaixo! ⚠️
local baseUrl = "https://raw.githubusercontent.com/vzz41761/urban/main/"

if getgenv().Cobble_Unload then 
    pcall(getgenv().Cobble_Unload) 
end

local function loadFile(name)
    local success, err = pcall(function()
        loadstring(game:HttpGet(baseUrl .. name, true))()
    end)
    if not success then
        warn("[cobble] Erro ao carregar " .. name .. ": " .. tostring(err))
    end
end

loadFile("Logic.lua")
task.wait(0.5)
loadFile("UI.lua")
