local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local CollectionService = game:GetService("CollectionService")
local player = Players.LocalPlayer

local scale = 0.5
local offsetX = -15
local offsetY = -15

local function createGUI()
	if player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("main") then
		player.PlayerGui.main:Destroy()
	end

	local G2L = {}
	G2L["ScreenGui_1"] = Instance.new("ScreenGui")
	G2L["ScreenGui_1"].Name = "main"
	G2L["ScreenGui_1"].Parent = player:WaitForChild("PlayerGui")
	G2L["ScreenGui_1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	CollectionService:AddTag(G2L["ScreenGui_1"], "main")

	local function createButton(name, key, posX, posY, sizeX, sizeY)
		local b = Instance.new("TextButton", G2L["ScreenGui_1"])
		b.Name = name
		b.BorderSizePixel = 0
		b.TextSize = 96 * scale
		b.BackgroundColor3 = Color3.fromRGB(125,125,125)
		b.FontFace = Font.new("rbxasset://fonts/families/RomanAntique.json")
		b.BackgroundTransparency = 0.5
		b.Size = UDim2.new(0, sizeX * scale, 0, sizeY * scale)
		b.Text = key
		b.Position = UDim2.new(0, posX * scale - offsetX, 0, posY * scale + offsetY)
		local c = Instance.new("UICorner", b)
		c.CornerRadius = UDim.new(91919120, 0)
		b.MouseButton1Click:Connect(function()
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode[key], false, game)
			task.wait(0.05)
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[key], false, game)
		end)
	end

	createButton("TextButton_2","Q",1358,56,144,134)
	createButton("TextButton_4","E",1150,234,102,94)
	createButton("TextButton_6","R",1402,-38,98,92)
	createButton("TextButton_8","T",1288,-36,98,92)
	createButton("TextButton_a","Y",1238,70,98,92)
	createButton("TextButton_c","U",1274,186,98,92)
	createButton("TextButton_e","I",1390,198,98,92)
	createButton("TextButton_10","O",1050,-38,98,92)
	createButton("TextButton_12","P",950,-38,98,92)
	createButton("TextButton_14","F",850,-38,98,92)
	createButton("TextButton_16","G",750,-38,98,92)
	createButton("TextButton_18","H",650,-38,98,92)
	createButton("TextButton_1a","J",550,-38,98,92)
	createButton("TextButton_1c","K",450,-38,98,92)
	createButton("TextButton_1e","L",350,-38,98,92)
	createButton("TextButton_20","Z",250,-38,98,92)
	createButton("TextButton_22","X",150,-38,98,92)
	createButton("TextButton_24","C",34,50,98,92)
	createButton("TextButton_26","V",34,150,98,92)
	createButton("TextButton_28","B",34,250,98,92)
	createButton("TextButton_2a","N",34,350,98,92)
	createButton("TextButton_2c","M",34,450,98,92)

	G2L["Frame_2"] = Instance.new("Frame", G2L["ScreenGui_1"])
	G2L["Frame_2"].BorderSizePixel = 0
	G2L["Frame_2"].BackgroundColor3 = Color3.fromRGB(36,36,36)
	G2L["Frame_2"].Size = UDim2.new(0, 334 * scale, 0, 322 * scale)
	G2L["Frame_2"].Position = UDim2.new(0, 168 * scale - offsetX, 0, 276 * scale + offsetY)
	G2L["Frame_2"].BackgroundTransparency = 0.3
	local u1 = Instance.new("UICorner", G2L["Frame_2"])
	u1.CornerRadius = UDim.new(5,0)

	local function makeMoveKey(name, key, posX, posY, sizeX, sizeY)
		local b = Instance.new("TextButton", G2L["ScreenGui_1"])
		b.BorderSizePixel = 0
		b.TextSize = 96 * scale
		b.BackgroundColor3 = Color3.fromRGB(255,255,255)
		b.FontFace = Font.new("rbxasset://fonts/families/RomanAntique.json")
		b.BackgroundTransparency = 0.67
		b.Size = UDim2.new(0, sizeX * scale, 0, sizeY * scale)
		b.Text = key
		b.Position = UDim2.new(0, posX * scale - offsetX, 0, posY * scale + offsetY)
		local c = Instance.new("UICorner", b)
		c.CornerRadius = UDim.new(1,0)
		return b
	end

	local W = makeMoveKey("W", "W", 286, 282, 96, 110)
	local A = makeMoveKey("A", "A", 176, 390, 110, 96)
	local S = makeMoveKey("S", "S", 286, 484, 96, 110)
	local D = makeMoveKey("D", "D", 382, 390, 110, 96)

	local space = Instance.new("TextButton", G2L["ScreenGui_1"])
	space.BorderSizePixel = 0
	space.TextSize = 60 * scale
	space.BackgroundColor3 = Color3.fromRGB(0,0,0)
	space.FontFace = Font.new("rbxasset://fonts/families/RomanAntique.json")
	space.BackgroundTransparency = 0.8
	space.Size = UDim2.new(0,216 * scale,0,214 * scale)
	space.Text = "SPACE"
	space.Position = UDim2.new(0,1194 * scale - offsetX,0,332 * scale + offsetY)
	local sC = Instance.new("UICorner", space)
	sC.CornerRadius = UDim.new(10000,0)

	local holding = {}
	local function holdKey(keyCode, button)
		button.MouseButton1Down:Connect(function()
			holding[keyCode] = true
			VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
		end)
		button.MouseButton1Up:Connect(function()
			holding[keyCode] = false
			VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
		end)
	end

	holdKey(Enum.KeyCode.W, W)
	holdKey(Enum.KeyCode.A, A)
	holdKey(Enum.KeyCode.S, S)
	holdKey(Enum.KeyCode.D, D)

	space.MouseButton1Click:Connect(function()
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
		task.wait(0.1)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
	end)
end

createGUI()


player.CharacterAdded:Connect(function()
	task.wait(1)
	createGUI()
end)