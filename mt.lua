-- Variables 
local plr = game.Players.LocalPlayer
local char = plr.Character
local hum_plr = char.HumanoidRootPart
local plr_base = nil

local needed_to_collect = 30000
-- stats 
local CC_Stat
local AB_Stat
local AR_Stat

 -- Functions
 function DetectBase()
    for _, v in pairs(game:GetService("Workspace").PlayerTycoons:GetChildren()) do
        if tostring(v.TycoonVals.Owner.Value) == plr.Name then
            plr_base = v
        end
    end
end

function TpToCashCollect()
    local cash_collector = plr_base.Essentials.Giver.CollectButton
    while CC_Stat do
        local text_amount = plr_base.Essentials.Giver.CollectScreen.SurfaceGui.Frame.Amount.Text
        wait()
        if tonumber(text_amount:sub(2)) >= needed_to_collect then
            hum_plr.CFrame = cash_collector.CFrame
            firetouchinterest(hum_plr,plr_base.Essentials.Giver.CollectButton, 0) ; wait()
            firetouchinterest(hum_plr,plr_base.Essentials.Giver.CollectButton, 1)
        else
            print("Now its " .. text_amount .. " | NTG - " .. needed_to_collect)
        end
        if not CC_Stat then break end
    end
end

function AutoBuyFunction()
    while AB_Stat do
        for _, button in pairs(plr_base.Buttons:GetChildren()) do
            if tostring(button.Button.BrickColor) == "Sea green" then
                firetouchinterest(hum_plr, button.Button, 0)
                firetouchinterest(hum_plr, button.Button, 1)
                wait()
            end 
        end
        if not AB_Stat then break end
        wait(0.5)
    end
end

function AutoRebirth()
    while AR_Stat do
        local reb_text = plr.PlayerGui.Rebirth.Rebirth.BarFrame.TextLabel ; local a = text:sub(18) ; local b = tonumber(a:sub(1,-2))
        if b == 100 then
            
        end
        if not AR_Stat then break end
        wait(5)
    end
end

-- Ui Library
local Lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Lib:CreateWindow({
    Name = "Military Tycoon",
    LoadingTitle = "Military Tycoon | Hub",
    LoadingSubtitle = "by Teo",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "MTycoonWare"
    },
    Discord = {
       Enabled = false,
       Invite = "https://discord.gg/tBjnUgeuve",
       RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
       Title = "TeoHub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/teoware)",
       FileName = "Military Tycoon",
       SaveKey = true,
       GrabKeyFromSite = true,
       Key = "hello"
    }})
 local MainTab = Window:CreateTab("Main", 4483362458)
 local MfLabel = MainTab:CreateLabel("Automatically collects money from cash collector. ⬇ Set Require number to collect.")
 local MoneyFarmToogle = MainTab:CreateToggle({
    Name = "Auto Collect",
    CurrentValue = false,
    Flag = "MFFlag",
    Callback = function(mff)
        if mff then
            CC_Stat = true
            TpToCashCollect()
        else
            CC_Stat = false
        end
    end,
 })
 local MtsSlider = MainTab:CreateSlider({   
    Name = "Required amount",
    Range = {0, 1000000},
    Increment = 1000,
    Suffix = "$",
    CurrentValue = 20000,
    Flag = "MTSFlag",
    Callback = function(ntg)
        needed_to_collect = ntg
    end,
 })
 local ABLabel = MainTab:CreateLabel("Automatically presses buttons.")
local AutoBuyToogle = MainTab:CreateToggle({
    Name = "Auto Buy",
    CurrentValue = false,
    Flag = "ABFlag",
    Callback = function(abf)
        if abf then
            AB_Stat = true
            AutoBuyFunction()
        else
            AB_Stat = false
        end
    end,
 })
 local REBLabel = MainTab:CreateLabel("Automatically rebirths your base.")
 local RebToogle = MainTab:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Flag = "ARlag",
    Callback = function(ar)
        if ar then
            AR_Stat = true
            AutoRebirth()
        else
            AR_Stat = false
        end
    end,
 })

 DetectBase()
