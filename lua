function isnil(thing)
	return (thing == nil)
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	for i,v in pairs(game:GetService'Players':GetChildren()) do
		pcall(function()
			if not isnil(v.Character) then
				if ESPPlayer then
					if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Character.Head)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Character.Head
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Team == game.Players.LocalPlayer.Team then
							name.TextColor3 = Color3.fromRGB(205, 84, 75)
						else
							name.TextColor3 = Color3.fromRGB(123, 182, 232)
						end
					else
						v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
					end
				else
					if v.Character.Head:FindFirstChild('NameEsp'..Number) then
						v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateDevilFruit()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		pcall(function()
			if string.find(v.Name, "Fruit") then
				if DevilESP then
					if string.find(v.Name, "Fruit") then
						if not v.Handle:FindFirstChild("DevilESP"..Number) then
							local Bb = Instance.new("BillboardGui", v.Handle)
							Bb.Name = "DevilESP"..Number
							Bb.ExtentsOffset = Vector3.new(0, 1, 0)
							Bb.Size = UDim2.new(1, 200, 1, 30)
							Bb.Adornee = v.Handle
							Bb.AlwaysOnTop = true
							local Textlb = Instance.new("TextLabel", Bb)
							Textlb.Font = "GothamBold"
							Textlb.FontSize = "Size14"
							Textlb.Size = UDim2.new(1,0,1,0)
							Textlb.BackgroundTransparency = 1
							Textlb.TextStrokeTransparency = 0.5
							Textlb.Text = v.Name.."\n"..math.round((v.Handle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m."
							Textlb.TextColor3 = Color3.new(255, 255, 255)
						else
							v.Handle["DevilESP"..Number].TextLabel.Text = v.Name.."\n"..math.round((v.Handle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m."
						end
					end
				else
					if v.Handle:FindFirstChild("DevilESP"..Number) then
						v.Handle:FindFirstChild("DevilESP"..Number):Destroy()
					end
				end
			end
		end)
	end
end

spawn(function()
    while wait() do
        if Killaura then
            for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    pcall(function()
                        repeat wait(.1)
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            v.Humanoid.Health = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.Transparency = 0.8
                        until not Killaura or v.Humanoid.Health <= 0
                    end)
                end
            end
        end
    end
end)


-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("T1m Hub", 5013109572,os.date())

-- first page
local page = venyx:addPage("Main", 13503612303)
local page2 = venyx:addPage("Cụt Tay ", 13580113543)
local page3 = venyx:addPage("Shop", 13511210587)
local page4 = venyx:addPage("Teleport", 13521231852)
local page5 = venyx:addPage("TempleOfTime", 13521284429)
local page6 = venyx:addPage("Other", 13520820684)

local Main = page:addSection("Main")
local Status = page:addSection("Status")
local Teams = page:addSection("Teams")
local Cuttay = page2:addSection("Cụt Tay Farm")
local Shop = page3:addSection("Fighting Shop")
local Abilities = page3:addSection("Abilities Shop")
local Fragments = page3:addSection("Fragment Shop")
local World = page4:addSection("World")
local island = page4:addSection("Island")
local Clock = page5:addSection("Temple Of Time")
local Trial = page5:addSection("Temple Of Time - Door")
local V4 = page5:addSection("Temple Of Time - Trial")
local Other = page6:addSection("Other")
local Other2 = page6:addSection("ESP")
local Other3 = page6:addSection("Haki")
local Other4 = page6:addSection("V4")

local VirtualUser = game:service'VirtualUser' -- anti kick(afk)
    game:service'Players'.LocalPlayer.Idled:connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
    print("make sure script work") --check in f9


Other:addKeybind("Keybind Turn ON/OFF", Enum.KeyCode.Period, function()
	venyx:toggle()
end, function()
end)

local Time = Main:addButton("Server Time")
spawn(function()
    while wait() do
        local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    Main:updateButton(Time, "Hour : "..(math.floor(GameTime / 3600) % 24).." Minute : "..(math.floor(GameTime / 60) % 60).." Second : "..(math.floor(GameTime) % 60))
    end
end)

V4:addToggle("Finish Trial - Mink",false,function(state)
	a = state
while a == true do wait()
	if game:GetService("Workspace").Map.MinkTrial then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3333, 11000, 16000, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	end
end
end)

V4:addToggle("Finish Trial - Human",false,function(b)
	Killaura = b
	_G.autoKen = b
end)
V4:addToggle("Finish Trial - Sky",false,function(state)
	c = state
while c == true do wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.SkyTrial.Model.FinishPart.CFrame
end
end)

V4:addToggle("Finish Trial - Cyborg",false,function(state)
	d = state
while d == true do wait()
    if game:GetService("Workspace").Map.CyborgTrial then
    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20010.4492, 10078.4736, -21.9602356, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    end
end
end)

V4:addToggle("Finish Trial - Ghoul ",false,function(b)
	Killaura = b
	_G.autoKen = b
end)

Noclip = false
island:addButton("Mansion", function(state) 
  local TweenService = game:GetService("TweenService")  
  TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
{CFrame = CFrame.new(-12549.7236, 341.781433, -7470.36328, 1, 0, 0, 0, 1, 0, 0, 0, 1)}):Play()
NoClip = state
					if NoClip == true then
						local LocalPlayerCharacter = game.Players.LocalPlayer.Character
						LocalPlayerCharacter.Head.CanCollide = false
						LocalPlayerCharacter.LowerTorso.CanCollide = false
						LocalPlayerCharacter.UpperTorso.CanCollide = false
						LocalPlayerCharacter.HumanoidRootPart.CanCollide = false
						if LocalPlayerCharacter:FindFirstChild("Badge") then
							LocalPlayerCharacter.Badge.CanCollide = false
						end
					end
end)

island:addButton("Sea Castle", function(state) 
	local TweenService = game:GetService("TweenService")  
	TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
  {CFrame = CFrame.new(-5015.54248, 314.515503, -3007.55444, -0.41003567, -2.46802507e-08, 0.912069499, -2.45137812e-08, 1, 1.60390474e-08, -0.912069499, -1.57816906e-08, -0.41003567)}):Play()
  NoClip = state
					if NoClip == true then
						local LocalPlayerCharacter = game.Players.LocalPlayer.Character
						LocalPlayerCharacter.Head.CanCollide = false
						LocalPlayerCharacter.LowerTorso.CanCollide = false
						LocalPlayerCharacter.UpperTorso.CanCollide = false
						LocalPlayerCharacter.HumanoidRootPart.CanCollide = false
						if LocalPlayerCharacter:FindFirstChild("Badge") then
							LocalPlayerCharacter.Badge.CanCollide = false
						end
					end
  end)

island:addButton("Port", function(state) 
	local TweenService = game:GetService("TweenService")  
	TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
  {CFrame = CFrame.new(-287.7612, 4.18141937, 5369.76367, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)}):Play()
  NoClip = state
					if NoClip == true then
						local LocalPlayerCharacter = game.Players.LocalPlayer.Character
						LocalPlayerCharacter.Head.CanCollide = false
						LocalPlayerCharacter.LowerTorso.CanCollide = false
						LocalPlayerCharacter.UpperTorso.CanCollide = false
						LocalPlayerCharacter.HumanoidRootPart.CanCollide = false
						if LocalPlayerCharacter:FindFirstChild("Badge") then
							LocalPlayerCharacter.Badge.CanCollide = false
						end
					end
  end)

island:addButton("Great Tree", function(state) 
	local TweenService = game:GetService("TweenService")  
	TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
  {CFrame = CFrame.new(2443.09326, 35.9496155, -6572.75439, 0.874622703, -0, -0.484804183, 0, 1, -0, 0.484804183, 0, 0.874622703)}):Play()
  NoClip = state
					if NoClip == true then
						local LocalPlayerCharacter = game.Players.LocalPlayer.Character
						LocalPlayerCharacter.Head.CanCollide = false
						LocalPlayerCharacter.LowerTorso.CanCollide = false
						LocalPlayerCharacter.UpperTorso.CanCollide = false
						LocalPlayerCharacter.HumanoidRootPart.CanCollide = false
						if LocalPlayerCharacter:FindFirstChild("Badge") then
							LocalPlayerCharacter.Badge.CanCollide = false
						end
					end
  end)
  
