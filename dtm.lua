local Lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local als1 = false

local Window = Lib:MakeWindow({Name = "NameGame", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroEnabled = true, IntroText = "Teoware", IntroIcon = "https://www.roblox.com/library/11572309822/xax"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

function BigHead()
	for _, plrs in pairs(game:GetService("Workspace"):GetPlayers()) do
		local plrHead = plrs.Character.Head
		plrHead.Size = Vector3.new(14,14,14)
		plrHead.CanCollide = false
		plrHead.Transprency = 0.5
		
	end
end


Tab:AddToggle({
	Name = "This is a toggle!",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})

Tab:AddToggle({
	Name = "Big Head Mode",
	Default = false,
	Callback = function(res_bh)
		if res_bh then
			BigHead()
		end
	end    
})







