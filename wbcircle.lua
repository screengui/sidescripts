local Stamp = game.ReplicatedStorage.BuildingBridge.Stamp

-- Function to find the plot based on player's name
function findPlot(n)
    for _, v in pairs(workspace.BuildingAreas:GetChildren()) do
        if v.Player.Value == n then
            return v.PlayerArea
        end
    end
    return nil
end

-- Get the player's plot baseplate
local Base = findPlot(game.Players.LocalPlayer.Name).BasePlate
local baseCFrame = Base.CFrame -- Using CFrame for relative positioning
local basePosition = baseCFrame.Position -- Extracting base position

-- Function to place a block in a circular pattern
function placeBlock(id, position)
    local worldCFrame = baseCFrame:ToWorldSpace(CFrame.new(position)) -- Convert relative to world
    Stamp:InvokeServer(id, worldCFrame) -- Now passes a CFrame instead of Vector3
end

-- Function to generate a perfect circle of blocks
function buildCircle(id, radius, yOffset, blockCount)
    local centerX, centerZ = basePosition.X, basePosition.Z
    local step = 360 / blockCount -- Evenly distribute blocks

    for i = 0, blockCount - 1 do
        task.spawn(function()
            local angle = math.rad(i * step) -- Convert to radians
            local x = radius * math.cos(angle)
            local z = radius * math.sin(angle)
            local y = yOffset -- Set height offset manually

            placeBlock(id, Vector3.new(x, y, z)) -- Pass Vector3, which gets converted to CFrame in placeBlock
        end)
    end
end

-- **Example Usage**
buildCircle(_G.ID, _G.Radius, _G.Y, _G.BCount) -- id, radius, Y-offset, block count
