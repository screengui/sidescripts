local parentFolder = workspace.Fluid
local function checkFolderForChildParts(folder)
  local childParts = {}
  local children = folder:GetChildren()
  for _, child in pairs(children) do
    if child.Name == "Water" then
      table.insert(childParts, child)
    end
  end
  return childParts
end

local function outlinePart(part)
  part.CanCollide = true
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
