-- cobble hills UI (Urban Reload Exploit)
local Players = game:GetService("Players")
local Config = getgenv().CobbleConfig
if not Config then return end

local SU = "https://raw.githubusercontent.com/PulseZax/Slate/refs/heads/main/.lua"
local ok, S = pcall(function() return loadstring(game:HttpGet(SU), "@Slate")() end)
if not ok or not S then return end

S.Theme.Preset("Violet")
S.Theme.Set({
    Background = Color3.fromRGB(10, 10, 12), Surface = Color3.fromRGB(20, 20, 24),
    SurfaceAlt = Color3.fromRGB(30, 30, 36), Elevated = Color3.fromRGB(40, 40, 48),
    Accent = Color3.fromRGB(0, 255, 150), ToggleOn = Color3.fromRGB(0, 255, 150),
    Text = Color3.fromRGB(240, 240, 245), Muted = Color3.fromRGB(150, 150, 160),
    Radius = 12, RowHeight = 42, HeaderHeight = 56,
})
pcall(function() S:SetFontFamily("Montserrat") end)

local Window = S:CreateWindow({
    Name = "COBBLE <font color='#00FF96'>EXPLOIT</font>",
    Subtitle = "URBAN RELOAD",
    Icon = "shield", Logo = true,
    Size = UDim2.fromOffset(480, 400),
    ToggleKey = Enum.KeyCode.Insert,
    Backdrop = "aurora",
})

-- ABA 1: EXPLOITS
local tabExp = Window:CreateTab({ Name = "EXPLOITS", Icon = "zap" })
tabExp:SetColumns(2)

local secCash = tabExp:CreateSection({ Name = "Dinheiro (Server-Sided)" })
secCash:Button({ Name = "Dar $100.000", Icon = "dollar-sign", Callback = function() getgenv().Cobble_AddCash(100000) end })
secCash:Button({ Name = "Setar Level / Money Local", Icon = "user", Callback = function() getgenv().Cobble_SetLevel(999) end })

local secWep = tabExp:CreateSection({ Name = "Armas" })
secWep:Button({ Name = "Dar Todas as Armas", Icon = "crosshair", Callback = function() getgenv().Cobble_GiveAllWeapons() end })
secWep:Button({ Name = "AdminCommand: 'give'", Icon = "shield", Callback = function() getgenv().Cobble_AdminCommand("give AK47") end })

-- ABA 2: AIMBOT
local tabCombat = Window:CreateTab({ Name = "AIMBOT", Icon = "crosshair" })
tabCombat:SetColumns(2)

local secAim = tabCombat:CreateSection({ Name = "Aimbot Settings" })
secAim:Toggle({ Name = "Ativar Aimbot", Default = true, Callback = function(v) Config.Aimbot.Enabled = v end })
secAim:Toggle({ Name = "Wall Check (Só visível)", Default = true, Callback = function(v) Config.Aimbot.WallCheck = v end })
secAim:Toggle({ Name = "Team Check", Default = true, Callback = function(v) Config.Aimbot.TeamCheck = v end })
secAim:Dropdown({ Name = "Parte do Corpo", Options = {"Head", "Torso"}, Default = "Head", Callback = function(v) Config.Aimbot.Part = v end })
secAim:Slider({ Name = "FOV", Min = 20, Max = 400, Default = 120, Callback = function(v) Config.Aimbot.FOV = v end })
secAim:Slider({ Name = "Suavidade", Min = 0.15, Max = 1.0, Default = 0.25, Callback = function(v) Config.Aimbot.Smooth = v end })

-- ABA 3: ESP
local tabVisuals = Window:CreateTab({ Name = "ESP & VISUAL", Icon = "eye" })
tabVisuals:SetColumns(2)

local secEsp = tabVisuals:CreateSection({ Name = "ESP Jogadores" })
secEsp:Toggle({ Name = "Ativar ESP", Default = true, Callback = function(v) Config.ESP.Enabled = v end })
secEsp:Toggle({ Name = "Caixa (Box)", Default = true, Callback = function(v) Config.ESP.Box = v end })
secEsp:Toggle({ Name = "Barra de Vida", Default = true, Callback = function(v) Config.ESP.Health = v end })
secEsp:Toggle({ Name = "Nome", Default = true, Callback = function(v) Config.ESP.Name = v end })
secEsp:Toggle({ Name = "Distância", Default = true, Callback = function(v) Config.ESP.Distance = v end })
secEsp:Toggle({ Name = "Tracer", Default = true, Callback = function(v) Config.ESP.Tracer = v end })
secEsp:Toggle({ Name = "Wall Check Color", Default = true, Callback = function(v) Config.ESP.VisibleCheck = v end })
secEsp:Slider({ Name = "Distância Max", Min = 100, Max = 3000, Default = 1200, Callback = function(v) Config.ESP.MaxDist = v end })

local secLuz = tabVisuals:CreateSection({ Name = "Luz e Câmera" })
secLuz:Toggle({ Name = "Fullbright", Default = true, Callback = function(v) Config.Visuals.Fullbright = v end })
secLuz:Toggle({ Name = "Remover Neblina", Default = true, Callback = function(v) Config.Visuals.NoFog = v end })
secLuz:Slider({ Name = "Camera FOV", Min = 60, Max = 120, Default = 80, Callback = function(v) Config.Visuals.FOV = v end })

-- ABA 4: CONFIG
local tabConfig = Window:CreateTab({ Name = "CONFIG", Icon = "settings" })
tabConfig:SetColumns(1)
local secMove = tabConfig:CreateSection({ Name = "Movimento" })
secMove:Toggle({ Name = "Speed Hack (Leve)", Default = false, Callback = function(v) Config.Movement.SpeedEnabled = v end })
secMove:Slider({ Name = "Velocidade", Min = 16, Max = 30, Default = 22, Callback = function(v) Config.Movement.SpeedValue = v end })
secMove:Paragraph({ Name = "Aviso", Text = "O Speed alto dá rubberband." })

tabConfig:CreateSection({ Name = "Sessão" }):Button({ Name = "UNLOAD SCRIPT", Icon = "trash-2", Callback = function()
    if getgenv().Cobble_Unload then getgenv().Cobble_Unload() end
    Window:Destroy(); S:Destroy(); S.Cleanup()
end })

getgenv().Cobble_UI_Loaded = Window