island:addButton("Sea Of Treats", function() 
	local TweenService = game:GetService("TweenService")  
	TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
  {CFrame = CFrame.new(-1937.6239, 36.6801338, -11923.749, -0.984812617, 0, -0.173621148, 0, 1, 0, 0.173621148, 0, -0.984812617)}):Play()
  NoClip = state
					if NoClip == true then
						local LocalPlayerCharacter = game.Players.LocalPlayer.Character
						LocalPlayerCharacter.Head.CanCollide = false
						LocalPlayerCharacter.LowerTorso.CanCollide = false
						LocalPlayerCharacter.UpperTorso.CanCollide = false
						LocalPlayerCharacter.HumanoidRootPart.CanCollide = false
						if LocalPlayerCharacter:FindFirstChild("Badge") then
							LocalPlayerCharacter.Badge.CanCollide = false
						end
					end
  end)

  local checkv4 = Status:addButton("")
  task.spawn(function()
    while task.wait() do
	pcall(function()
  if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("UpgradeRace","Check") == true then
	Status:updateButton(checkv4,"Trạng Thái : Cant Do Trial")
else
  Status:updateButton(checkv4,"Trạng Thái : Ready To Trial")
end
end)
end
end)

  
local checkpullLever = Status:addButton("")
task.spawn(function()
    while task.wait() do
	pcall(function()
if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") == true then
    Status:updateButton(checkpullLever,"Trạng Thái : Đã Gạt Cần")
else
    Status:updateButton(checkpullLever,"Trạng Thái : Chưa Gạt Cần")
end
end)
end
end)
  

