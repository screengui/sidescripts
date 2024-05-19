local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DraggableUI"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local uiFrame = Instance.new("Frame")
uiFrame.Size = UDim2.new(0, 200, 0, 100)
uiFrame.Position = UDim2.new(0, 10, 0.5, -50)  
uiFrame.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
uiFrame.BorderSizePixel = 2
uiFrame.Parent = screenGui

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundColor3 = Color3.new(0, 1, 0)
toggleButton.Text = "Open"
toggleButton.Parent = screenGui  

local bButton = Instance.new("TextButton")
bButton.Size = UDim2.new(0, 100, 0, 30)
bButton.Position = UDim2.new(0.5, -50, 0.5, -15)  
bButton.BackgroundColor3 = Color3.new(0, 0, 1)
bButton.Text = "Press B"
bButton.Parent = uiFrame

uiFrame.Active = true
uiFrame.Draggable = true

local function onButtonClick()
    if toggleButton.Text == "Open" then
        toggleButton.Text = "Close"
        toggleButton.BackgroundColor3 = Color3.new(1, 0, 0)  
        uiFrame.Visible = true
    else
        toggleButton.Text = "Open"
        toggleButton.BackgroundColor3 = Color3.new(0, 1, 0)
        uiFrame.Visible = false  
    end
end

toggleButton.MouseButton1Click:Connect(onButtonClick)
bButton.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.B, false, game)
end)
