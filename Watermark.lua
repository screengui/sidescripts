-- Services
local RunService = game:GetService("RunService")

local wam = Instance.new("ScreenGui")
wam.Name = "WatermarkGui"
wam.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local wm = Instance.new("TextLabel")
wm.Name = "Watermark"
wm.Text = "ByteHub"
wm.Size = UDim2.new(0, 170, 0, 50)
wm.Position = UDim2.new(1, -270, 0, 30)
wm.TextScaled = true
wm.BackgroundTransparency = 1
wm.Font = "FredokaOne"
wm.Parent = wam

-- Functions
function rainbowFunction()
    local hue = (tick() * 30) % 360
    return Color3.fromHSV(hue / 360, 1, 1)
end

RunService.Heartbeat:Connect(function()
    wm.TextStrokeColor3 = rainbowFunction()
    wm.TextColor3 = rainbowFunction()
end)
