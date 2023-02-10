local AllRockets = 4
local CurrentRockets = 0

local codename = nil
local myname = nil
local targetname = nil
local player_list = {}
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()
local Namewindow = library:Window("Позывные")
local ShooterWindow = library:Window("Команды за стрелка")
local TowerWindow = library:Window("Команды за наводчика")

function GetPlayers()
    while true do
        for i, v in pairs(game.Players:GetChildren()) do
            table.insert(player_list, v.Name)
            wait(1)
        end
        wait(1)
    end
end

function StartRocket()
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(codename .. ", " .. myname .. ", Принял, атакую цель!","All") ; wait(2)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Три... Два... Один!","All") ; wait(3) ; CurrentRockets = CurrentRockets + 1
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("ПУСК!! (Потратил "..CurrentRockets.."/"..AllRockets..")","All")
    wait(1)
    if CurrentRockets == AllRockets then
        wait(4)
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Боезапас отстрелял!","All") ; wait(0.5)
        CurrentRockets = 0
        print("Nieolowsfs")
    end
end

function SucCoord(player)
    for i, v in pairs(game.Players:GetChildren()) do
        if v.Name == player then
            local first = (math.floor(v.Character.HumanoidRootPart.Position.X))
            local second = (math.floor(v.Character.HumanoidRootPart.Position.Y))
            local third = (math.floor(v.Character.HumanoidRootPart.Position.Z))
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(codename .. ", " .. myname .. ", подтверждаю цель!","All") ; wait(1)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v.Name..", X "..first..", Y ".. second ..", Z ".. third,"All")
        end
    end
end


function GetCoord()
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(codename .. ", " .. myname .. ", Запрашиваю цель!","All")
end

Namewindow:Box("Разведка -", function(texttower, focuslost)
    if focuslost then
    codename = texttower
    end
 end)

 Namewindow:Box("Стрелок -", function(textshooter, focuslost)
    if focuslost then
    myname = textshooter
    end
 end)

 Namewindow:Box("Цель -", function(texttarget, focuslost)
    if focuslost then
    targetname = texttarget
    end
 end)

 ShooterWindow:Box("Боезапас -", function(ammo, focuslost)
    if focuslost then
     AllRockets = tonumber(ammo)
    end
 end)

 ShooterWindow:Button("Запросить цель", function()
    GetCoord()
 end)

 ShooterWindow:Button("Подтвердить координаты", function()
    SucCoord(targetname)
 end)

 ShooterWindow:Button("Атаковать цель", function()
    StartRocket()
 end)

 TowerWindow:Button("Дать цель", function()
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(myname .. ", " .. codename ..", Цель - " ..targetname,"All") ; wait(1)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Высылаю координаты...","All")
 end)

 TowerWindow:Button("Координаты верны", function()
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(myname .. ", " .. codename ..", Координаты подтверждаю!","All") ; wait(2)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Огонь по готовности.","All")
 end)
