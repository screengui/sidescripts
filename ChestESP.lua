chestEspEnabled = not chestEspEnabled
if chestEspEnabled then
  spawn(function()
    while chestEspEnabled do
      local parentFolder = workspace.Blocks

      local function checkFolderForChildParts(folder)
        local childParts = {}
        local children = folder:GetChildren()
        for _, child in pairs(children) do
          if child.Name == "Chest" then
            table.insert(childParts, child)
          end
        end
        return childParts
      end

      local function outlinePart(part)
        if not part:FindFirstChild("CHEST_out") then
          local a = Instance.new("BoxHandleAdornment")
          a.Name = "CHEST_out"
          a.Parent = part
          a.Adornee = part
          a.AlwaysOnTop = true
          a.ZIndex = 0
          a.Size = part.Size
          a.Transparency = 0.3
          a.Color = BrickColor.new("Bright orange")
        end
      end

      local function iterateAndCheckFolders(parent)
        for _, folder in pairs(parent:GetChildren()) do
          if folder:IsA("Folder") then
            local childParts = checkFolderForChildParts(folder)
            for _, childPart in ipairs(childParts) do
              outlinePart(childPart)
            end
            iterateAndCheckFolders(folder)
          end
        end
      end

      iterateAndCheckFolders(parentFolder)
      wait()
    end
  end)
else
  for _, part in ipairs(workspace:GetDescendants()) do
    if part:FindFirstChild("CHEST_out") then
      part.CHEST_out:Destroy()
    end
  end
end