local miraGe =  Status:addButton("")
if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
	Status:updateButton(miraGe,"Mirage Island : 🟢")
  else
	Status:updateButton(miraGe,"Mirage Island : 🔴")
  end
  game:GetService("Workspace").Map.ChildAdded:Connect(function(child)
	if child.Name == "MysticIsland" then
	  Status:updateButton(miraGe,"Mirage Island : 🟢")
	end
  end)
  game:GetService("Workspace").Map.ChildRemoved:Connect(function(child)
	if child.Name == "MysticIsland" then
	  Status:updateButton(miraGe,"Mirage Island : 🔴")
	end
  end)

local FullMoon =  Status:addButton("Check Moon")
task.spawn(function()
    while task.wait() do
	pcall(function()
                if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
                    Status:updateButton(FullMoon,"Full Moon : 🌑 5/5")
                elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" then
                    Status:updateButton(FullMoon,"Full Moon : 🌒 4/5")
                elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709143733" then
                    Status:updateButton(FullMoon,"Full Moon : 🌓 3/5")
                elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709150401" then
                    Status:updateButton(FullMoon,"Full Moon : 🌗 2/5")
                elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149680" then
                    Status:updateButton(FullMoon,"Full Moon : 🌖 1/5")
                else
                    Status:updateButton(FullMoon,"Full Moon : 🌚 0/5")
				end
			end)
			end
		end)

		
Trial:addButton("Door Trial - Mink", function() 
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29019.8008, 14890.6318, -379.760986, 1, -1.74907537e-08, 3.43654514e-14, 1.74907537e-08, 1, -4.32076028e-08, -3.36097151e-14, 4.32076028e-08, 1)
end)

Trial:addButton("Door Trial - Human", function() 
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29019.8008, 14890.6318, -379.760986, 1, -1.74907537e-08, 3.43654514e-14, 1.74907537e-08, 1, -4.32076028e-08, -3.36097151e-14, 4.32076028e-08, 1)
	wait(1)
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29236.5293, 14890.6328, -206.350357, -0.0113861728, 2.73532041e-09, -0.99993515, -1.10242233e-07, 1, 3.99081612e-09, 0.99993515, 1.10280524e-07, -0.0113861728)
	end)

