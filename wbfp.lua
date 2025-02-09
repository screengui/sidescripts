local Stamp = game.ReplicatedStorage.BuildingBridge.Stamp

function findPlot(playerName)
    for _, v in pairs(workspace.BuildingAreas:GetChildren()) do
        if v:FindFirstChild("Player") and v.Player.Value == playerName then
            return v:FindFirstChild("PlayerArea")
        end
    end
    return nil
end

-- Get the player's plot baseplate position
local playerName = game.Players.LocalPlayer.Name
local playerPlot = findPlot(playerName)

if playerPlot and playerPlot:FindFirstChild("BasePlate") then
    local Base = playerPlot.BasePlate
    local basePosition = Base.Position
    local blockId = _G.FPID
    local specialBlockId = 23047552  -- Special block ID for the first block
    local blockSize = 4  -- Size of each block
    local numBlocks = 26 -- How many blocks to place along each side
    local yOffset = 4  -- Height to place the blocks at
    local specialBlockYOffset = yOffset + 0  -- Special block position is 4 studs above the first block
    
    -- Function to place a block
    function placeBlock(id, position)
        local placementPosition = basePosition + position
        Stamp:InvokeServer(id, CFrame.new(placementPosition))
    end

    -- Function to fill the entire base with blocks
    local function fillBase()
        -- Calculate the range of X and Z coordinates to cover
        local xStart = -48
        local xEnd = 48
        local zStart = -48
        local zEnd = 48
        
        -- Loop through the X and Z axes to fill the base
        for x = xStart, xEnd, blockSize do
            for z = zStart, zEnd, blockSize do
                task.spawn(function()
                    -- Place the special block only at the far left corner (first block)
                    if x == xStart and z == zStart then
                        -- Place the special block at 4 studs above
                        placeBlock(specialBlockId, Vector3.new(x, specialBlockYOffset, z))
                        -- Also place the regular block under the special block
                        placeBlock(blockId, Vector3.new(x, yOffset, z))
                    else
                        -- Place the regular blocks for the rest
                        placeBlock(blockId, Vector3.new(x, yOffset, z))
                    end
                end)
            end
        end
    end

    -- Call the function to fill the base with blocks
    fillBase()
else
    warn("Player plot or BasePlate not found for player:", playerName)
end
