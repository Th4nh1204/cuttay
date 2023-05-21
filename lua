local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
OrionLib:MakeNotification({ --Thông Tin
	Name = "Pull Lever",
	Content = "Quest | Great Tree - Mirage Island",
	Image = "rbxassetid://13503612303",
	Time = 5
})

Tab:AddButton({
	Name = "Pull Lever",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Begin")
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12547.7, 290.139, -7487.06)
        wait(0)
        local TweenService = game:GetService("TweenService")       
     TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(47, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
{CFrame = CFrame.new(2952.84, 2282.32, -7216.94)}):Play()
wait(50)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Teleport")
wait(0)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Continue")
end  
})


getgenv().NoClip = true
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
UserInputService.InputBegan:Connect(function(Key, GameProcessedEvent)
	if GameProcessedEvent then
		return
	end
	if Key.KeyCode == Enum.KeyCode.Q then
		if getgenv().NoClip then
			getgenv().NoClip = false
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "",
				Text = "",
				Duration = 0,
			})
		else
			getgenv().NoClip = true
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "",
				Text = "",
				Duration = 5,
			})
		end
	end
end)
RunService.Stepped:Connect(function()
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
end)