Trial:addButton("Door Trial - Fish", function() 
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28225.5742, 14890.6328, -211.647903, 0.0328548178, 3.68870907e-08, 0.999460161, -8.32147293e-08, 1, -3.41715349e-08, -0.999460161, -8.20471087e-08, 0.0328548178)
end)

Trial:addButton("Door Trial - Sky", function() 
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28965.5859, 14919.2812, 234.491364, -0.017842032, -9.53221146e-08, -0.999840796, -5.12308098e-08, 1, -9.44230862e-08, 0.999840796, 4.9537956e-08, -0.017842032)
end)

Trial:addButton("Door Trial - Cyborg", function() 
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28494.9648, 14895.6328, -422.819916, 0.00648500863, 6.08000095e-09, 0.99997896, 9.1455675e-08, 1, -6.67323219e-09, -0.99997896, 9.14970286e-08, 0.00648500863)
end)

Trial:addButton("Door Trial - Ghoul", function() 
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28673.123, 14890.334, 451.042358, -0.999759197, -2.57176502e-09, 0.0219438002, -2.8835927e-09, 1, -1.41786467e-08, -0.0219438002, -1.4238509e-08, -0.999759197)
end)


Main:addButton("Mansion [TP Bypass]", function() 
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
end)

Clock:addButton("Temple Of Time", function() 
	game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game:GetService("Workspace").Map["Temple of Time"].TeleportSpawn.CFrame)
end)

Clock:addButton("Ancient Clock", function() 
	game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game:GetService("Workspace").Map["Temple of Time"].ClockRoomSpawn.CFrame)
	wait(0)
	local TweenService = game:GetService("TweenService")       
     TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
{CFrame = CFrame.new(29546.4, 15069, -85.6545)}):Play()
end)

Clock:addButton("Ancient One", function() 
	game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game:GetService("Workspace").Map["Temple of Time"].ClockRoomSpawn.CFrame)
	wait(0)
	local TweenService = game:GetService("TweenService")       
     TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
{CFrame = CFrame.new(28974.2227, 14888.9844, -119.069099, 0, 0, -1, 0, 1, 0, 1, 0, 0)}):Play()
end)

Main:addButton("Check Pull-Lever", function()
    if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") == true then
        venyx:Notify("Thông báo","Đã Gạt Cần")
 else
    venyx:Notify("Thông báo", "Chưa Gạt Cần")
 end
 end)


Teams:addButton("Join Marines Team", function() 
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines")
  end)

Teams:addButton("Join Pirates Team", function() 
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates")
  end)

  
World:addButton("Teleport Sea 3", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end)

World:addButton("Teleport Sea 2", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end)

World:addButton("Teleport Sea 1", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end)



Shop:addButton("GodHuman", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
end)

Shop:addButton("Dragontalon", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
end)

Shop:addButton("ElectricClaw", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
end)

Shop:addButton("SharkmanKarate", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
end)

Shop:addButton("DeathStep", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
end)

Shop:addButton("SuperHuman", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
end)

Abilities:addButton("Soru | $100,000 Beli", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
end)

Abilities:addButton("Haki Bosu | $25,000 Beli", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
end)

Abilities:addButton("Geppo | $10,000", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
end)

Other:addToggle("Kill Aura", false, function(vu)
    Killaura = vu
end)

if game.workspace:FindFirstChild("WaterWalk") then
    game.workspace:FindFirstChild("WaterWalk"):Destroy()
end
platform = Instance.new("Part")
platform.Name = "WaterWalk"
platform.Size = Vector3.new(math.huge, 1, math.huge)
platform.Transparency = 1
platform.Anchored = true
platform.Parent = game.workspace
Other:addToggle("Walk Water",false,function(value)
    _G.WalkWater = value
end)

spawn(function()
        while task.wait() do
            pcall(function()
                if _G.WalkWater then
                    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
                else
                    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
                end
            end)
        end
    end)

Other2:addToggle("ESP | Players", false, function(a)
	ESPPlayer = a
	UpdatePlayerChams()
end)
Other2:addToggle("ESP Devil Fruit", false,function(a)
    DevilESP = a
	while DevilESP do wait()
		UpdateDevilFruit()
	end
end)
spawn(function()
	while wait(2) do
		if ESPPlayer then
			UpdatePlayerChams()
		end
		if DevilFruitESP then
			UpdateDevilChams() 
		end
	end
end)

