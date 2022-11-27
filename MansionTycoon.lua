getgenv().OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

---------------------Player Variables-------------
getgenv().plr_money = nil
getgenv().plr_local = game.Players.LocalPlayer
getgenv().plr_team = nil

getgenv().plr_list = {}
-------------------Activating---------------------
getgenv().AutoBuyStat = false
getgenv().AutoGrabStat = false
--------------------------------------------------
for _, team in pairs(game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons:GetDescendants()) do
    if team.Name == "Owner" then
        if tostring(team.Value) == getgenv().plr_local.Name then
            getgenv().plr_team = team.Parent
        end
    end
end

function AutoBuy()
    while getgenv().AutoBuyStat do
        for _, tobuy in pairs(getgenv().plr_team.Buttons:GetDescendants()) do
            getgenv().plr_money = getgenv().plr_local.leaderstats.Cash.Value
            if tobuy.Name == "TouchInterest" and tobuy.Parent.Name == "Head" and tobuy.Parent.Parent.Price.Value <= getgenv().plr_money then
                firetouchinterest(getgenv().plr_local.Character.HumanoidRootPart, tobuy.Parent, 0)
                wait(0.1)
                firetouchinterest(getgenv().plr_local.Character.HumanoidRootPart, tobuy.Parent, 1)
            end
        end
        if not getgenv().AutoBuyStat then break end
        wait(0.7)
    end
end

function AutoGrabMoney()
    while getgenv().AutoGrabStat do
        getgenv().a = game.Players.LocalPlayer.Character.HumanoidRootPart
        getgenv().b = getgenv().plr_team.Essentials.Giver
        firetouchinterest(getgenv().a, getgenv().b, 0)
        wait(0.4)
        firetouchinterest(getgenv().a, getgenv().b, 1)
        if not getgenv().AutoGrabStat then break end
    end
end

getgenv().Window = getgenv().OrionLib:MakeWindow({Name = "Mega Mansion Tycoon", HidePremium = true, SaveConfig = false, ConfigFolder = "OrionTest", Icon = "11572309822", IntroIcon = "rbxassetid://11572309822", IntroText = "TeoWare"})

getgenv().Tab = getgenv().Window:MakeTab({
	Name = "Main",
	Icon = "11572309822",
	PremiumOnly = false
})

getgenv().Tab:AddToggle({
	Name = "Auto-Money",
	Default = false,
	Callback = function(apum)
		if apum then
            getgenv().AutoGrabStat = true
            AutoGrabMoney()
        else
            getgenv().AutoGrabStat = false
        end
	end    
})

Tab:AddToggle({
	Name = "Auto Buy",
	Default = false,
	Callback = function(AbR)
		if AbR then
            getgenv().AutoBuyStat = true
            AutoBuy()
        else
            getgenv().AutoBuyStat = false
        end
	end    
})

Tab:AddSlider({
	Name = "WalkSpeed",
	Min = 10,
	Max = 500,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(Vjj)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Vjj
	end    
})
