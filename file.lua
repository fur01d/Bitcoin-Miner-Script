local FarmStat = false -- Status of UI Lib
local CheckDetector = {} -- Table for DarknessPart's
local chest = CFrame.new() -- Final Chest CFrame

-- UI Lib
local Lib = loadstring(game:HttpGet("https://pastebin.com/raw/GCM3Zpzg",true))()
local Table = {}
local window = Lib:CreateWindow("Nice")
window:Section("Section")

local plr_char = game.Players.LocalPlayer.Character -- LocalPlayer Character

for _, v in pairs(line:GetDescendants()) do -- Get Elements for spawn
    if v.Name == "DarknessPart" then -- Darkness part - black thing between stages in game
        if v.Parent == "lo" then
            --appe
        end -- append part element to table
    end
end

function Farm()
    while FarmStat do
        for i = 1, #CheckDetector do
            plr_char.HumanoidRootPart.CFrame = CheckDetector[i].CFrame  -- Teleport plr.HumanoidRootPart to table[index]
            wait()
        end
    if not FarmStat then break end -- if staus = false then break cicle 
    end
end

Farm() -- Calling Funciton 

-- https://v3rmillion.net/showthread.php?tid=1046594 -- ui lib
