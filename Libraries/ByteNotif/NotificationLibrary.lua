local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ContentProvider = game:GetService("ContentProvider")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local NotificationLibrary = {}

-- Setup UI Container
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NotificationContainer"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local container = Instance.new("Frame")
container.Name = "Holder"
container.Size = UDim2.new(0, 300, 1, -20)
container.Position = UDim2.new(1, -310, 0, 10)
container.BackgroundTransparency = 1
container.Parent = screenGui

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
listLayout.Padding = UDim.new(0, 8)
listLayout.Parent = container

-- Default Color Themes
local THEMES = {
	Info    = Color3.fromRGB(0, 150, 255),
	Success = Color3.fromRGB(46, 204, 113),
	Warning = Color3.fromRGB(241, 196, 15),
	Error   = Color3.fromRGB(231, 76, 60)
}

-- Default Sound Effects (Roblox Asset IDs)
local DEFAULT_SOUNDS = {
	Info    = "rbxassetid://6895079853",
	Success = "rbxassetid://6895079712",
	Warning = "rbxassetid://6895079553",
	Error   = "rbxassetid://6895079371"
}

-- Helper function to handle audio playback
local function playNotificationSound(soundId, volume, playbackSpeed)
	if not soundId or soundId == "" or soundId == "none" then return end

	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	sound.Volume = volume or 0.5
	sound.PlaybackSpeed = playbackSpeed or 1
	sound.Parent = screenGui

	-- Clean up sound instance automatically when done
	sound.Ended:Connect(function()
		sound:Destroy()
	end)

	sound:Play()
end

function NotificationLibrary.Notify(config)
	config = config or {}
	local titleText = config.Title or "Notification"
	local messageText = config.Text or ""
	local duration = config.Duration or 4
	local notifyType = config.Type or "Info"
	local accentColor = config.Color or THEMES[notifyType] or THEMES.Info

	-- Sound Options
	local soundEnabled = if config.PlaySound ~= nil then config.PlaySound else true
	local customSoundId = config.SoundId or DEFAULT_SOUNDS[notifyType] or DEFAULT_SOUNDS.Info
	local soundVolume = config.Volume or 0.5
	local soundPitch = config.Pitch or 1

	-- Play sound if enabled
	if soundEnabled then
		playNotificationSound(customSoundId, soundVolume, soundPitch)
	end

	-- Main Notification Box
	local card = Instance.new("Frame")
	card.Size = UDim2.new(1, 0, 0, 70)
	card.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
	card.BackgroundTransparency = 1
	card.BorderSizePixel = 0
	card.ClipsDescendants = true
	card.Position = UDim2.new(1.2, 0, 0, 0) -- Start off-screen

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = card

	-- Left Color Bar
	local colorBar = Instance.new("Frame")
	colorBar.Size = UDim2.new(0, 5, 1, 0)
	colorBar.BackgroundColor3 = accentColor
	colorBar.BorderSizePixel = 0
	colorBar.Parent = card

	local barCorner = Instance.new("UICorner")
	barCorner.CornerRadius = UDim.new(0, 4)
	barCorner.Parent = colorBar

	-- Title Text
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Size = UDim2.new(1, -20, 0, 22)
	titleLabel.Position = UDim2.new(0, 15, 0, 8)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = titleText
	titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	titleLabel.TextSize = 15
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = card

	-- Body Message Text
	local bodyLabel = Instance.new("TextLabel")
	bodyLabel.Size = UDim2.new(1, -20, 0, 32)
	bodyLabel.Position = UDim2.new(0, 15, 0, 28)
	bodyLabel.BackgroundTransparency = 1
	bodyLabel.Text = messageText
	bodyLabel.TextColor3 = Color3.fromRGB(180, 180, 185)
	bodyLabel.TextSize = 13
	bodyLabel.Font = Enum.Font.Gotham
	bodyLabel.TextXAlignment = Enum.TextXAlignment.Left
	bodyLabel.TextYAlignment = Enum.TextYAlignment.Top
	bodyLabel.TextWrapped = true
	bodyLabel.Parent = card

	-- Progress Bar (Timer)
	local progressBar = Instance.new("Frame")
	progressBar.Size = UDim2.new(1, 0, 0, 3)
	progressBar.Position = UDim2.new(0, 0, 1, -3)
	progressBar.BackgroundColor3 = accentColor
	progressBar.BorderSizePixel = 0
	progressBar.Parent = card

	card.Parent = container

	-- Tween Animations
	local tweenInfoFast = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tweenInfoLinear = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

	-- Slide In + Fade In
	TweenService:Create(card, tweenInfoFast, {Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0.1}):Play()
	-- Shrink Progress Bar
	TweenService:Create(progressBar, tweenInfoLinear, {Size = UDim2.new(0, 0, 0, 3)}):Play()

	-- Dismiss / Slide Out After Duration
	task.delay(duration, function()
		local slideOut = TweenService:Create(card, tweenInfoFast, {
			Position = UDim2.new(1.2, 0, 0, 0),
			BackgroundTransparency = 1
		})
		slideOut:Play()
		slideOut.Completed:Connect(function()
			card:Destroy()
		end)
	end)