Other3:addToggle("Auto Buso Haki", false, function(bosu)
	_G.autoBuso = bosu
end)
spawn(function()
    while wait(0) do
		pcall(function()
			if _G.autoBuso then
				if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
				else
					wait(0)
				end
			end
		end)
    end
end)

Other3:addToggle("Auto Ken Haki", false, function(ken)
	_G.autoKen = ken
end)
spawn(function()
    while wait(0) do
		pcall(function()
			if _G.autoKen then
				if not game.Players.LocalPlayer.Character:FindFirstChild("HasKen") then
					game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
				else
					wait(0)
				end
			end
		end)
    end
end)

Main:addToggle("Pull Lever",false, function(pl)
    _G.PullLever = pl
end)
spawn(function()
	pcall(function()
	 if _G.PullLever then
		if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") then
			venyx:Notify("Thông báo","Quest 1 | Great Tree")
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Begin") 
			game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game:GetService("Workspace").Map["Temple of Time"].TeleportSpawn.CFrame)
				wait(0)
				local TweenService = game:GetService("TweenService")       
			 TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
		{CFrame = CFrame.new(28608.3, 14896.5, 105.455)}):Play()
				wait(2)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","TeleportBack")
		wait(1)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Teleport")
		wait(1)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Continue")
		end
else
	wait(1) 
	game.StarterGui:SetCore("SendNotification", {
		Title = "Mirage Island 🏝"; 
		Text = "Mirage Not Spawn"; 
		Icon = "rbxassetid://13503612303"; 
		Duration = 2; 
		})
	end
end)
end)

if game.workspace:FindFirstChild("WaterWalk") then
	game.workspace:FindFirstChild("WaterWalk"):Destroy()
end
platform = Instance.new("Part")
platform.Name = "WaterWalk"
platform.Size = Vector3.new(math.huge, 1, math.huge)
platform.Transparency = 1
platform.Anchored = true
platform.Parent = game.workspace
Other4:addToggle("Auto Mirage Island",false,function(value)
	_G.Mirage = value
	_G.WalkWater = value
	Moon = value
	end)
	spawn(function()
		pcall(function()
			while wait() do
			 if _G.Mirage then
			  if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
				function toTargetWait(a)local b=(a.p-game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude;tweenrach=game:GetService('TweenService'):Create(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),TweenInfo.new(b/250,Enum.EasingStyle.Linear),{CFrame=a})tweenrach:Play()end;toTargetWait(Workspace.Map.MysticIsland.PrimaryPart.CFrame*CFrame.new(0,270,0))
				
				getgenv().NoClip = true
					if getgenv().NoClip then
						local LocalPlayerCharacter = game.Players.LocalPlayer.Character
						LocalPlayerCharacter.Head.CanCollide = false
						LocalPlayerCharacter.LowerTorso.CanCollide = false
						LocalPlayerCharacter.UpperTorso.CanCollide = false
						LocalPlayerCharacter.HumanoidRootPart.CanCollide = false
						if LocalPlayerCharacter:FindFirstChild("Badge") then
							LocalPlayerCharacter.Badge.CanCollide = false
						end
					end
					while Moon == true do wait()
						game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position, game.Workspace.CurrentCamera.CFrame.Position + game:GetService("Lighting"):GetMoonDirection())
				   end
				else
					wait(5)
					game.StarterGui:SetCore("SendNotification", {
						Title = "Mirage Island 🏝"; 
						Text = "Mirage Not Spawn"; 
						Icon = "rbxassetid://13503612303"; 
						Duration = 2; 
						})       
			end
	end
	end
	end)
	end)
	spawn(function()
		while task.wait() do
			pcall(function()
				if _G.WalkWater then
					game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
				else
					game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
				end
			end)
		end
	end)

Other4:addToggle("Lock Moon", false, function(state)
	Moon = state
    while Moon == true do wait()
			 game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position, game.Workspace.CurrentCamera.CFrame.Position + game:GetService("Lighting"):GetMoonDirection())
		end
