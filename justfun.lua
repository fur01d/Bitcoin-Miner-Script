print("-------------------------")

function GetPlayerInfo(plr_name)
    print("Target Name - " .. plr_name .. " || Gold - " .. game.Players[plr_name].Data.Gold.Value)
    for i, v in pairs(game.Players[plr_name].OtherData:GetChildren()) do
        if string.sub(v.Name, 1, 1) == "N" then
            if v.Value == "" then
            else
                print(v.Value)
            end
        end
    end
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lolpoppyus/Roblox-Lua/master/Pop%20UI%20Lib", true))()

local ui = library:Tab("Funny :|")

local update = ui:Dropdown("Target - ", {},function(arg)
    GetPlayerInfo(arg)
end)


while wait(1) do
    local players = game.Players:GetChildren()
    local array = {}

    for i,v in pairs(players) do
        table.insert(array,v.Name)
    end

    update(array)
end;
