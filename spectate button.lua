local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Variables
local spectating = false
local spectateEnabled = false
local spectateIndex = 1
local playerList = {}

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 150, 0, 50)
ToggleButton.Position = UDim2.new(0.05, 0, 0.9, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 18
ToggleButton.Text = "Enable Spectate"
ToggleButton.Parent = ScreenGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 100)
Frame.Position = UDim2.new(0.5, -150, 0.8, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Visible = false -- Initially hidden
Frame.Parent = ScreenGui

local SpectateLabel = Instance.new("TextLabel")
SpectateLabel.Size = UDim2.new(1, 0, 0.5, 0)
SpectateLabel.Position = UDim2.new(0, 0, 0, 0)
SpectateLabel.BackgroundTransparency = 1
SpectateLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpectateLabel.Font = Enum.Font.SourceSansBold
SpectateLabel.TextSize = 24
SpectateLabel.Text = "Spectating: None"
SpectateLabel.Parent = Frame

local LeftButton = Instance.new("TextButton")
LeftButton.Size = UDim2.new(0.3, 0, 0.4, 0)
LeftButton.Position = UDim2.new(0, 10, 0.6, 0)
LeftButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
LeftButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LeftButton.Font = Enum.Font.SourceSansBold
LeftButton.TextSize = 18
LeftButton.Text = "<"
LeftButton.Parent = Frame

local RightButton = Instance.new("TextButton")
RightButton.Size = UDim2.new(0.3, 0, 0.4, 0)
RightButton.Position = UDim2.new(0.7, -10, 0.6, 0)
RightButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
RightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RightButton.Font = Enum.Font.SourceSansBold
RightButton.TextSize = 18
RightButton.Text = ">"
RightButton.Parent = Frame

-- Functions
local function updatePlayerList()
    playerList = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            table.insert(playerList, player)
        end
    end
    spectateIndex = math.clamp(spectateIndex, 1, #playerList)
end

local function spectatePlayer(player)
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        Camera.CameraSubject = player.Character.Humanoid
        SpectateLabel.Text = "Spectating: " .. player.Name
    else
        Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character.Humanoid
        SpectateLabel.Text = "Spectating: None"
    end
end

local function switchSpectate(direction)
    if #playerList == 0 then return end
    spectateIndex = spectateIndex + direction
    if spectateIndex < 1 then
        spectateIndex = #playerList
    elseif spectateIndex > #playerList then
        spectateIndex = 1
    end
    spectatePlayer(playerList[spectateIndex])
end

local function toggleSpectateGUI()
    spectateEnabled = not spectateEnabled
    Frame.Visible = spectateEnabled
    ToggleButton.Text = spectateEnabled and "Disable Spectate" or "Enable Spectate"

    if not spectateEnabled then
        Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character.Humanoid
        SpectateLabel.Text = "Spectating: None"
    end
end

-- Event Listeners
ToggleButton.MouseButton1Click:Connect(toggleSpectateGUI)

LeftButton.MouseButton1Click:Connect(function()
    if spectateEnabled then
        switchSpectate(-1)
    end
end)

RightButton.MouseButton1Click:Connect(function()
    if spectateEnabled then
        switchSpectate(1)
    end
end)

-- Update player list dynamically
Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

-- Initialize
updatePlayerList()
spectatePlayer(nil)
