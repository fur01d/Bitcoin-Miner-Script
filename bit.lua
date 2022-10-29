local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Bitcoin Miner ⛏️", "BloodTheme")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Credits to: Te0#3006")


local AutoAlgoStat = false
local alr1 = false
local AutoClaimStarStat = false
local alr2 = false
local AutoExchangeStat = false
local alr3 = false
local valueEx = 0

Section:NewToggle("Auto Algorithms", ":)", function(alg)
    if alg then
        AutoAlgoStat = true
        if not alr1 then
            AutoAlgo()
            alr1 = true
        end
    else
        AutoAlgoStat = false
    end
end)

Section:NewToggle("Auto Star Claim", ":В", function(alg1)
    if alg1 then
        AutoClaimStarStat = true
        if not alr2 then
            AutoClaimStar()
            alr2 = true
        end
    else
        AutoClaimStarStat = false
    end
end)

Section:NewToggle("Auto Exchange", ":D", function(alg3)
    if alg3 then
        AutoExchangeStat = true
        if not alr3 then
            AutoExchange()
            alr3 = true
        end
    else
        AutoExchangeStat = false
    end
end)

Section:NewTextBox("Value of BTC", ":3", function(txt)
	valueEx = tonumber(txt)
end)

Section:NewSlider("WalkSpeed", "UwU", 500, 0, function(sz)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = sz
end)

function AutoAlgo()
   while AutoAlgoStat do
    
    local SHA512_T = game:GetService("Players").LocalPlayer.PlayerGui.NewUi.UiButtons.SubButtonsContainer.SubButtonsMenu.Algorithms.AlgStore["1SHA-512"].Rate.Text

    local SCRYPT_T = game:GetService("Players").LocalPlayer.PlayerGui.NewUi.UiButtons.SubButtonsContainer.SubButtonsMenu.Algorithms.AlgStore["3Scrypt"].Rate.Text

    local DAGGER_T = game:GetService("Players").LocalPlayer.PlayerGui.NewUi.UiButtons.SubButtonsContainer.SubButtonsMenu.Algorithms.AlgStore["2Dagger"].Rate.Text

    local BLOXCHAIN_T = game:GetService("Players").LocalPlayer.PlayerGui.NewUi.UiButtons.SubButtonsContainer.SubButtonsMenu.Algorithms.AlgStore["4BloxChain"].Rate.Text

    local Algorithms = {SHA512_T:gsub("x", ""), DAGGER_T:gsub("x", ""), SCRYPT_T:gsub("x", ""), BLOXCHAIN_T:gsub("x", "")}

    local result1 = null
    local result2 = null
    local finishResult = null
    ---------------------------------------------------

    if Algorithms[1] > Algorithms[2] then
        result1 = Algorithms[1]
    else
        result1 = Algorithms[2]
    end

    if Algorithms[3] > Algorithms[4] then
        result2 = Algorithms[3]
    else
        result2 = Algorithms[4]
    end

    if result1 > result2 then
        finishResult = result1
    else
        finishResult = result2
    end

    ---------------------------------------------------

    if finishResult == Algorithms[1] then
        local A_1 = 1
        local Event = game:GetService("ReplicatedStorage").Events.AlgoChang
        Event:FireServer(A_1)
    end

    if finishResult == Algorithms[2] then
        local A_11 = 2
        local Event = game:GetService("ReplicatedStorage").Events.AlgoChang
        Event:FireServer(A_11)
    end

    if finishResult == Algorithms[3] then
        local A_111 = 3
        local Event = game:GetService("ReplicatedStorage").Events.AlgoChang
        Event:FireServer(A_111)
    end

    if finishResult == Algorithms[4] then
        local A_0 = 4
        local Event = game:GetService("ReplicatedStorage").Events.AlgoChang
        Event:FireServer(A_0)
    end
    wait(10)
    end 
---------------------------------------------------
end

function AutoClaimStar()
    while AutoClaimStarStat do
        local FireFuckingStar = game:GetService("ReplicatedStorage").Events.ClaimFreeBoostStar
        FireFuckingStar:FireServer()
        wait(5)
    end
end

function AutoExchange()
    while AutoExchangeStat do
        if game.Players.LocalPlayer.leaderstats.BitCoins.value >= valueEx then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(246.765732, 6.09897375, 86.0331879, 0.00319123617, 1.13998375e-07, -0.999994934, 2.67654676e-09, 1, 1.14007499e-07, 0.999994934, -3.04035797e-09, 0.00319123617)
            local Event = game:GetService("ReplicatedStorage").Events.ExchangeMoney
            Event:FireServer(true)
        end
        wait(1)
    end
end

wait(5)
print(valueEx)