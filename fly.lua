local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local lplr = game:GetService("Players").LocalPlayer

local FlyingActive = false

local W,A,S,D = false,false,false,false
local x,y,z = nil,nil,nil

local FlySpeed = 2

----[other]

function MoveCharacter(MovementSpeed)
	if FlyingActive then
		x += lplr.Character:FindFirstChild("Humanoid").MoveDirection.X
		y += lplr.Character:FindFirstChild("Humanoid").MoveDirection.Y
		z += lplr.Character:FindFirstChild("Humanoid").MoveDirection.Z

		local cframe = CFrame.new(x,y,z)


		lplr.Character:FindFirstChild("HumanoidRootPart").CFrame = cframe
	end


end

----[Input]
UserInputService.InputBegan:Connect(function(input,proc)

	if input.KeyCode == Enum.KeyCode.F then
		if FlyingActive then
			FlyingActive = false
			x,y,z = nil,nil,nil
		else
			x,y,z = lplr.Character:FindFirstChild("HumanoidRootPart").Position.X,lplr.Character:FindFirstChild("HumanoidRootPart").Position.Y,lplr.Character:FindFirstChild("HumanoidRootPart").Position.Z
			FlyingActive = true
		end
	end

	if FlyingActive then
		if input.KeyCode == Enum.KeyCode.W then
			W = true
		elseif input.KeyCode == Enum.KeyCode.S then
			S = true
		elseif input.KeyCode == Enum.KeyCode.D then
			D = true
		elseif input.KeyCode == Enum.KeyCode.A then
			A = true
		end
	end
end)

UserInputService.InputEnded:Connect(function(input,proc)
	if FlyingActive then
		if input.KeyCode == Enum.KeyCode.W then
			W = false
		elseif input.KeyCode == Enum.KeyCode.S then
			S = false
		elseif input.KeyCode == Enum.KeyCode.D then
			D = false
		elseif input.KeyCode == Enum.KeyCode.A then
			A = false
		end
	end
end)

----[Main]

RunService.Heartbeat:Connect(function()
	MoveCharacter(FlySpeed)
end)
