local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

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
container.Size = UDim2.new(0, 320, 1, -20)
container.Position = UDim2.new(1, -330, 0, 10)
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

-- Default Sound Effects
local DEFAULT_SOUNDS = {
	Info    = "rbxassetid://6895079853",
	Success = "rbxassetid://6895079712",
	Warning = "rbxassetid://6895079553",
	Error   = "rbxassetid://6895079371"
}

local function playNotificationSound(soundId, volume, playbackSpeed)
	if not soundId or soundId == "" or soundId == "none" then return end

	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	sound.Volume = volume or 0.5
	sound.PlaybackSpeed = playbackSpeed or 1
	sound.Parent = screenGui

	sound.Ended:Connect(function()
		sound:Destroy()
	end)

	sound:Play()
end

function NotificationLibrary.Notify(config)
	config = config or {}
	local titleText = config.Title or "Notification"
	local messageText = config.Text or ""
	local duration = config.Duration or 5
	local notifyType = config.Type or "Info"
	local accentColor = config.Color or THEMES[notifyType] or THEMES.Info
	local buttonsConfig = config.Buttons or {}

	local hasButtons = #buttonsConfig > 0
	local cardHeight = hasButtons and 95 or 70

	-- Sound Options
	local soundEnabled = if config.PlaySound ~= nil then config.PlaySound else true
	local customSoundId = config.SoundId or DEFAULT_SOUNDS[notifyType] or DEFAULT_SOUNDS.Info
	local soundVolume = config.Volume or 0.5
	local soundPitch = config.Pitch or 1

	if soundEnabled then
		playNotificationSound(customSoundId, soundVolume, soundPitch)
	end

	-- Main Card Frame
	local card = Instance.new("Frame")
	card.Size = UDim2.new(1, 0, 0, cardHeight)
	card.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
	card.BackgroundTransparency = 1
	card.BorderSizePixel = 0
	card.ClipsDescendants = true
	card.Position = UDim2.new(1.2, 0, 0, 0)

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = card

	-- Left Color Accent Bar
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
	titleLabel.Size = UDim2.new(1, -25, 0, 20)
	titleLabel.Position = UDim2.new(0, 15, 0, 6)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = titleText
	titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	titleLabel.TextSize = 14
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = card

	-- Message Text
	local bodyLabel = Instance.new("TextLabel")
	bodyLabel.Size = UDim2.new(1, -25, 0, hasButtons and 28 or 36)
	bodyLabel.Position = UDim2.new(0, 15, 0, 26)
	bodyLabel.BackgroundTransparency = 1
	bodyLabel.Text = messageText
	bodyLabel.TextColor3 = Color3.fromRGB(180, 180, 185)
	bodyLabel.TextSize = 12
	bodyLabel.Font = Enum.Font.Gotham
	bodyLabel.TextXAlignment = Enum.TextXAlignment.Left
	bodyLabel.TextYAlignment = Enum.TextYAlignment.Top
	bodyLabel.TextWrapped = true
	bodyLabel.Parent = card

	-- Progress Bar
	local progressBar = Instance.new("Frame")
	progressBar.Size = UDim2.new(1, 0, 0, 3)
	progressBar.Position = UDim2.new(0, 0, 1, -3)
	progressBar.BackgroundColor3 = accentColor
	progressBar.BorderSizePixel = 0
	progressBar.Parent = card

	card.Parent = container

	-- Tweens & Dismiss Handling
	local tweenInfoFast = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tweenInfoLinear = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

	TweenService:Create(card, tweenInfoFast, {Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0.1}):Play()
	local progressTween = TweenService:Create(progressBar, tweenInfoLinear, {Size = UDim2.new(0, 0, 0, 3)})
	progressTween:Play()

	local isDismissing = false
	local function dismiss()
		if isDismissing then return end
		isDismissing = true
		progressTween:Cancel()

		local slideOut = TweenService:Create(card, tweenInfoFast, {
			Position = UDim2.new(1.2, 0, 0, 0),
			BackgroundTransparency = 1
		})
		slideOut:Play()
		slideOut.Completed:Connect(function()
			card:Destroy()
		end)
	end

	-- Action Buttons Container
	if hasButtons then
		local buttonContainer = Instance.new("Frame")
		buttonContainer.Size = UDim2.new(1, -30, 0, 24)
		buttonContainer.Position = UDim2.new(0, 15, 1, -32)
		buttonContainer.BackgroundTransparency = 1
		buttonContainer.Parent = card

		local btnLayout = Instance.new("UIListLayout")
		btnLayout.FillDirection = Enum.FillDirection.Horizontal
		btnLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		btnLayout.Padding = UDim.new(0, 8)
		btnLayout.Parent = buttonContainer

		for _, btnData in ipairs(buttonsConfig) do
			local btnText = btnData.Text or "Button"
			local btnColor = btnData.Color or Color3.fromRGB(45, 45, 50)
			local textColor = btnData.TextColor or Color3.fromRGB(255, 255, 255)
			local callback = btnData.Callback or function() end

			local actionBtn = Instance.new("TextButton")
			actionBtn.Size = UDim2.new(0, 75, 1, 0)
			actionBtn.BackgroundColor3 = btnColor
			actionBtn.Text = btnText
			actionBtn.TextColor3 = textColor
			actionBtn.TextSize = 11
			actionBtn.Font = Enum.Font.GothamBold
			actionBtn.BorderSizePixel = 0
			actionBtn.Parent = buttonContainer

			local btnCorner = Instance.new("UICorner")
			btnCorner.CornerRadius = UDim.new(0, 4)
			btnCorner.Parent = actionBtn

			-- Click behavior
			actionBtn.MouseButton1Click:Connect(function()
				task.spawn(callback)
				dismiss()
			end)
		end
	end

	task.delay(duration, dismiss)
end

return NotificationLibrary