end)

Other4:addToggle("Auto Buy Gear", false, function(state)
	while state == true do wait()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace","Buy")
	end
end)

Other4:addToggle("Auto Turn On V4",_G.AutoDoughtBoss,function(state)
    attoV4 = state
while attoV4 == true do wait()
game:GetService("Players").LocalPlayer.Backpack.Awakening.RemoteFunction:InvokeServer(true)
end
end)


Fragments:addButton("Refund Stat | 2,500 Fragment", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
end)

Fragments:addButton("Reroll Race | 3,000 Fragment", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
end)

function topos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
    pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/210, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
    tween:Play()
    if Distance <= 250 then
        tween:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end
    if _G.StopTween == true then
        tween:Cancel()
        _G.Clip = false
    end
end

function StopTween(target) 
    if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
    end
end

function UnEquipWeapon(Weapon)
    if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
        _G.NotAutoEquip = true
        wait(.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        wait(.1)
        _G.NotAutoEquip = false
    end
end

function EquipWeapon(ToolSe)
    if not _G.NotAutoEquip then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait(.1)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
        end
    end
end

WeaponList = {}
    
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
        if v:IsA("Tool") then
            table.insert(WeaponList, v.Name)
        end
    end
    
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
        if v:IsA("Tool") then
            table.insert(WeaponList ,v.Name)
        end
    end

function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end



spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoDoughtBoss == true then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoDoughtBoss == true then
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

spawn(function()
    while wait() do
        if _G.AutoDoughtBoss == false then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
            end)
        end    
    end
end)


spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoDoughtBoss == true then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoDoughtBoss == true then
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

spawn(function()
    while wait() do
        if _G.AutoDoughtBoss == false then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
            end)
        end    
    end
end)

Cuttay:addToggle("Bring Mob",false,function(value)
    BoneMagnet = value
end)

Cuttay:addToggle("Auto Dought Boss",_G.AutoDoughtBoss,function(value)
    _G.AutoDoughtBoss = value
    StopTween(_G.AutoDoughtBoss)
end)

Cuttay:addDropdown("Select Weapon",WeaponList,function(value)
    _G.SelectWeapon = value
end)

local MobKilled = Status:addButton("")
    spawn(function()
        while wait() do
            pcall(function()
                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                    Status:updateButton(MobKilled,"Killed : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41))
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                    Main:updateButton(MobKilled"Killed : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40))
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                    Main:updateButton(MobKilled"Killed : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39))
                else
                    Main:updateButton(MobKilled"Boss Is Spawning")
                end
            end)
        end
    end)

spawn(function()
    while wait() do
        pcall(function()
            if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41)) - 500)
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),40,41)) - 500)
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),41,41)) - 500)
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if _G.AutoDoughtBoss then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until not _G.AutoDoughtBoss or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                    else
                        if KillMob == 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner",true)
                        end                    
                        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard [Lv. 2225]") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker [Lv. 2275]") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]" then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat task.wait()
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false 
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                BoneMagnet = true
                                                PosMonDoughtOpenDoor = v.HumanoidRootPart.CFrame
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                            until not _G.AutoDoughtBoss or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or KillMob == 0
                                        end
                                    end
                                end
                            else
                                BoneMagnet = false
                                if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter [Lv. 2200]") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter [Lv. 2200]").HumanoidRootPart.CFrame * CFrame.new(5,10,7)) 
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard [Lv. 2225]") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard [Lv. 2225]").HumanoidRootPart.CFrame * CFrame.new(5,10,7)) 
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff [Lv. 2250]") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff [Lv. 2250]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                        else
                                            if game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker [Lv. 2275]") then
                                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker [Lv. 2275]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                            end
                                        end
                                    end
                                end                       
                            end
                        else
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                                topos(game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                            else
                                if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if _G.AutoDoughtBoss and BoneMagnet then
                    if (v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]") and (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= 400 then
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                    end
                end
            end)
        end
    end)

-- load
venyx:SelectPage(venyx.pages[1], true)

