local mazeSize = 24
local Stamp = game.ReplicatedStorage.BuildingBridge.Stamp

-- Function to find the player's plot
function findPlot(n)
    for _, v in pairs(workspace.BuildingAreas:GetChildren()) do
        if v:FindFirstChild("Player") and v.Player.Value == n then
            return v:FindFirstChild("PlayerArea")
        end
    end
    return nil
end

-- Get the player's plot base position
local playerPlot = findPlot(game.Players.LocalPlayer.Name)
if not playerPlot then
    warn("Player has no assigned plot!")
    return
end

local Base = playerPlot:FindFirstChild("BasePlate")
if not Base then
    warn("BasePlate is missing in the plot!")
    return
end

local basePosition = Base.Position
local startY = basePosition.Y + 7 -- Start placement **7 studs above the base**

-- **Maze Grid Setup**
local maze = {}
for x = 1, mazeSize do
    maze[x] = {}
    for y = 1, mazeSize do
        maze[x][y] = 1 -- 1 = Wall, 0 = Path
    end
end

-- **Generate Maze using Prim's Algorithm**
local function generateMaze()
    local walls = {}

    -- Pick a completely random start point (odd indices for proper carving)
    local startX, startY = math.random(3, mazeSize - 2), math.random(3, mazeSize - 2)
    if startX % 2 == 0 then startX = startX + 1 end
    if startY % 2 == 0 then startY = startY + 1 end

    maze[startX][startY] = 0 -- Mark as passage

    local function shuffleTable(t)
        for i = #t, 2, -1 do
            local j = math.random(1, i)
            t[i], t[j] = t[j], t[i]
        end
    end

    local function addWalls(x, y)
        local directions = {{-2, 0}, {2, 0}, {0, -2}, {0, 2}}
        shuffleTable(directions) -- Randomize wall selection order

        for _, dir in pairs(directions) do
            local nx, ny = x + dir[1], y + dir[2]
            if nx > 1 and ny > 1 and nx < mazeSize and ny < mazeSize and maze[nx][ny] == 1 then
                table.insert(walls, {nx, ny, x, y})
            end
        end
    end

    addWalls(startX, startY)

    while #walls > 0 do
        local randIndex = math.random(1, #walls)
        local wx, wy, px, py = table.unpack(table.remove(walls, randIndex))

        if maze[wx][wy] == 1 then
            maze[wx][wy] = 0
            maze[(wx + px) / 2][(wy + py) / 2] = 0 -- Carve through the wall
            addWalls(wx, wy)
        end
    end

    -- **Ensure Entrance and Exit are Open**
    maze[mazeSize][math.floor(mazeSize / 2)] = 0 -- **Entrance at bottom center**
    maze[mazeSize - 1][math.floor(mazeSize / 2)] = 0 -- Ensure it's open

    maze[1][math.floor(mazeSize / 2)] = 0 -- **Exit at top center**
    maze[2][math.floor(mazeSize / 2)] = 0 -- Ensure a clear path
end

generateMaze()

-- **Place the Maze in the Game with 4-Stud High Walls**
local function placeMaze(blockID)
    for x = 1, mazeSize do
        for z = 1, mazeSize do
            if maze[x][z] == 1 then
                local worldX = basePosition.X + (x - mazeSize / 2) * 4
                local worldZ = basePosition.Z + (z - mazeSize / 2) * 4

                -- Stack 4 blocks high
                for i = 0, (_G.MG1Height - 1) do
                    task.spawn(function()
                        local worldY = startY + (i * 4)
                        Stamp:InvokeServer(blockID, CFrame.new(worldX, worldY, worldZ))
                    end)
                end
            end
        end
    end
end

-- **Usage Example**
placeMaze(_G.MG1ID) -- Block ID for walls
