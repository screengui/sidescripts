--Gui to Lua
local VirtualInputManager = game:GetService("VirtualInputManager")

local frameSize = UDim2.new(0, 64, 0, 64)
local framePosition = UDim2.new(0.5, 0, 0.5, 0) -- Centered
local frameColor = Color3.fromRGB(24,24,24) -- Gray

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DraggableFrameGui"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 10

local buttonSize = UDim2.new(0, 45, 0, 45)
local button = Instance.new("TextButton")
button.Name = "Button"
button.Size = frameSize
button.AnchorPoint = Vector2.new(0, 0) -- Top-left alignment
button.Position = UDim2.new(0.25, 0, 0.05, 0)
button.BackgroundColor3 = frameColor
button.Parent = screenGui
button.Text = "Toggle"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.FredokaOne
button.TextScaled = true
button.ZIndex = 0
button.Active = true
button.Draggable = true

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0.2, 0) 
frameCorner.Parent = button

button.MouseButton1Click:Connect(function()
  VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
end)

screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