end

return NotificationLibrary	Error   = Color3.fromRGB(231, 76, 60)
}

function NotificationLibrary.Notify(config)
	config = config or {}
	local titleText = config.Title or "Notification"
	local messageText = config.Text or ""
	local duration = config.Duration or 4
	local notifyType = config.Type or "Info"
	local accentColor = config.Color or THEMES[notifyType] or THEMES.Info

	-- Main Notification Box
	local card = Instance.new("Frame")
	card.Size = UDim2.new(1, 0, 0, 70)
	card.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
	card.BackgroundTransparency = 1
	card.BorderSizePixel = 0
	card.ClipsDescendants = true
	card.Position = UDim2.new(1.2, 0, 0, 0) -- Start off-screen

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = card

	-- Left Color Bar
	local colorBar = Instance.new("Frame")
	colorBar.Size = UDim2.new(0, 5, 1, 0)
	colorBar.BackgroundColor3 = accentColor
	colorBar.BorderSizePixel = 0
	colorBar.Parent = card

	local barCorner = Instance.new("UICorner")
	barCorner.CornerRadius = UDim.new(0, 4)
	barCorner.Parent = colorBar

	-- Title Text
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Size = UDim2.new(1, -20, 0, 22)
	titleLabel.Position = UDim2.new(0, 15, 0, 8)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = titleText
	titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	titleLabel.TextSize = 15
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = card

	-- Body Message Text
	local bodyLabel = Instance.new("TextLabel")
	bodyLabel.Size = UDim2.new(1, -20, 0, 32)
	bodyLabel.Position = UDim2.new(0, 15, 0, 28)
	bodyLabel.BackgroundTransparency = 1
	bodyLabel.Text = messageText
	bodyLabel.TextColor3 = Color3.fromRGB(180, 180, 185)
	bodyLabel.TextSize = 13
	bodyLabel.Font = Enum.Font.Gotham
	bodyLabel.TextXAlignment = Enum.TextXAlignment.Left
	bodyLabel.TextYAlignment = Enum.TextYAlignment.Top
	bodyLabel.TextWrapped = true
	bodyLabel.Parent = card

	-- Progress Bar (Timer)
	local progressBar = Instance.new("Frame")
	progressBar.Size = UDim2.new(1, 0, 0, 3)
	progressBar.Position = UDim2.new(0, 0, 1, -3)
	progressBar.BackgroundColor3 = accentColor
	progressBar.BorderSizePixel = 0
	progressBar.Parent = card

	card.Parent = container

	-- Tween Animations
	local tweenInfoFast = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tweenInfoLinear = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

	-- Slide In + Fade In
	TweenService:Create(card, tweenInfoFast, {Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0.1}):Play()
	-- Shrink Progress Bar
	TweenService:Create(progressBar, tweenInfoLinear, {Size = UDim2.new(0, 0, 0, 3)}):Play()

	-- Dismiss / Slide Out After Duration
	task.delay(duration, function()
		local slideOut = TweenService:Create(card, tweenInfoFast, {
			Position = UDim2.new(1.2, 0, 0, 0),
			BackgroundTransparency = 1
		})
		slideOut:Play()
		slideOut.Completed:Connect(function()
			card:Destroy()
		end)
	end)
end

return NotificationLibrary
