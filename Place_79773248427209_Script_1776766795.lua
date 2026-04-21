-- Script Path: game.Players.CraftBloxPro9999.PlayerScripts.MainLocalScript
-- Took 0.42s to decompile.
-- Executor: Delta (1.0.716.875)

game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("HUDGui")
game.Players.LocalPlayer:WaitForChild("Backpack")
local v_u_1 = Instance.new("Folder")
v_u_1.Name = "Blocks"
v_u_1.Parent = workspace
local v_u_2 = Instance.new("Folder")
v_u_2.Name = "Fluid"
v_u_2.Parent = workspace
local v_u_3 = require(script.CGlobals)
v_u_3.FrameBeganOn = tick()
local v4 = require(game.ReplicatedStorage.AssetsMod.BlockInfo)
local v_u_5 = require(game.ReplicatedStorage.AssetsMod.ItemInfo)
local v_u_6 = require(game.ReplicatedStorage.AssetsMod.ItemLevels)
local v7 = require(game.ReplicatedStorage.AssetsMod.IDs)
v4.build_module(v7)
v_u_5.build_module(v7)
local v_u_8 = require(script.Parent.CTasks)
local v_u_9 = require(game.ReplicatedFirst.Shared.Enums)
local v_u_10 = require(game.ReplicatedStorage.AssetsMod.Sounds)
local v_u_11 = require(game.ReplicatedStorage.AssetsMod.Recipes)
local v12 = require(game.ReplicatedStorage.AssetsMod.Textures)
local v_u_13 = game:GetService("StarterGui")
local v_u_14 = require(script.GameUtil)
local v15 = require(script.MouseModule)
local v_u_16 = require(script.FontModule)
local v_u_17 = require(script.Effects)
local v_u_18 = require(script.BlockHighlights)
require(script.Parent.UI.ServerVersions)
game:GetService("ReplicatedStorage").GameRemotes.vipchecker:InvokeServer()
local v_u_19 = game.ReplicatedStorage
local v_u_20 = game:GetService("RunService")
local v_u_21 = game:GetService("UserInputService")
local v_u_22 = game:GetService("ContextActionService")
game:GetService("Lighting")
local v_u_23 = game:GetService("HttpService")
local v24 = game.ReplicatedStorage:WaitForChild("PlayerReadyEvent")
v24.OnClientEvent:Connect(function(p25, p26)
    -- upvalues: (copy) v_u_3
    if typeof(p25) == "table" then
        v_u_3.WorldVersion = p26
        v_u_3.PlayerData = p25
    elseif typeof(p25) == "string" then
        v_u_3.PlayerData[p25] = p26
    end
end)
v24:FireServer()
local v_u_27 = game.ReplicatedStorage.VisualRemotes
local v_u_28 = game.ReplicatedFirst.Blocks
local v_u_29 = game.ReplicatedFirst.MetaBlocks
local _ = game.Players.LocalPlayer
local v_u_30 = v_u_3.blocksize
local v_u_31 = v_u_3.viewdist
local v_u_32 = v_u_3.loaddist
local v_u_33 = v_u_3.fastdist
local v_u_34 = v7.ByID.Blocks
local v_u_35 = v7.ByName.Blocks
local v_u_36 = v7.ByName.Items
local function v42(p37)
    -- upvalues: (copy) v_u_30, (copy) v_u_28
    if game.ReplicatedFirst.Blocks:FindFirstChild(p37) then
        return game.ReplicatedFirst.Blocks:FindFirstChild(p37):Clone()
    end
    local v38 = Instance.new("Part")
    if string.find(p37, "Slab") then
        v38.Size = Vector3.new(3, 1.5, 3)
    else
        local v39 = v_u_30
        local v40 = v_u_30
        local v41 = v_u_30
        v38.Size = Vector3.new(v39, v40, v41)
        if v_u_28:FindFirstChild(p37) then
            v38.BrickColor = v_u_28:FindFirstChild(p37).BrickColor
        end
    end
    v38.Anchored = true
    v38.Material = Enum.Material.Fabric
    if p37 == "Ice" then
        v38.CustomPhysicalProperties = PhysicalProperties.new(0.92, 0, 0.15, 10, 1)
    end
    return v38
end
local v_u_43 = true
local function v_u_53(p44, p45, p46)
    -- upvalues: (copy) v_u_30
    local v47
    if type(p44) == "userdata" or string.lower((type(p44))) == "vector" then
        v47 = p44.X
        p45 = p44.Y
        p46 = p44.Z
    else
        v47 = p44
    end
    local v48 = v47 / v_u_30 + 0.5
    local v49 = math.floor(v48)
    local v50 = p45 / v_u_30 + 0.5
    local v51 = math.floor(v50)
    local v52 = p46 / v_u_30 + 0.5
    return v49, v51, math.floor(v52)
end
local v_u_54 = false
local v_u_55 = false
local v_u_56 = false
for v57, v58 in pairs(v4) do
    if not v_u_28:FindFirstChild(v57) and typeof(v58) == "table" then
        if v58.texture ~= "none" then
            if v58.texture and not v58.customBlock then
                local v59 = v58.texture
                if type(v59) == "table" then
                    local v60 = v42(v57)
                    for v61, v62 in pairs(v58.texture) do
                        local v63 = Instance.new("Decal", v60)
                        v63.Face = v61
                        v63.Texture = v12[v62]
                    end
                    if v_u_28:FindFirstChild(v57) then
                        v_u_28[v57]:Destroy()
                    end
                    v60.Name = v57
                    v60.Parent = v_u_28
                else
                    local v64 = v42(v57)
                    local v65 = v4[v57]
                    if v65 and v65.transparent then
                        v64.Transparency = 1
                    end
                    for _, v66 in pairs(Enum.NormalId:GetEnumItems()) do
                        local v67 = Instance.new("Decal", v64)
                        v67.Face = v66
                        if not v12[v58.texture] then
                            print()
                        end
                        v67.Texture = v12[v58.texture]
                    end
                    if v_u_28:FindFirstChild(v57) then
                        v_u_28[v57]:Destroy()
                    end
                    v64.Name = v57
                    v64.Parent = v_u_28
                end
            end
        end
    end
end
local v_u_68 = require(script.CWorld)
v_u_3.M_World = v_u_68
local _ = script.Particle
local v_u_69 = game.Players.LocalPlayer
local v_u_70 = v_u_69.Character
if not (v_u_70 and v_u_70.Parent) then
    v_u_70 = v_u_69.CharacterAdded:wait()
end
local v_u_71 = false
local v_u_72 = v_u_69:WaitForChild("PlayerGui")
local v_u_73 = v_u_72:WaitForChild("Settings"):WaitForChild("Hand3D").Value
v_u_72:WaitForChild("Settings"):WaitForChild("Hand3D").Changed:Connect(function()
    -- upvalues: (ref) v_u_73, (copy) v_u_72
    v_u_73 = v_u_72:WaitForChild("Settings"):WaitForChild("Hand3D").Value
end)
v_u_72:WaitForChild("Settings"):WaitForChild("RenderDist").Changed:Connect(function()
    -- upvalues: (copy) v_u_72, (ref) v_u_32, (ref) v_u_31, (copy) v_u_3
    if v_u_72:WaitForChild("Settings"):WaitForChild("RenderDist").Value == 2 then
        v_u_32 = 2
        v_u_31 = 5
        v_u_3.viewdist = 5
        return
    elseif v_u_72:WaitForChild("Settings"):WaitForChild("RenderDist").Value == 2.25 then
        v_u_32 = 2.25
        v_u_31 = 5
        v_u_3.viewdist = 5
        return
    elseif v_u_72:WaitForChild("Settings"):WaitForChild("RenderDist").Value == 2.5 then
        v_u_32 = 2.5
        v_u_31 = 5
        v_u_3.viewdist = 5
        return
    elseif v_u_72:WaitForChild("Settings"):WaitForChild("RenderDist").Value == 3 then
        v_u_32 = 3
        v_u_31 = 5
        v_u_3.viewdist = 5
        return
    elseif v_u_72:WaitForChild("Settings"):WaitForChild("RenderDist").Value == 4 then
        v_u_32 = 4
        v_u_31 = 5
        v_u_3.viewdist = 5
    elseif v_u_72:WaitForChild("Settings"):WaitForChild("RenderDist").Value == 4.5 then
        v_u_32 = 4.5
        v_u_31 = 5
        v_u_3.viewdist = 5
    end
end)
local v_u_74 = v_u_69:GetMouse()
local v_u_75 = v15.new()
local v_u_76 = Instance.new("ColorCorrectionEffect")
v_u_76.Brightness = 0
v_u_76.Contrast = -0.1
v_u_76.Saturation = -0.2
v_u_76.Parent = game.Lighting
local v_u_77 = Vector3.new()
local v_u_78 = CFrame.new(0, -1.12699997, -1, 0.707106829, 0, 0.707106829, 0, 1, -0, -0.707106829, 0, 0.707106829)
local v_u_79 = CFrame.new(0, -0.827000022, -1.15999997, 0, 0, -1.00000012, 0.707106769, 0.707106888, 0, 0.707106829, -0.707106769, 0)
local v_u_80 = CFrame.new(-0.466133118, -0.535684049, -0.845947266, 0.950247228, -0.245751619, -0.191406965, 0.308080107, 0.650695741, 0.694033086, -0.0460119694, -0.718471467, 0.694033027)
local v_u_81 = script.Slot:Clone()
local v_u_82 = script.SlotNA:Clone()
local v_u_83 = script.SlotB:Clone()
local v_u_84 = v_u_73
local v_u_85 = {}
local v_u_86 = {}
local v_u_87 = 0
local v_u_88 = nil
local v_u_89 = false
local function v_u_94(p90)
    -- upvalues: (copy) v_u_28, (copy) v_u_29
    local v91 = v_u_28:WaitForChild(p90, 3)
    if v91 then
        v91 = v91:Clone()
    end
    local v92 = v_u_29:FindFirstChild(p90)
    if v92 and v92:IsA("Instance") then
        for _, v93 in pairs(v92:GetChildren()) do
            v93:Clone().Parent = v91
        end
    end
    return v91
end
local v_u_95 = {
    [80] = 1,
    [81] = 2,
    [82] = 3,
    [83] = 4,
    [84] = 5,
    [85] = 6,
    [86] = 7,
    [87] = 8,
    [88] = 9
}
local v_u_96 = {
    [80] = 1,
    [81] = 2,
    [82] = 4,
    [83] = 5
}
local v_u_97 = 0
local v_u_98 = false
local v_u_99 = "default"
local v_u_100 = {}
local v_u_101 = {}
local v_u_102 = false
local function v_u_120(p103, p104)
    local v105 = p104 - p103
    local v106 = v105.X
    local v107 = math.abs(v106)
    local v108 = v105.Y
    local v109 = math.abs(v108)
    local v110 = v105.Z
    local v111 = math.abs(v110)
    if v109 < v107 then
        if v111 < v107 then
            local v112 = v105.X
            local v113 = math.sign(v112) * 1
            return Vector3.new(v113, 0, 0)
        else
            local v114 = v105.Z
            local v115 = math.sign(v114) * 1
            return Vector3.new(0, 0, v115)
        end
    elseif v109 < v111 then
        local v116 = v105.Z
        local v117 = math.sign(v116) * 1
        return Vector3.new(0, 0, v117)
    else
        local v118 = v105.Y
        local v119 = math.sign(v118) * 1
        return Vector3.new(0, v119, 0)
    end
end
local v_u_121 = false
local v_u_122 = 0
local v_u_123 = 0
local v_u_124 = 0
local v_u_125 = 0
local function v_u_142(p126)
    local v127 = p126 >= 60
    local v128 = p126 >= 3600
    local v129 = p126 >= 86400
    local v130 = p126 / 86400
    local v131 = math.floor(v130)
    local v132 = p126 % 86400 / 3600
    local v133 = math.floor(v132)
    local v134 = p126 % 3600 / 60
    local v135 = math.floor(v134)
    local v136 = p126 % 60
    local v137 = math.floor(v136)
    local v138 = tostring(v131)
    local v139 = tostring(v133)
    local v140 = tostring(v135)
    local v141 = tostring(v137)
    if v139:len() == 1 then
        v139 = "0" .. v139
    end
    if v140:len() == 1 then
        v140 = "0" .. v140
    end
    if v141:len() == 1 then
        v141 = "0" .. v141
    end
    if v129 then
        return v138 .. ":" .. v139 .. ":" .. v140 .. ":" .. v141
    elseif v128 then
        return tostring(v133) .. ":" .. v140 .. ":" .. v141
    elseif v127 then
        return tostring(v135) .. ":" .. v141
    else
        return tostring(v137)
    end
end
local v_u_143 = nil
local v_u_144 = false
local v_u_145 = false
local v_u_146 = nil
local v_u_147 = false
local v_u_148 = false
local v_u_149 = 10
local v_u_150 = 0.5
local v_u_151 = nil
local v_u_152 = 10
local v_u_153 = {
    [0] = "",
    [1] = "",
    [2] = "",
    [3] = "",
    [4] = ""
}
local v_u_154 = 0
local v_u_155 = {}
for v156 = 0, 26 do
    v_u_85[v156 + 36] = v156 + 1
end
local v_u_157 = {
    [80] = UDim2.new(0, 168, 0, 44),
    [81] = UDim2.new(0, 204, 0, 44),
    [82] = UDim2.new(0, 168, 0, 80),
    [83] = UDim2.new(0, 204, 0, 80)
}
local v_u_158 = {
    [80] = UDim2.new(0, 52, 0, 26),
    [81] = UDim2.new(0, 88, 0, 26),
    [82] = UDim2.new(0, 124, 0, 26),
    [83] = UDim2.new(0, 52, 0, 62),
    [84] = UDim2.new(0, 88, 0, 62),
    [85] = UDim2.new(0, 124, 0, 62),
    [86] = UDim2.new(0, 52, 0, 98),
    [87] = UDim2.new(0, 88, 0, 98),
    [88] = UDim2.new(0, 124, 0, 98)
}
local v_u_159 = {
    ["DiamondHelmet"] = 103,
    ["EmeraldHelmet"] = 103,
    ["NexusHelmet999"] = 103,
    ["LuminaHelmet999"] = 103,
    ["FireHelmet"] = 103,
    ["IceHelmet"] = 103,
    ["Grants"] = 103,
    ["OsbidianHelmet"] = 103,
    ["MangoHelmet"] = 103,
    ["SteelHelmet"] = 103,
    ["SteelHelmets"] = 103,
    ["GoldenHelmet"] = 103,
    ["RubyHelmet"] = 103,
    ["StoneHelmet"] = 103,
    ["VortexHelmet"] = 103,
    ["MoonstoneHelmet"] = 103,
    ["Hs"] = 103,
    ["FrostHelmet"] = 103,
    ["SoulHelmet"] = 103,
    ["Hyperness"] = 103,
    ["MaxwellWearable1"] = 103,
    ["VoidstarHelmet"] = 103,
    ["HellHelmet"] = 103,
    ["SantaHat"] = 103,
    ["CompactIceHelmet"] = 103,
    ["SolarHelmet"] = 103,
    ["VoidiumHelmet"] = 103,
    ["SpectriteHelmet"] = 103,
    ["USpectriteHelmet"] = 103,
    ["VoidHelmet"] = 103,
    ["MultiversalHelmet"] = 103,
    ["QuantumiteHelmet"] = 103,
    ["BlackHoleHelmet"] = 103,
    ["KawaiiHelmet"] = 103,
    ["MeteorHelmet"] = 103,
    ["BlueMeteorHelmet"] = 103,
    ["VCrystalHelmet"] = 103,
    ["AstralHelmet"] = 103,
    ["CorruptHelmet"] = 103,
    ["InfinityHelmet"] = 103,
    ["SCorruptHelmet"] = 103,
    ["SingularityHelmet"] = 103,
    ["holycow"] = 103,
    ["CelestialHelmet"] = 103,
    ["ZenithHelmet"] = 103,
    ["DivinityHelmet"] = 103,
    ["DiamondChestplate"] = 102,
    ["EmeraldChestplate"] = 102,
    ["NexusChestplate999"] = 102,
    ["LuminaChestplate999"] = 102,
    ["FireChestplate"] = 102,
    ["IceChestplate"] = 102,
    ["OsbidianChestplate"] = 102,
    ["Chestplate67"] = 102,
    ["SteelChestplate"] = 102,
    ["GoldenChestplate"] = 102,
    ["RubyChestplate"] = 102,
    ["StoneChestplate"] = 102,
    ["RonaldoShirt"] = 102,
    ["VortexChestplate"] = 102,
    ["MoonstoneChestplate"] = 102,
    ["FrostChestplate"] = 102,
    ["SoulChestplate"] = 102,
    ["rans"] = 102,
    ["gaphag"] = 102,
    ["VoidstarChestplate"] = 102,
    ["HellChestplate"] = 102,
    ["SantaShirt"] = 102,
    ["CompactIceChestplate"] = 102,
    ["SolarChestplate"] = 102,
    ["VoidiumChestplate"] = 102,
    ["SpectriteChestplate"] = 102,
    ["USpectriteChestplate"] = 102,
    ["VoidChestplate"] = 102,
    ["MultiversalChestplate"] = 102,
    ["QuantumiteChestplate"] = 102,
    ["BlackHoleChestplate"] = 102,
    ["KawaiiChestplate"] = 102,
    ["MeteorChestplate"] = 102,
    ["BlueMeteorChestplate"] = 102,
    ["VCrystalChestplate"] = 102,
    ["AstralChestplate"] = 102,
    ["CorruptChestplate"] = 102,
    ["InfinityChestplate"] = 102,
    ["SCorruptChestplate"] = 102,
    ["SingularityChestplate"] = 102,
    ["DIE"] = 102,
    ["CelestialChestplate"] = 102,
    ["ZenithChestplate"] = 102,
    ["DivinityChestplate"] = 102,
    ["DiamondLeggings"] = 101,
    ["EmeraldLeggings"] = 101,
    ["NexusLeggings999"] = 101,
    ["LuminaLeggings999"] = 101,
    ["FireLeggings"] = 101,
    ["IceLeggings"] = 101,
    ["ObsidianLeggings"] = 101,
    ["RizzLeggings"] = 101,
    ["SteelLeggings"] = 101,
    ["GoldenLeggings"] = 101,
    ["RubyLeggings"] = 101,
    ["StoneLeggings"] = 101,
    ["RonaldoPants"] = 101,
    ["magicleggings"] = 101,
    ["VortexLeggings"] = 101,
    ["FrostLeggings"] = 101,
    ["SoulLeggings"] = 101,
    ["MoonstoneLeggings"] = 101,
    ["Reality"] = 101,
    ["VoidstarLeggings"] = 101,
    ["HellLeggings"] = 101,
    ["SantaPants"] = 101,
    ["CompactIceLeggings"] = 101,
    ["SolarLeggings"] = 101,
    ["VoidiumLeggings"] = 101,
    ["SpectriteLeggings"] = 101,
    ["USpectriteLeggings"] = 101,
    ["VoidLeggings"] = 101,
    ["MultiversalLeggings"] = 101,
    ["QuantumiteLeggings"] = 101,
    ["BlackHoleLeggings"] = 101,
    ["KawaiiLeggings"] = 101,
    ["MeteorLeggings"] = 101,
    ["BlueMeteorLeggings"] = 101,
    ["VCrystalLeggings"] = 101,
    ["AstralLeggings"] = 101,
    ["CorruptLeggings"] = 101,
    ["InfinityLeggings"] = 101,
    ["SCorruptLeggings"] = 101,
    ["SingularityLeggings"] = 101,
    ["CelestialLeggings"] = 101,
    ["ZenithLeggings"] = 101,
    ["DivinityLeggings"] = 101,
    ["DiamondBoots"] = 100,
    ["EmeraldBoots"] = 100,
    ["NexusBoots999"] = 100,
    ["LuminaBoots999"] = 100,
    ["FireBoots"] = 100,
    ["IceBoots"] = 100,
    ["ObsidianBoots"] = 100,
    ["GoonBoots"] = 100,
    ["SteelBoots"] = 100,
    ["GoldenBoots"] = 100,
    ["RubyBoots"] = 100,
    ["StoneBoots"] = 100,
    ["RonaldoAdidas"] = 100,
    ["VortexBoots"] = 100,
    ["SterileShoes"] = 100,
    ["FrostBoots"] = 100,
    ["SoulBoots"] = 100,
    ["MoonstoneBoots"] = 100,
    ["Ultra40"] = 100,
    ["VoidstarBoots"] = 100,
    ["Cool"] = 100,
    ["HellBoots"] = 100,
    ["SantaShoes"] = 100,
    ["SolarBoots"] = 100,
    ["CompactIceBoots"] = 100,
    ["VoidiumBoots"] = 100,
    ["SpectriteBoots"] = 100,
    ["USpectriteBoots"] = 100,
    ["VoidBoots"] = 100,
    ["MultiversalBoots"] = 100,
    ["QuantumiteBoots"] = 100,
    ["BlackHoleBoots"] = 100,
    ["KawaiiBoots"] = 100,
    ["MeteorBoots"] = 100,
    ["BlueMeteorBoots"] = 100,
    ["VCrystalBoots"] = 100,
    ["AstralBoots"] = 100,
    ["CorruptBoots"] = 100,
    ["InfinityBoots"] = 100,
    ["SCorruptBoots"] = 100,
    ["SingularityBoots"] = 100,
    ["CelestialBoots"] = 100,
    ["ZenithBoots"] = 100,
    ["DivinityBoots"] = 100
}
local v_u_160 = {
    ["DiamondHelmet"] = 4,
    ["DiamondChestplate"] = 4,
    ["DiamondLeggings"] = 4,
    ["DiamondBoots"] = 4,
    ["SteelHelmet"] = 2,
    ["SteelChestplate"] = 2,
    ["SteelLeggings"] = 2,
    ["SteelBoots"] = 2,
    ["GoldenHelmet"] = 6,
    ["GoldenChestplate"] = 6,
    ["GoldenLeggings"] = 6,
    ["GoldenBoots"] = 6,
    ["RubyHelmet"] = 5,
    ["RubyChestplate"] = 5,
    ["RubyLeggings"] = 5,
    ["RubyBoots"] = 5,
    ["StoneHelmet"] = 1,
    ["StoneChestplate"] = 1,
    ["StoneLeggings"] = 1,
    ["StoneBoots"] = 1,
    ["MangoHelmet"] = 67,
    ["Chestplate67"] = 67,
    ["RizzLeggings"] = 67,
    ["GoonBoots"] = 67,
    ["ObsidianHelmet"] = 6,
    ["ObsidianChestplate"] = 6,
    ["ObsidianLeggings"] = 6,
    ["ObsidianBoots"] = 6,
    ["FireHelmet"] = 6,
    ["FireChestplate"] = 6,
    ["FireLeggings"] = 6,
    ["FireBoots"] = 6,
    ["IceHelmet"] = 6,
    ["IceChestplate"] = 6,
    ["IceLeggings"] = 6,
    ["IceBoots"] = 6,
    ["EmeraldHelmet"] = 6,
    ["EmeraldChestplate"] = 6,
    ["EmeraldLeggings"] = 6,
    ["EmeraldBoots"] = 6,
    ["NexusHelmet999"] = 6,
    ["NexusChestplate999"] = 6,
    ["NexusLeggings999"] = 6,
    ["NexusBoots999"] = 6,
    ["LuminaHelmet999"] = 6,
    ["LuminaChestplate999"] = 6,
    ["LuminaLeggings999"] = 6,
    ["LuminaBoots999"] = 6,
    ["VortexHelmet"] = 6,
    ["VortexChestplate"] = 6,
    ["VortexLeggings"] = 6,
    ["VortexBoots"] = 6,
    ["FrostHelmet"] = 6,
    ["FrostChestplate"] = 6,
    ["FrostLeggings"] = 6,
    ["FrostBoots"] = 6,
    ["MoonstoneHelmet"] = 6,
    ["MoonstoneChestplate"] = 6,
    ["MoonstoneLeggings"] = 6,
    ["MoonstoneBoots"] = 6,
    ["SoulHelmet"] = 6,
    ["SoulChestplate"] = 6,
    ["SoulLeggings"] = 6,
    ["SoulBoots"] = 6,
    ["HellHelmet"] = 6,
    ["HellChestplate"] = 6,
    ["HellLeggings"] = 6,
    ["HellBoots"] = 6,
    ["SantaHat"] = 6,
    ["SantaShirt"] = 6,
    ["SantaPants"] = 6,
    ["SantaBoots"] = 6,
    ["VoidstarHelmet"] = 6,
    ["VoidstarChestplate"] = 6,
    ["VoidstarLeggings"] = 6,
    ["VoidstarBoots"] = 6,
    ["CompactIceHelmet"] = 6,
    ["CompactIceChestplate"] = 6,
    ["CompactIceLeggings"] = 6,
    ["CompactIceBoots"] = 6,
    ["SolarHelmet"] = 6,
    ["SolarChestplate"] = 6,
    ["SolarLeggings"] = 6,
    ["SolarBoots"] = 6,
    ["VoidiumHelmet"] = 6,
    ["VoidiumChestplate"] = 6,
    ["VoidiumLeggings"] = 6,
    ["VoidiumBoots"] = 6,
    ["VoidHelmet"] = 6,
    ["VoidChestplate"] = 6,
    ["VoidLeggings"] = 6,
    ["VoidBoots"] = 6,
    ["MultiversalHelmet"] = 6,
    ["MultiversalChestplate"] = 6,
    ["MultiversalLeggings"] = 6,
    ["MultiversalBoots"] = 6,
    ["SpectriteHelmet"] = 6,
    ["SpectriteChestplate"] = 6,
    ["SpectriteLeggings"] = 6,
    ["SpectriteBoots"] = 6,
    ["USpectriteHelmet"] = 6,
    ["USpectriteChestplate"] = 6,
    ["USpectriteLeggings"] = 6,
    ["USpectriteBoots"] = 6,
    ["QuantumiteHelmet"] = 6,
    ["QuantumiteChestplate"] = 6,
    ["QuantumiteLeggings"] = 6,
    ["QuantumiteBoots"] = 6,
    ["BlackHoleHelmet"] = 6,
    ["BlackHoleChestplate"] = 6,
    ["BlackHoleLeggings"] = 6,
    ["BlackHoleBoots"] = 6,
    ["MeteorHelmet"] = 6,
    ["MeteorChestplate"] = 6,
    ["MeteorLeggings"] = 6,
    ["MeteorBoots"] = 6,
    ["BlueMeteorHelmet"] = 6,
    ["BlueMeteorChestplate"] = 6,
    ["BlueMeteorLeggings"] = 6,
    ["BlueMeteorBoots"] = 6,
    ["VCrystalHelmet"] = 6,
    ["VCrystalChestplate"] = 6,
    ["VCrystalLeggings"] = 6,
    ["VCrystalBoots"] = 6,
    ["AstralHelmet"] = 6,
    ["AstralChestplate"] = 6,
    ["AstralLeggings"] = 6,
    ["AstralBoots"] = 6,
    ["CorruptHelmet"] = 6,
    ["CorruptChestplate"] = 6,
    ["CorruptLeggings"] = 6,
    ["CorruptBoots"] = 6,
    ["InfinityHelmet"] = 6,
    ["InfinityChestplate"] = 6,
    ["InfinityLeggings"] = 6,
    ["InfinityBoots"] = 6,
    ["SCorruptHelmet"] = 6,
    ["SCorruptChestplate"] = 6,
    ["SCorruptLeggings"] = 6,
    ["SCorruptBoots"] = 6,
    ["SingularityHelmet"] = 6,
    ["SingularityChestplate"] = 6,
    ["SingularityBoots"] = 6,
    ["SingularityLeggings"] = 6,
    ["CelestialHelmet"] = 6,
    ["CelestialChestplate"] = 6,
    ["CelestialBoots"] = 6,
    ["CelestialLeggings"] = 6,
    ["ZenithHelmet"] = 6,
    ["ZenithChestplate"] = 6,
    ["ZenithLeggings"] = 6,
    ["ZenithBoots"] = 6,
    ["DivinityHelmet"] = 6,
    ["DivinityChestplate"] = 6,
    ["DivinityLeggings"] = 6,
    ["DivinityBoots"] = 6,
    ["rans"] = (1 / 0),
    ["gaphag"] = (1 / 0),
    ["SterileShoes"] = (1 / 0),
    ["NotSoHydro"] = (1 / 0),
    ["Reality"] = (1 / 0),
    ["Hyperness"] = (1 / 0),
    ["Ultra40"] = (1 / 0),
    ["MaxwellWearable1"] = 1,
    ["Cool"] = 696969696969,
    ["KawaiiHelmet"] = (1 / 0),
    ["KawaiiChestplate"] = (1 / 0),
    ["KawaiiLeggings"] = (1 / 0),
    ["KawaiiBoots"] = (1 / 0),
    ["DIE"] = 1,
    ["holycow"] = 1
}
local v_u_161 = nil
local v_u_162 = nil
local function v_u_168()
    -- upvalues: (ref) v_u_97, (copy) v_u_23, (copy) v_u_160, (copy) v_u_72
    v_u_97 = 0
    for v163 = 0, 3 do
        local v164 = v_u_23:JSONDecode(s_inv["Slot10" .. v163].Value)
        if v164.count > 0 and v164.name then
            v_u_97 = v_u_97 + (v_u_160[v164.name] or 0)
        end
    end
    for _, v165 in pairs(v_u_72.HUDGui.Hotbar.ArmorBar:GetChildren()) do
        local v166 = v165.Name
        if tonumber(v166) * 2 - 1 < v_u_97 then
            v165.Visible = true
            v165.ImageColor3 = Color3.new(1, 1, 1)
        else
            local v167 = v165.Name
            if tonumber(v167) * 2 - 1 == v_u_97 then
                v165.Visible = true
                v165.ImageColor3 = Color3.fromRGB(40, 40, 40)
            else
                v165.Visible = false
            end
        end
    end
end
local function v_u_170()
    -- upvalues: (ref) v_u_98, (copy) v_u_72
    if v_u_98 and (v_u_98[3] and tick() - v_u_98[4] < v_u_98[3]) then
        v_u_72.HUDGui.AttackIndicator.Visible = true
        local v169 = tick() - v_u_98[4]
        v_u_72.HUDGui.AttackIndicator.Filler.Size = UDim2.fromScale(1 - v169 / v_u_98[3], 1)
    else
        if v_u_98 then
            v_u_98[3] = false
        end
        v_u_72.HUDGui.AttackIndicator.Visible = false
    end
end
local function v_u_180()
    -- upvalues: (ref) v_u_161, (copy) v_u_81, (copy) v_u_16, (ref) v_u_162, (ref) v_u_99, (copy) v_u_3, (copy) v_u_72, (copy) v_u_5, (copy) v_u_83, (copy) v_u_94
    local v171 = v_u_161
    if not v171 then
        v_u_161 = v_u_81:Clone()
        v171 = v_u_161
        local v172 = v_u_161
        v172.BackgroundColor3 = Color3.fromHSV(0, 0, 0.5450980392156862)
        v172.Position = UDim2.new(0, 2, 0, 2)
        v_u_16.linkLabel(v172.Count)
        v_u_16.linkLabel(v172.Shadow)
        v172.MouseButton1Down:Connect(function()
            -- upvalues: (ref) v_u_162, (ref) v_u_99, (ref) v_u_3
            if v_u_162 and v_u_162[1] then
                local v173 = game.ReplicatedStorage.GameRemotes.CraftItems
                local v174
                if v_u_99 == "crafting2" then
                    v174 = v_u_3.UsingBlock
                else
                    v174 = false
                end
                v173:InvokeServer(v174)
            end
        end)
        v172.Parent = v_u_72.HUDGui.Inventory.ResultSlot
    end
    local v175 = v_u_162
    if v175 then
        v175 = v_u_162[1]
    end
    local v176 = v_u_162 and v_u_162[2] or 0
    v171.Display:ClearAllChildren()
    v171.Count.Text = v176
    v171.Shadow.Text = v176
    v171.Count.Visible = v176 > 1
    v171.Shadow.Visible = v176 > 1
    if v175 then
        v175 = v_u_5[v175]
    end
    if v175 then
        if v175.block then
            local v177 = v_u_83:Clone()
            local v178 = v_u_94(v175.block)
            v178.CFrame = CFrame.new() * CFrame.Angles(0, 3.141592653589793, 0)
            for _, v179 in pairs(v178:GetChildren()) do
                if v179:IsA("Decal") then
                    if v179.Face == Enum.NormalId.Front then
                        v179.Color3 = Color3.fromHSV(0, 0, 0.7450980392156863)
                    elseif v179.Face == Enum.NormalId.Left then
                        v179.Color3 = Color3.fromHSV(0, 0, 0.5490196078431373)
                    end
                end
            end
            v178.Parent = v177
            v177.Parent = v171.Display
            return
        end
        (script.ItemTextures:FindFirstChild(v175.texture or "missing") or script.ItemTextures.missing):Clone().Parent = v171.Display
    end
end
local function v_u_182()
    -- upvalues: (copy) v_u_72, (ref) v_u_87, (ref) v_u_88, (ref) v_u_98
    if s_inv then
        v_u_72.HUDGui.Hotbar.Selector.Position = UDim2.new(0, v_u_87 * 40 + -2, 0, -2)
        v_u_88 = s_inv["Slot" .. v_u_87]
        local v181 = game.ReplicatedStorage.GameRemotes.ChangeSlot:InvokeServer(v_u_87)
        if v181 then
            v_u_98 = { tick(), v181 }
            return
        end
        v_u_98 = false
    end
end
local function v_u_210(p183, p184, p185, p186)
    -- upvalues: (copy) v_u_23, (copy) v_u_159, (copy) v_u_5
    local v187 = s_inv
    local v188 = v187:FindFirstChild("Slot" .. p183)
    local v189 = v187:FindFirstChild("Slot" .. p184)
    if not (v188 and v189) then
        ::l2::
        game.ReplicatedStorage.GameRemotes.MoveItem:InvokeServer(p183, p184, p185, p186)
        return
    end
    local v190 = v_u_23:JSONDecode(v188.Value)
    local v191 = v_u_23:JSONDecode(v189.Value)
    local v192 = v190.name
    if v192 then
        v192 = v190.count > 0
    end
    local v193 = v191.name
    if v193 then
        v193 = v191.count > 0
    end
    local v194
    if p184 >= 100 and p184 <= 103 then
        v194 = not v193
        if v194 then
            v194 = v_u_159[v190.name] == p184
        end
    else
        v194 = true
    end
    if not v194 then
        return
    end
    if not p185 or (not v193 or (not v192 or v190.name ~= v191.name)) then
        if not p185 or (not v192 or v193) then
            if not p185 or (v192 or not v193) then
                v188.Value = v_u_23:JSONEncode(v191)
                v189.Value = v_u_23:JSONEncode(v190)
                goto l2
            end
            local v195 = v_u_5[v191.name]
            p185 = v195 and v195.maxstack or 64
            if p186 then
                local v196 = v190.count
                p186 = math.min(p186, v196)
                if p186 then
                    ::l56::
                    v190.count = p186
                    v190.name = v191.name
                    v191.count = v191.count - 1
                    v188.Value = v_u_23:JSONEncode(v190)
                    v189.Value = v_u_23:JSONEncode(v191)
                    goto l2
                end
            end
            p186 = v190.count
            goto l56
        end
        if v190.count ~= 1 then
            local v197 = {}
            for v198, v199 in pairs(v190) do
                v197[v198] = v199
            end
            local v200 = v_u_5[v190.name]
            p185 = v200 and v200.maxstack or 64
            if p186 then
                local v201 = v190.count
                v204 = math.min(p186, v201)
                if v204 then
                    ::l46::
                    local v202 = p185 - v191.count
                    local v203 = math.min(v202, v204)
                    v190.count = v190.count - v203
                    v197.count = v203
                    v188.Value = v_u_23:JSONEncode(v190)
                    v189.Value = v_u_23:JSONEncode(v197)
                    goto l2
                end
            end
            local v204 = v190.count
            goto l46
        end
        v188.Value = v_u_23:JSONEncode(v191)
        v189.Value = v_u_23:JSONEncode(v190)
        goto l2
    end
    local v205 = v_u_5[v190.name]
    p185 = v205 and v205.maxstack or 64
    if p186 then
        local v206 = v190.count
        v209 = math.min(p186, v206)
        if v209 then
            ::l31::
            local v207 = p185 - v191.count
            local v208 = math.min(v207, v209)
            v190.count = v190.count - v208
            v191.count = v191.count + v208
            v188.Value = v_u_23:JSONEncode(v190)
            v189.Value = v_u_23:JSONEncode(v191)
            goto l2
        end
    end
    local v209 = v190.count
    goto l31
end
local function v_u_362()
    -- upvalues: (copy) v_u_72, (ref) v_u_101, (ref) v_u_86, (ref) v_u_161, (ref) v_u_89, (ref) v_u_55, (copy) v_u_23, (copy) v_u_159, (copy) v_u_210, (copy) v_u_22, (copy) v_u_21, (copy) v_u_82, (copy) v_u_81, (copy) v_u_16, (copy) v_u_100, (copy) v_u_20, (copy) v_u_74, (copy) v_u_5, (copy) v_u_83, (copy) v_u_94, (ref) v_u_99, (copy) v_u_95, (copy) v_u_96, (copy) v_u_11, (ref) v_u_162, (copy) v_u_180, (copy) v_u_168, (ref) v_u_87, (copy) v_u_182, (copy) v_u_85, (ref) v_u_70, (copy) v_u_13
    v_u_72:WaitForChild("HUDGui"):WaitForChild("Hotbar")
    v_u_72.HUDGui:WaitForChild("Inventory"):WaitForChild("Slots")
    v_u_72.HUDGui.Inventory:WaitForChild("Mirror")
    task.wait()
    v_u_101 = {}
    v_u_86 = {}
    v_u_161 = nil
    for _, v_u_211 in pairs(s_inv:GetChildren()) do
        local v212 = v_u_211.Name
        local v_u_213 = tonumber(v212:sub(5))
        if v_u_213 <= 103 and v_u_213 >= -1 then
            local function v_u_236(p_u_214)
                -- upvalues: (ref) v_u_89, (ref) v_u_55, (ref) v_u_23, (copy) v_u_211, (copy) v_u_213, (ref) v_u_159, (ref) v_u_210, (ref) v_u_22, (ref) v_u_21
                local v_u_215 = 0
                local function v221()
                    -- upvalues: (ref) v_u_89, (ref) v_u_55, (ref) v_u_23, (ref) v_u_211, (ref) v_u_213, (ref) v_u_159, (ref) v_u_215, (ref) v_u_210
                    if v_u_89 then
                        if not v_u_55 then
                            local v216 = v_u_23:JSONDecode(s_inv["Slot-1"].Value)
                            local v217 = v_u_23:JSONDecode(v_u_211.Value)
                            local v218 = v216 and v216.name
                            if v218 then
                                v218 = v216.count > 0
                            end
                            local v219 = v217 and v217.name
                            if v219 then
                                v219 = v217.count > 0
                            end
                            local v220
                            if v_u_213 >= 100 and v_u_213 <= 103 then
                                v220 = not v218
                                if not v220 then
                                    if v218 then
                                        v220 = v_u_159[v216.name] == v_u_213
                                    else
                                        v220 = v218
                                    end
                                end
                            else
                                v220 = true
                            end
                            if v220 and (v218 or v219) and tick() - v_u_215 >= 0.08 then
                                if v218 then
                                    v_u_210(-1, v_u_213, true)
                                else
                                    v_u_210(v_u_213, -1)
                                end
                            end
                            v_u_215 = tick()
                        end
                    else
                        return
                    end
                end
                local function v_u_227()
                    -- upvalues: (ref) v_u_89, (ref) v_u_23, (ref) v_u_211, (ref) v_u_213, (ref) v_u_159, (ref) v_u_210
                    if v_u_89 then
                        local v222 = v_u_23:JSONDecode(s_inv["Slot-1"].Value)
                        local v223 = v_u_23:JSONDecode(v_u_211.Value)
                        local v224 = v222 and v222.name
                        if v224 then
                            v224 = v222.count > 0
                        end
                        local v225 = v223 and v223.name
                        if v225 then
                            v225 = v223.count > 0
                        end
                        local v226
                        if v_u_213 >= 100 and v_u_213 <= 103 then
                            v226 = not v224
                            if not v226 then
                                if v224 then
                                    v226 = v_u_159[v222.name] == v_u_213
                                else
                                    v226 = v224
                                end
                            end
                        else
                            v226 = true
                        end
                        if not v226 then
                            return false
                        end
                        if not v224 then
                            return not v225
                        end
                        v_u_210(-1, v_u_213, true, 1)
                        return true
                    end
                end
                local function v_u_235()
                    -- upvalues: (ref) v_u_89, (ref) v_u_23, (ref) v_u_211, (ref) v_u_213, (ref) v_u_159, (ref) v_u_210
                    if v_u_89 then
                        local v228 = v_u_23:JSONDecode(s_inv["Slot-1"].Value)
                        local v229 = v_u_23:JSONDecode(v_u_211.Value)
                        local v230 = v228 and v228.name
                        if v230 then
                            v230 = v228.count > 0
                        end
                        if v229 and v229.name then
                            local _ = v229.count > 0
                        end
                        if v_u_213 >= 100 and v_u_213 <= 103 then
                            local v231 = not v230
                            if v231 then
                                v230 = v231
                            elseif v230 then
                                v230 = v_u_159[v228.name] == v_u_213
                            end
                        else
                            v230 = true
                        end
                        if not v230 then
                            return false
                        end
                        local v232 = v_u_210
                        local v233 = v_u_213
                        local v234 = v229.count / 2
                        v232(v233, -1, true, (math.ceil(v234)))
                    end
                end
                p_u_214.MouseButton1Click:Connect(v221)
                p_u_214.MouseButton2Down:Connect(function()
                    -- upvalues: (copy) v_u_227, (copy) v_u_235
                    if not v_u_227() then
                        v_u_235()
                    end
                end)
                v_u_22:BindAction("b", v_u_227, false, Enum.KeyCode.DPadDown)
                p_u_214.MouseEnter:Connect(function()
                    -- upvalues: (copy) p_u_214, (ref) v_u_89, (ref) v_u_21, (copy) v_u_227
                    p_u_214.Highlight.BackgroundTransparency = 0.75
                    if v_u_89 and v_u_21:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                        v_u_227()
                    end
                end)
                p_u_214.MouseLeave:Connect(function()
                    -- upvalues: (copy) p_u_214
                    p_u_214.Highlight.BackgroundTransparency = 1
                end)
            end
            local v_u_237 = v_u_72.HUDGui.Inventory.Slots:FindFirstChild("Slot" .. v_u_213)
            if v_u_237 then
                local v_u_238 = v_u_213 == -1 and v_u_82:Clone() or v_u_81:Clone()
                v_u_238.BackgroundColor3 = Color3.fromHSV(0, 0, 0.5450980392156862)
                v_u_238.Position = UDim2.new(0, 2, 0, 2)
                v_u_16.linkLabel(v_u_238.Count)
                v_u_16.linkLabel(v_u_238.Shadow)
                if v_u_213 == -1 then
                    local v239 = v_u_100
                    local v240 = v_u_20.RenderStepped
                    local function v241()
                        -- upvalues: (copy) v_u_237, (ref) v_u_74
                        if v_u_237.Parent then
                            v_u_237.Position = UDim2.new(0, v_u_74.X - v_u_237.Parent.AbsolutePosition.X - 18, 0, v_u_74.Y - v_u_237.Parent.AbsolutePosition.Y - 18)
                        end
                    end
                    table.insert(v239, v240:Connect(v241))
                else
                    v_u_236(v_u_238)
                end
                v_u_238.Parent = v_u_237
                local v_u_242 = nil
                local v_u_243 = 0
                local function v269(p244)
                    -- upvalues: (ref) v_u_23, (copy) v_u_211, (ref) v_u_243, (ref) v_u_242, (copy) v_u_238, (ref) v_u_5, (ref) v_u_83, (ref) v_u_94, (copy) v_u_213, (ref) v_u_99, (ref) v_u_95, (ref) v_u_96, (ref) v_u_11, (ref) v_u_162, (ref) v_u_180, (ref) v_u_168
                    local v245 = v_u_23:JSONDecode(p244 or v_u_211.Value)
                    local v246 = v245.count
                    if v246 ~= v_u_243 or v245.name ~= v_u_242 then
                        v_u_242 = v245.name
                        v_u_243 = v246
                        v_u_238.Display:ClearAllChildren()
                        v_u_238.Count.Text = v246
                        v_u_238.Shadow.Text = v246
                        v_u_238.Count.Visible = v246 > 1
                        v_u_238.Shadow.Visible = v246 > 1
                        if v246 and (v246 > 0 and v245.name) then
                            local v247 = v_u_5[v245.name]
                            if v247 then
                                if v247.block then
                                    local v248 = v_u_83:Clone()
                                    local v249 = v_u_94(v247.block)
                                    v249.CFrame = CFrame.new() * CFrame.Angles(0, -1.5707963267948966, 0)
                                    for _, v250 in pairs(v249:GetChildren()) do
                                        if v250:IsA("Decal") then
                                            if v250.Face == Enum.NormalId.Right then
                                                v250.Color3 = Color3.fromHSV(0, 0, 0.7450980392156863)
                                            elseif v250.Face == Enum.NormalId.Front then
                                                v250.Color3 = Color3.fromHSV(0, 0, 0.5490196078431373)
                                            end
                                        end
                                    end
                                    v248.Parent = v_u_238.Display
                                    v249.Parent = v248
                                else
                                    (script.ItemTextures:FindFirstChild(v247.texture or "missing") or script.ItemTextures.missing):Clone().Parent = v_u_238.Display
                                end
                            else
                                script.ItemTextures.missing:Clone().Parent = v_u_238.Display
                            end
                        end
                        if v_u_213 >= 80 and v_u_213 <= 88 then
                            local v251 = false
                            local v252 = {}
                            if v_u_99 == "crafting2" then
                                for v253 = 80, 88 do
                                    local v254 = v_u_23:JSONDecode(s_inv["Slot" .. v253].Value)
                                    local v255 = v_u_95[v253]
                                    local v256
                                    if v254.count > 0 then
                                        v256 = v254.name
                                    else
                                        v256 = false
                                    end
                                    v252[v255] = v256
                                    if v254.count > 0 and v254.name then
                                        v251 = true
                                    end
                                end
                            else
                                for v257 = 80, 83 do
                                    local v258 = v_u_23:JSONDecode(s_inv["Slot" .. v257].Value)
                                    local v259 = v_u_96[v257]
                                    local v260
                                    if v258.count > 0 then
                                        v260 = v258.name
                                    else
                                        v260 = false
                                    end
                                    v252[v259] = v260
                                    if v258.count > 0 and v258.name then
                                        v251 = true
                                    end
                                end
                            end
                            if v251 then
                                while not (v252[1] or (v252[2] or v252[3])) do
                                    v252[1] = v252[4]
                                    v252[4] = v252[7]
                                    v252[7] = nil
                                    v252[2] = v252[5]
                                    v252[5] = v252[8]
                                    v252[8] = nil
                                    v252[3] = v252[6]
                                    v252[6] = v252[9]
                                    v252[9] = nil
                                end
                                while not (v252[1] or (v252[4] or v252[7])) do
                                    v252[1] = v252[2]
                                    v252[2] = v252[3]
                                    v252[3] = nil
                                    v252[4] = v252[5]
                                    v252[5] = v252[6]
                                    v252[6] = nil
                                    v252[7] = v252[8]
                                    v252[8] = v252[9]
                                    v252[9] = nil
                                end
                                local v261 = nil
                                for v262, v263 in pairs(v_u_11[1]) do
                                    local v264 = true
                                    for v265 = 1, 9 do
                                        if (v252[v265] or nil) ~= v262[v265] then
                                            v264 = false
                                        end
                                    end
                                    if v264 then
                                        v261 = { v263, v262[10] }
                                        break
                                    end
                                end
                                v_u_162 = v261
                                v_u_180()
                            else
                                v_u_162 = nil
                                v_u_180()
                            end
                        end
                        if v_u_213 >= 100 and v_u_213 <= 103 then
                            v_u_168()
                        end
                    end
                    local v266 = v_u_238
                    if v245.durability then
                        local v267 = v_u_5[v245.name]
                        if v267 and v267.durability then
                            local v268 = v267.durability
                            if v245.durability ~= v268 then
                                v266.Durability.dur.Size = UDim2.fromScale(v245.durability / v268, 1)
                                v266.Durability.Visible = true
                                return
                            end
                        end
                    end
                    v266.Durability.Visible = false
                end
                local v270 = v_u_100
                local v271 = v_u_211.Changed
                table.insert(v270, v271:Connect(v269))
                v_u_101[v_u_213] = v269
                local v272 = v_u_86
                table.insert(v272, v269)
                v269()
            end
            if v_u_213 >= 0 and v_u_213 <= 8 then
                local v_u_273 = v_u_81:Clone()
                v_u_273.BackgroundColor3 = Color3.fromHSV(0, 0, 0.5450980392156862)
                v_u_273.Position = UDim2.new(0, v_u_213 * 40 + 6, 0, 6)
                v_u_16.linkLabel(v_u_273.Count)
                v_u_16.linkLabel(v_u_273.Shadow)
                v_u_273.MouseButton1Click:Connect(function()
                    -- upvalues: (copy) v_u_213, (ref) v_u_87, (ref) v_u_182
                    v_u_87 = v_u_213
                    v_u_182()
                end)
                v_u_273.Parent = v_u_72.HUDGui.Hotbar
                local v_u_274 = nil
                local v_u_275 = 0
                local function v301(p276)
                    -- upvalues: (ref) v_u_23, (copy) v_u_211, (ref) v_u_275, (ref) v_u_274, (copy) v_u_273, (ref) v_u_5, (ref) v_u_83, (ref) v_u_94, (copy) v_u_213, (ref) v_u_99, (ref) v_u_95, (ref) v_u_96, (ref) v_u_11, (ref) v_u_162, (ref) v_u_180, (ref) v_u_168
                    local v277 = v_u_23:JSONDecode(p276 or v_u_211.Value)
                    local v278 = v277.count
                    if v278 ~= v_u_275 or v277.name ~= v_u_274 then
                        v_u_274 = v277.name
                        v_u_275 = v278
                        v_u_273.Display:ClearAllChildren()
                        v_u_273.Count.Text = v278
                        v_u_273.Shadow.Text = v278
                        v_u_273.Count.Visible = v278 > 1
                        v_u_273.Shadow.Visible = v278 > 1
                        if v278 and (v278 > 0 and v277.name) then
                            local v279 = v_u_5[v277.name]
                            if v279 then
                                if v279.block then
                                    local v280 = v_u_83:Clone()
                                    local v281 = v_u_94(v279.block)
                                    v281.CFrame = CFrame.new() * CFrame.Angles(0, -1.5707963267948966, 0)
                                    for _, v282 in pairs(v281:GetChildren()) do
                                        if v282:IsA("Decal") then
                                            if v282.Face == Enum.NormalId.Right then
                                                v282.Color3 = Color3.fromHSV(0, 0, 0.7450980392156863)
                                            elseif v282.Face == Enum.NormalId.Front then
                                                v282.Color3 = Color3.fromHSV(0, 0, 0.5490196078431373)
                                            end
                                        end
                                    end
                                    v280.Parent = v_u_273.Display
                                    v281.Parent = v280
                                else
                                    (script.ItemTextures:FindFirstChild(v279.texture or "missing") or script.ItemTextures.missing):Clone().Parent = v_u_273.Display
                                end
                            else
                                script.ItemTextures.missing:Clone().Parent = v_u_273.Display
                            end
                        end
                        if v_u_213 >= 80 and v_u_213 <= 88 then
                            local v283 = false
                            local v284 = {}
                            if v_u_99 == "crafting2" then
                                for v285 = 80, 88 do
                                    local v286 = v_u_23:JSONDecode(s_inv["Slot" .. v285].Value)
                                    local v287 = v_u_95[v285]
                                    local v288
                                    if v286.count > 0 then
                                        v288 = v286.name
                                    else
                                        v288 = false
                                    end
                                    v284[v287] = v288
                                    if v286.count > 0 and v286.name then
                                        v283 = true
                                    end
                                end
                            else
                                for v289 = 80, 83 do
                                    local v290 = v_u_23:JSONDecode(s_inv["Slot" .. v289].Value)
                                    local v291 = v_u_96[v289]
                                    local v292
                                    if v290.count > 0 then
                                        v292 = v290.name
                                    else
                                        v292 = false
                                    end
                                    v284[v291] = v292
                                    if v290.count > 0 and v290.name then
                                        v283 = true
                                    end
                                end
                            end
                            if v283 then
                                while not (v284[1] or (v284[2] or v284[3])) do
                                    v284[1] = v284[4]
                                    v284[4] = v284[7]
                                    v284[7] = nil
                                    v284[2] = v284[5]
                                    v284[5] = v284[8]
                                    v284[8] = nil
                                    v284[3] = v284[6]
                                    v284[6] = v284[9]
                                    v284[9] = nil
                                end
                                while not (v284[1] or (v284[4] or v284[7])) do
                                    v284[1] = v284[2]
                                    v284[2] = v284[3]
                                    v284[3] = nil
                                    v284[4] = v284[5]
                                    v284[5] = v284[6]
                                    v284[6] = nil
                                    v284[7] = v284[8]
                                    v284[8] = v284[9]
                                    v284[9] = nil
                                end
                                local v293 = nil
                                for v294, v295 in pairs(v_u_11[1]) do
                                    local v296 = true
                                    for v297 = 1, 9 do
                                        if (v284[v297] or nil) ~= v294[v297] then
                                            v296 = false
                                        end
                                    end
                                    if v296 then
                                        v293 = { v295, v294[10] }
                                        break
                                    end
                                end
                                v_u_162 = v293
                                v_u_180()
                            else
                                v_u_162 = nil
                                v_u_180()
                            end
                        end
                        if v_u_213 >= 100 and v_u_213 <= 103 then
                            v_u_168()
                        end
                    end
                    local v298 = v_u_273
                    if v277.durability then
                        local v299 = v_u_5[v277.name]
                        if v299 and v299.durability then
                            local v300 = v299.durability
                            if v277.durability ~= v300 then
                                v298.Durability.dur.Size = UDim2.fromScale(v277.durability / v300, 1)
                                v298.Durability.Visible = true
                                return
                            end
                        end
                    end
                    v298.Durability.Visible = false
                end
                local v302 = v_u_100
                local v303 = v_u_211.Changed
                table.insert(v302, v303:Connect(v301))
                local v304 = v_u_86
                table.insert(v304, v301)
                v301()
            end
            local function v340(p305)
                -- upvalues: (copy) v_u_213, (ref) v_u_82, (ref) v_u_81, (ref) v_u_16, (copy) v_u_236, (copy) v_u_211, (ref) v_u_23, (ref) v_u_5, (ref) v_u_83, (ref) v_u_94, (ref) v_u_99, (ref) v_u_95, (ref) v_u_96, (ref) v_u_11, (ref) v_u_162, (ref) v_u_180, (ref) v_u_168, (ref) v_u_100, (ref) v_u_101, (ref) v_u_86
                local v_u_306 = v_u_213 == -1 and v_u_82:Clone() or v_u_81:Clone()
                v_u_306.BackgroundColor3 = Color3.fromHSV(0, 0, 0.5450980392156862)
                v_u_306.Position = UDim2.new(0, 2, 0, 2)
                v_u_16.linkLabel(v_u_306.Count)
                v_u_16.linkLabel(v_u_306.Shadow)
                v_u_236(v_u_306)
                v_u_306.Parent = p305
                local v_u_307 = v_u_211
                local v_u_308 = v_u_213
                local v_u_309 = nil
                local v_u_310 = 0
                local function v336(p311)
                    -- upvalues: (ref) v_u_23, (copy) v_u_307, (ref) v_u_310, (ref) v_u_309, (copy) v_u_306, (ref) v_u_5, (ref) v_u_83, (ref) v_u_94, (copy) v_u_308, (ref) v_u_99, (ref) v_u_95, (ref) v_u_96, (ref) v_u_11, (ref) v_u_162, (ref) v_u_180, (ref) v_u_168
                    local v312 = v_u_23:JSONDecode(p311 or v_u_307.Value)
                    local v313 = v312.count
                    if v313 ~= v_u_310 or v312.name ~= v_u_309 then
                        v_u_309 = v312.name
                        v_u_310 = v313
                        v_u_306.Display:ClearAllChildren()
                        v_u_306.Count.Text = v313
                        v_u_306.Shadow.Text = v313
                        v_u_306.Count.Visible = v313 > 1
                        v_u_306.Shadow.Visible = v313 > 1
                        if v313 and (v313 > 0 and v312.name) then
                            local v314 = v_u_5[v312.name]
                            if v314 then
                                if v314.block then
                                    local v315 = v_u_83:Clone()
                                    local v316 = v_u_94(v314.block)
                                    v316.CFrame = CFrame.new() * CFrame.Angles(0, -1.5707963267948966, 0)
                                    for _, v317 in pairs(v316:GetChildren()) do
                                        if v317:IsA("Decal") then
                                            if v317.Face == Enum.NormalId.Right then
                                                v317.Color3 = Color3.fromHSV(0, 0, 0.7450980392156863)
                                            elseif v317.Face == Enum.NormalId.Front then
                                                v317.Color3 = Color3.fromHSV(0, 0, 0.5490196078431373)
                                            end
                                        end
                                    end
                                    v315.Parent = v_u_306.Display
                                    v316.Parent = v315
                                else
                                    (script.ItemTextures:FindFirstChild(v314.texture or "missing") or script.ItemTextures.missing):Clone().Parent = v_u_306.Display
                                end
                            else
                                script.ItemTextures.missing:Clone().Parent = v_u_306.Display
                            end
                        end
                        if v_u_308 >= 80 and v_u_308 <= 88 then
                            local v318 = false
                            local v319 = {}
                            if v_u_99 == "crafting2" then
                                for v320 = 80, 88 do
                                    local v321 = v_u_23:JSONDecode(s_inv["Slot" .. v320].Value)
                                    local v322 = v_u_95[v320]
                                    local v323
                                    if v321.count > 0 then
                                        v323 = v321.name
                                    else
                                        v323 = false
                                    end
                                    v319[v322] = v323
                                    if v321.count > 0 and v321.name then
                                        v318 = true
                                    end
                                end
                            else
                                for v324 = 80, 83 do
                                    local v325 = v_u_23:JSONDecode(s_inv["Slot" .. v324].Value)
                                    local v326 = v_u_96[v324]
                                    local v327
                                    if v325.count > 0 then
                                        v327 = v325.name
                                    else
                                        v327 = false
                                    end
                                    v319[v326] = v327
                                    if v325.count > 0 and v325.name then
                                        v318 = true
                                    end
                                end
                            end
                            if v318 then
                                while not (v319[1] or (v319[2] or v319[3])) do
                                    v319[1] = v319[4]
                                    v319[4] = v319[7]
                                    v319[7] = nil
                                    v319[2] = v319[5]
                                    v319[5] = v319[8]
                                    v319[8] = nil
                                    v319[3] = v319[6]
                                    v319[6] = v319[9]
                                    v319[9] = nil
                                end
                                while not (v319[1] or (v319[4] or v319[7])) do
                                    v319[1] = v319[2]
                                    v319[2] = v319[3]
                                    v319[3] = nil
                                    v319[4] = v319[5]
                                    v319[5] = v319[6]
                                    v319[6] = nil
                                    v319[7] = v319[8]
                                    v319[8] = v319[9]
                                    v319[9] = nil
                                end
                                local v328 = nil
                                for v329, v330 in pairs(v_u_11[1]) do
                                    local v331 = true
                                    for v332 = 1, 9 do
                                        if (v319[v332] or nil) ~= v329[v332] then
                                            v331 = false
                                        end
                                    end
                                    if v331 then
                                        v328 = { v330, v329[10] }
                                        break
                                    end
                                end
                                v_u_162 = v328
                                v_u_180()
                            else
                                v_u_162 = nil
                                v_u_180()
                            end
                        end
                        if v_u_308 >= 100 and v_u_308 <= 103 then
                            v_u_168()
                        end
                    end
                    local v333 = v_u_306
                    if v312.durability then
                        local v334 = v_u_5[v312.name]
                        if v334 and v334.durability then
                            local v335 = v334.durability
                            if v312.durability ~= v335 then
                                v333.Durability.dur.Size = UDim2.fromScale(v312.durability / v335, 1)
                                v333.Durability.Visible = true
                                return
                            end
                        end
                    end
                    v333.Durability.Visible = false
                end
                local v337 = v_u_100
                local v338 = v_u_307.Changed
                table.insert(v337, v338:Connect(v336))
                v_u_101[v_u_308] = v336
                local v339 = v_u_86
                table.insert(v339, v336)
                v336()
            end
            if v_u_213 >= 36 and v_u_213 <= 62 then
                local v341 = v_u_85[v_u_213] - 1
                v340(v_u_72.HUDGui.Inventory.Chest.ExternalSlots["Slot" .. v341])
            end
            if v_u_213 == 36 then
                v340(v_u_72.HUDGui.Inventory.Furnace.Slot0)
            elseif v_u_213 == 37 then
                v340(v_u_72.HUDGui.Inventory.Furnace.Slot1)
            elseif v_u_213 == 38 then
                v340(v_u_72.HUDGui.Inventory.Furnace.Slot2)
            end
        end
    end
    v_u_70.Archivable = true
    local v_u_342 = v_u_70:Clone()
    for _, v343 in pairs(v_u_342:GetChildren()) do
        if v343:IsA("Script") or v343:IsA("Folder") then
            v343:Destroy()
        end
    end
    v_u_70.Archivable = false
    local v344 = v_u_100
    local v345 = v_u_70.ChildAdded
    table.insert(v344, v345:Connect(function(p346)
        -- upvalues: (copy) v_u_342
        if not (p346:IsA("Script") or p346:IsA("Folder")) then
            p346:Clone().Parent = v_u_342
        end
    end))
    v_u_342.Parent = v_u_72.HUDGui.Inventory.Mirror.VPFrame
    v_u_342.PrimaryPart = v_u_342.HumanoidRootPart
    v_u_342:SetPrimaryPartCFrame(CFrame.new(0, 0.25, 0))
    v_u_342.Name = ""
    v_u_342.Humanoid.BreakJointsOnDeath = false
    v_u_342.Humanoid.NameDisplayDistance = 0
    v_u_342.HumanoidRootPart.Anchored = true
    local v347 = v_u_100
    local v348 = v_u_20.RenderStepped
    local function v360()
        -- upvalues: (ref) v_u_89, (ref) v_u_72, (ref) v_u_74, (copy) v_u_342
        if v_u_89 and v_u_72.HUDGui.Inventory.Mirror.Visible then
            local v349 = v_u_72.HUDGui.Inventory.Mirror.VPFrame.AbsolutePosition + v_u_72.HUDGui.Inventory.Mirror.VPFrame.AbsoluteSize / 2
            local v350 = Vector2.new(v_u_74.X - v349.X, v_u_74.Y - v349.Y)
            local v351 = v_u_342
            local v352 = CFrame.new
            local v353 = v350.X / 65
            local v354 = -math.tanh(v353) * 45
            local v355 = -v350.Y / 35
            v351:SetPrimaryPartCFrame(v352(Vector3.new(0, 0.25, 0), (Vector3.new(v354, v355, -50))))
            local v356 = v_u_342.Head
            local v357 = v_u_342.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0)
            local v358 = CFrame.Angles
            local v359 = v350.Y / 135
            v356.CFrame = v357 * v358(-math.tanh(v359) / 3, 0, 0) * CFrame.new(0, 0.5, 0)
        end
    end
    table.insert(v347, v348:Connect(v360))
    game.Lighting.Blur.Enabled = false
    v_u_72:WaitForChild("GamePass Shop Gui", 0.5).Enabled = true
    v_u_13:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
    task.spawn(function()
        -- upvalues: (ref) v_u_86
        task.wait()
        for _, v361 in pairs(v_u_86) do
            v361()
        end
    end)
end
local function v_u_370(p363)
    -- upvalues: (ref) v_u_99, (copy) v_u_72, (copy) v_u_158, (copy) v_u_157
    if p363 == "CraftingTable" then
        v_u_99 = "crafting2"
        v_u_72.HUDGui.Inventory.Crafting2.Visible = true
        v_u_72.HUDGui.Inventory.Crafting.Visible = false
        v_u_72.HUDGui.Inventory.Mirror.Visible = false
        v_u_72.HUDGui.Inventory.Chest.Visible = false
        v_u_72.HUDGui.Inventory.Furnace.Visible = false
        v_u_72.HUDGui.Inventory.ResultSlot.Position = UDim2.new(0, 240, 0, 62)
        v_u_72.HUDGui.Inventory.ResultSlot.Visible = true
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 100].Visible = false
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 101].Visible = false
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 102].Visible = false
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 103].Visible = false
        for v364 = 80, 88 do
            local v365 = v_u_72.HUDGui.Inventory.Slots["Slot" .. v364]
            v365.Visible = true
            v365.Position = v_u_158[v364]
        end
        return
    elseif p363 == "Chest" then
        v_u_99 = "chest"
        v_u_72.HUDGui.Inventory.Crafting2.Visible = false
        v_u_72.HUDGui.Inventory.Crafting.Visible = false
        v_u_72.HUDGui.Inventory.Mirror.Visible = false
        v_u_72.HUDGui.Inventory.Chest.Visible = true
        v_u_72.HUDGui.Inventory.Furnace.Visible = false
        v_u_72.HUDGui.Inventory.ResultSlot.Visible = false
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 100].Visible = false
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 101].Visible = false
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 102].Visible = false
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 103].Visible = false
        for v366 = 80, 88 do
            v_u_72.HUDGui.Inventory.Slots["Slot" .. v366].Visible = false
        end
        return
    elseif p363 == "Furnace" then
        v_u_99 = "furnace"
        v_u_72.HUDGui.Inventory.Crafting2.Visible = false
        v_u_72.HUDGui.Inventory.Crafting.Visible = false
        v_u_72.HUDGui.Inventory.Mirror.Visible = false
        v_u_72.HUDGui.Inventory.Chest.Visible = false
        v_u_72.HUDGui.Inventory.Furnace.Visible = true
        v_u_72.HUDGui.Inventory.ResultSlot.Visible = false
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 100].Visible = false
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 101].Visible = false
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 102].Visible = false
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 103].Visible = false
        for v367 = 80, 88 do
            v_u_72.HUDGui.Inventory.Slots["Slot" .. v367].Visible = false
        end
    else
        v_u_99 = "default"
        v_u_72.HUDGui.Inventory.Crafting.Visible = true
        v_u_72.HUDGui.Inventory.Mirror.Visible = true
        v_u_72.HUDGui.Inventory.Crafting2.Visible = false
        v_u_72.HUDGui.Inventory.Chest.Visible = false
        v_u_72.HUDGui.Inventory.Furnace.Visible = false
        v_u_72.HUDGui.Inventory.ResultSlot.Position = UDim2.new(0, 280, 0, 64)
        v_u_72.HUDGui.Inventory.ResultSlot.Visible = true
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 100].Visible = true
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 101].Visible = true
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 102].Visible = true
        v_u_72.HUDGui.Inventory.Slots["Slot" .. 103].Visible = true
        for v368 = 80, 88 do
            local v369 = v_u_72.HUDGui.Inventory.Slots["Slot" .. v368]
            if v368 >= 84 then
                v369.Visible = false
            else
                v369.Visible = true
                v369.Position = v_u_157[v368]
            end
        end
    end
end
local function v_u_380(p371)
    -- upvalues: (ref) v_u_89, (copy) v_u_72, (copy) v_u_370, (ref) v_u_86, (ref) v_u_99, (copy) v_u_23, (copy) v_u_19
    v_u_89 = not v_u_89
    if v_u_89 then
        v_u_72:WaitForChild("GamePass Shop Gui").Enabled = true
        game.Lighting.Blur.Enabled = true
        v_u_370(p371)
    else
        v_u_72:WaitForChild("GamePass Shop Gui").Enabled = true
        game.Lighting.Blur.Enabled = false
    end
    for _, v372 in pairs(v_u_86) do
        v372()
    end
    v_u_72.HUDGui.Overshadow.Visible = v_u_89
    v_u_72.HUDGui.Inventory.Visible = v_u_89
    if not v_u_89 then
        local v373 = v_u_99
        spawn(function()
            -- upvalues: (ref) v_u_23
            local v374 = v_u_23:JSONDecode(s_inv["Slot" .. -1].Value)
            if v374 and v374.count > 0 then
                game.ReplicatedStorage.GameRemotes.SortItem:InvokeServer(-1)
            end
        end)
        if v373 == "chest" then
            for v375 = 36, 88 do
                s_inv["Slot" .. v375].Value = v_u_23:JSONEncode({
                    ["count"] = 0
                })
            end
            v_u_19.GameRemotes.ExitBlock:InvokeServer()
            return
        end
        if v373 == "furnace" then
            for v376 = 36, 38 do
                s_inv["Slot" .. v376].Value = v_u_23:JSONEncode({
                    ["count"] = 0
                })
            end
            v_u_19.GameRemotes.ExitBlock:InvokeServer()
            return
        end
        for v_u_377 = 80, 88 do
            spawn(function()
                -- upvalues: (copy) v_u_377, (ref) v_u_23
                local v378 = v_u_377
                local v379 = v_u_23:JSONDecode(s_inv["Slot" .. v378].Value)
                if v379 and v379.count > 0 then
                    game.ReplicatedStorage.GameRemotes.SortItem:InvokeServer(v378)
                end
            end)
        end
    end
end
local function v383(p381, p382)
    -- upvalues: (copy) v_u_380
    if p382 and (not p382 or p382 ~= Enum.UserInputState.Begin) then
        if p381 == nil or p382 == nil then
            v_u_380()
        end
    else
        v_u_380()
    end
end
v_u_3.toggleInv = v383
v_u_3.invOpen = v_u_89
local v_u_384 = v_u_3.Platform
local v_u_385 = nil
if v_u_384 == "Mobile" and v_u_385 ~= nil then
    v_u_385.Visible = true
    v_u_385.Open.Activated:Connect(v_u_380)
end
local v_u_386 = script.Heart:Clone()
local v_u_387 = script.Hunger:Clone()
local v_u_388 = script.Bubble:Clone()
local v_u_389 = script.Armor:Clone()
local function v_u_429(p_u_390)
    -- upvalues: (copy) v_u_72, (copy) v_u_386, (copy) v_u_388, (copy) v_u_389, (ref) v_u_149, (copy) v_u_100, (copy) v_u_20, (copy) v_u_170, (copy) v_u_14
    local v_u_391 = p_u_390.Health
    local v392 = v_u_391 / 5
    local v_u_393 = math.ceil(v392)
    v_u_72:WaitForChild("HUDGui"):WaitForChild("Hotbar"):WaitForChild("HealthBar")
    wait()
    local v_u_394 = {}
    local v_u_395 = false
    local v_u_396 = false
    local v_u_397 = 0
    local v_u_398 = 0
    for v399 = 1, 10 do
        local v400 = v_u_386:Clone()
        v400.Position = UDim2.new(0, (v399 - 1) * 16, 0, 0)
        v400.Parent = v_u_72.HUDGui.Hotbar.HealthBar
        v_u_394[v399] = v400
    end
    for v401 = 1, 10 do
        local v402 = v_u_388:Clone()
        v402.Position = UDim2.new(0, (v401 - 1) * 16, 0, 0)
        v402.Parent = v_u_72.HUDGui.Hotbar.BubbleBar
        v402.Name = v401
    end
    for v403 = 1, 10 do
        local v404 = v_u_389:Clone()
        v404.Position = UDim2.new(0, (v403 - 1) * 16, 0, 0)
        v404.Parent = v_u_72.HUDGui.Hotbar.ArmorBar
        v404.Name = v403
    end
    local function v413(p405)
        -- upvalues: (ref) v_u_391, (ref) v_u_393, (ref) v_u_149, (ref) v_u_397, (ref) v_u_398, (copy) v_u_394
        local v406 = p405 - v_u_391
        v_u_391 = p405
        local v407 = p405 / 5
        local v408 = math.ceil(v407) - v_u_393
        local v409 = v_u_391 / 5
        v_u_393 = math.ceil(v409)
        if v406 < 0 then
            v_u_149 = 0
            v_u_397 = 0
        elseif v408 > 0 then
            v_u_398 = 0
        end
        for v410, v411 in pairs(v_u_394) do
            local v412 = v_u_393 >= v410 * 2 - 1
            v411.ImageColor3 = v_u_393 >= v410 * 2 and Color3.new(1, 0.07450980392156863, 0.07450980392156863) or Color3.fromHSV(0, 0, 0.1568627450980392)
            v411.Half.Visible = v412
        end
    end
    local v414 = v_u_100
    local v415 = p_u_390.HealthChanged
    table.insert(v414, v415:Connect(v413))
    v413(p_u_390.Health)
    pcall(v_u_20.UnbindFromRenderStep, v_u_20, "health")
    v_u_20:BindToRenderStep("health", Enum.RenderPriority.Character.Value + 1, function(p416)
        -- upvalues: (ref) v_u_72, (ref) v_u_170, (copy) p_u_390, (ref) v_u_14, (ref) v_u_393, (ref) v_u_395, (copy) v_u_394, (ref) v_u_397, (ref) v_u_398, (ref) v_u_396
        if v_u_72:FindFirstChild("HUDGui") then
            v_u_170()
            if p_u_390.Health == (1 / 0) or v_u_14.getGamemode() == 1 then
                v_u_72.HUDGui.Hotbar.HealthBar.Visible = false
            else
                v_u_72.HUDGui.Hotbar.HealthBar.Visible = false
                if v_u_393 <= 4 then
                    v_u_395 = true
                    if v_u_395 then
                        for v417, v418 in pairs(v_u_394) do
                            if math.random(1, 3) == 2 then
                                v418.Position = UDim2.new(0, 16 * (v417 - 1), 0, math.random(0, 1) * 2)
                            end
                        end
                    else
                        for v419, v420 in pairs(v_u_394) do
                            v420.Position = UDim2.new(0, 16 * (v419 - 1), 0, math.random(0, 1) * 2)
                        end
                    end
                elseif v_u_393 > 4 and v_u_395 then
                    v_u_395 = false
                    for v421, v422 in pairs(v_u_394) do
                        v422.Position = UDim2.new(0, 16 * (v421 - 1), 0, 0)
                    end
                end
                if v_u_397 < v_u_398 then
                    if v_u_397 <= 0.9 and (v_u_397 % 0.3 < 0.15 and not v_u_396) then
                        v_u_396 = true
                        for _, v423 in pairs(v_u_72.HUDGui.Hotbar.HealthBar:GetChildren()) do
                            v423.Outline.ImageColor3 = Color3.new(1, 1, 1)
                        end
                    elseif (v_u_397 > 0.9 or v_u_397 % 0.3 > 0.15) and v_u_396 then
                        v_u_396 = false
                        for _, v424 in pairs(v_u_72.HUDGui.Hotbar.HealthBar:GetChildren()) do
                            v424.Outline.ImageColor3 = Color3.new(0, 0, 0)
                        end
                    end
                elseif v_u_398 + 0.08 <= 0.6 and ((v_u_398 + 0.08) % 0.3 < 0.15 and not v_u_396) then
                    v_u_396 = true
                    for _, v425 in pairs(v_u_72.HUDGui.Hotbar.HealthBar:GetChildren()) do
                        v425.Outline.ImageColor3 = Color3.new(1, 1, 1)
                    end
                elseif (v_u_398 + 0.08 > 0.6 or (v_u_398 + 0.08) % 0.3 > 0.15) and v_u_396 then
                    v_u_396 = false
                    for _, v426 in pairs(v_u_72.HUDGui.Hotbar.HealthBar:GetChildren()) do
                        v426.Outline.ImageColor3 = Color3.new(0, 0, 0)
                    end
                end
            end
        end
        local v427 = v_u_397 + p416
        v_u_397 = math.clamp(v427, 0, 10)
        local v428 = v_u_398 + p416
        v_u_398 = math.clamp(v428, 0, 10)
    end)
end
function linkHunger(p_u_430)
    -- upvalues: (copy) v_u_72, (copy) v_u_387, (copy) v_u_100, (copy) v_u_20, (copy) v_u_170, (copy) v_u_14
    local v_u_431 = p_u_430.Hunger.Value
    local v432 = v_u_431 / 5
    local v_u_433 = math.ceil(v432)
    v_u_72:WaitForChild("HUDGui"):WaitForChild("Hotbar"):WaitForChild("HungerBar")
    wait()
    local v_u_434 = {}
    local v_u_435 = false
    local v_u_436 = false
    for v437 = 1, 10 do
        local v438 = v_u_387:Clone()
        v438.Position = UDim2.new(0, (v437 - 1) * 16, 0, 0)
        v438.Parent = v_u_72.HUDGui.Hotbar.HungerBar
        v_u_434[v437] = v438
    end
    local function v445(p439)
        -- upvalues: (ref) v_u_431, (ref) v_u_433, (copy) v_u_434
        local _ = p439 - v_u_431
        v_u_431 = p439
        local v440 = p439 / 5
        local _ = math.ceil(v440) - v_u_433
        local v441 = v_u_431 / 5
        v_u_433 = math.ceil(v441)
        for v442, v443 in pairs(v_u_434) do
            local v444 = v_u_433 >= v442 * 2 - 1
            v443.ImageColor3 = v_u_433 >= v442 * 2 and Color3.new(1, 1, 1) or Color3.fromHSV(0, 0, 0.1568627450980392)
            v443.Half.Visible = v444
        end
    end
    local v446 = v_u_100
    local v447 = p_u_430.Hunger.Changed
    table.insert(v446, v447:Connect(v445))
    v445(p_u_430.Hunger.Value)
    pcall(v_u_20.UnbindFromRenderStep, v_u_20, "hunger")
    v_u_20:BindToRenderStep("hunger", Enum.RenderPriority.Character.Value + 1, function(_)
        -- upvalues: (ref) v_u_72, (ref) v_u_170, (copy) p_u_430, (ref) v_u_14, (ref) v_u_433, (ref) v_u_435, (copy) v_u_434, (ref) v_u_436
        if v_u_72:FindFirstChild("HUDGui") then
            v_u_170()
            if p_u_430.Hunger.Value == 100 or v_u_14.getGamemode() == 1 then
                v_u_72.HUDGui.Hotbar.HungerBar.Visible = false
            else
                v_u_72.HUDGui.Hotbar.HungerBar.Visible = false
                if v_u_433 <= 4 then
                    v_u_435 = true
                    if v_u_435 then
                        for v448, v449 in pairs(v_u_434) do
                            if math.random(1, 3) == 2 then
                                v449.Position = UDim2.new(0, 16 * (v448 - 1), 0, math.random(0, 1) * 2)
                            end
                        end
                    else
                        for v450, v451 in pairs(v_u_434) do
                            v451.Position = UDim2.new(0, 16 * (v450 - 1), 0, math.random(0, 1) * 2)
                        end
                    end
                elseif v_u_433 > 4 and v_u_435 then
                    v_u_435 = false
                    for v452, v453 in pairs(v_u_434) do
                        v453.Position = UDim2.new(0, 16 * (v452 - 1), 0, 0)
                    end
                end
                if not v_u_436 then
                    v_u_436 = true
                    for _, v454 in pairs(v_u_72.HUDGui.Hotbar.HungerBar:GetChildren()) do
                        v454.Outline.ImageColor3 = Color3.new(1, 1, 1)
                    end
                    return
                end
            end
        end
    end)
end
local function v_u_457()
    -- upvalues: (copy) v_u_72, (ref) v_u_152
    for _, v455 in pairs(v_u_72.HUDGui.Hotbar.BubbleBar:GetChildren()) do
        local v456 = v455.Name
        if tonumber(v456) - 1 < v_u_152 then
            v455.Visible = true
        else
            v455.Visible = false
        end
    end
end
local function v_u_519(p458)
    -- upvalues: (copy) v_u_8, (copy) v_u_155, (copy) v_u_23, (copy) v_u_5, (copy) v_u_94, (ref) v_u_31, (copy) v_u_30, (ref) v_u_53, (copy) v_u_68
    local v459 = p458[1]
    p458[1] = 0
    for _, v460 in pairs(workspace.Entities:GetChildren()) do
        v_u_8.TryToYield_lite()
        local v461 = v_u_155[v460]
        local v462 = v_u_23:JSONDecode(v460.Value)
        if not v461 then
            v461 = {
                ["spawned"] = time()
            }
            local v463 = v462.pos
            local v464 = unpack
            v461.lastSPos = Vector3.new(v464(v463))
            local v465 = v462.pos
            local v466 = unpack
            v461.pos = Vector3.new(v466(v465))
            local v467 = v462.pos
            local v468 = unpack
            v461.vel = Vector3.new(v468(v467))
            v461.oSize = Vector3.new()
            v461.data = v462
            v_u_155[v460] = v461
            if v460.Name == "item" then
                local v469 = v_u_5[v462.name]
                local v470 = nil
                local v471
                if v469 then
                    if v469.block then
                        v471 = v_u_94(v469.block)
                        if v471 then
                            v471.Size = Vector3.new(0.61, 0.61, 0.61)
                            for _, v472 in pairs(v471:GetChildren()) do
                                if v472:IsA("Texture") then
                                    v472.StudsPerTileU = 0.61
                                    v472.StudsPerTileV = 0.61
                                end
                            end
                            v461.oSize = v471.Size
                            v471.CanCollide = false
                            v471.Anchored = true
                        else
                            v471 = v470
                        end
                    else
                        v471 = v470
                    end
                    if not v471 then
                        local v473 = (script.ItemTextures:FindFirstChild(v469.texture or "missing") or script.ItemTextures.missing):Clone()
                        v471 = Instance.new("Part")
                        v471.Size = Vector3.new(1.2, 1.2, 0.05)
                        v461.oSize = v471.Size
                        v471.Transparency = 1
                        v471.CanCollide = false
                        v471.Anchored = true
                        local v474 = Instance.new("SurfaceGui")
                        v474.CanvasSize = Vector2.new(32, 32)
                        v474.Face = Enum.NormalId.Front
                        v474.LightInfluence = 1
                        v473:Clone().Parent = v474
                        local v475 = Instance.new("SurfaceGui")
                        v475.CanvasSize = Vector2.new(32, 32)
                        v475.Face = Enum.NormalId.Back
                        v475.LightInfluence = 1
                        v473.Parent = v475
                        v474.Parent = v471
                        v475.Parent = v471
                    end
                else
                    v471 = v470
                end
                if v471 then
                    v471.Parent = workspace
                    v461.part = v471
                end
            end
        end
        if v460.Name == "item" then
            if v462.fadeTo then
                if v461.fadeTo then
                    v461.fadeTo = v461.fadeTo + v459
                else
                    v461.fadeTo = v459
                end
            end
            if v461.part then
                local v476 = v462.pos
                local v477 = unpack
                local v478 = Vector3.new(v477(v476))
                if v478 ~= v461.lastSPos then
                    v461.lastSPos = v478
                    v461.pos = v478
                    local v479 = v462.vel
                    local v480 = unpack
                    v461.vel = Vector3.new(v480(v479))
                end
                local v481 = v461.pos
                local v482 = (v481 - workspace.CurrentCamera.CFrame.Position).Magnitude
                if v482 < v_u_31 * 16 then
                    if v461.fadeTo then
                        local v483 = v462.fadeTo
                        local v484 = unpack
                        local v485 = Vector3.new(v484(v483))
                        local v486 = v461.fadeTo * 10
                        v481 = v481:Lerp(v485, (math.min(1, v486)))
                        if v461.fadeTo * 10 > 1 then
                            v461.part.Parent = nil
                        else
                            local v487 = v461.part
                            local v488 = v461.oSize
                            local v489 = v461.fadeTo * 10
                            v487.Size = v488 * (1 - math.min(1, v489))
                            v461.part.Parent = workspace
                        end
                    else
                        v461.part.Parent = workspace
                    end
                    local v490 = v461.part
                    local v491 = CFrame.new(v481)
                    local v492 = CFrame.new
                    local v493 = (time() - v461.spawned) * 2.4
                    v490.CFrame = v491 * v492(0, math.cos(v493) / 3, 0) * CFrame.Angles(0, (time() - v461.spawned) / 1 % 6.283185307179586, 0)
                else
                    v461.part.Parent = nil
                end
                local v494 = v461.vel
                if not v461.fadeTo and v482 < v_u_30 * 8 then
                    v481 = v481 + v494 * v459
                    local v495 = -16 * v_u_30 * v459
                    v494 = v494 + Vector3.new(0, v495, 0)
                    local v496 = v481.X
                    local v497 = v481.Y - 0.82
                    local v498 = v481.Z
                    local v499 = Vector3.new(v496, v497, v498)
                    local v500, v501, v502 = v_u_53(v481.X, v481.Y, v481.Z)
                    local v503, v504, v505 = v_u_53(v499.X, v499.Y, v499.Z)
                    local v506, _ = v_u_68.getBlock(v500, v501, v502)
                    local v507, _ = v_u_68.getBlock(v503, v504, v505)
                    if v506 and v506.id then
                        local v508 = Vector3.new(v500, v501, v502) * v_u_30 - v481
                        local v509 = v481.X
                        local v510 = v481.Y
                        local v511 = v481.Z
                        v481 = Vector3.new(v509, v510, v511) - v508 / 2
                        local v512 = v494.X * 0.2
                        local v513 = v494.Z * 0.2
                        v494 = Vector3.new(v512, 1, v513)
                    elseif v507 and v507.id then
                        local v514 = v481.X
                        local v515 = v504 * v_u_30 + v_u_30 / 2 + 0.8
                        local v516 = v481.Z
                        v481 = Vector3.new(v514, v515, v516)
                        local v517 = v494.X * 0.6
                        local v518 = v494.Z * 0.6
                        v494 = Vector3.new(v517, 0, v518)
                    end
                end
                v461.pos = v481
                v461.vel = v494
            end
        end
    end
end
local v_u_520 = { 0 }
local v_u_521 = {}
v_u_20:BindToRenderStep("eloop", Enum.RenderPriority.Camera.Value + 1, function(p522)
    -- upvalues: (copy) v_u_520, (copy) v_u_8, (copy) v_u_519, (copy) v_u_155
    local v523 = v_u_520
    v523[1] = v523[1] + p522
    if #v_u_8.Pools.EntitiesWorker.Pool <= 1 then
        v_u_8.NewTask(coroutine.create(v_u_519), v_u_520, "EntitiesWorker")
    end
    debug.profilebegin("L1")
    for v524, v525 in pairs(v_u_155) do
        if v524.Parent ~= workspace.Entities then
            if v525.part then
                v525.part:Destroy()
            end
            v_u_155[v524] = nil
        end
    end
    debug.profileend()
end)
v_u_20:BindToRenderStep("ploop", Enum.RenderPriority.Camera.Value + 1, function()
    -- upvalues: (copy) v_u_521, (copy) v_u_23, (copy) v_u_5, (copy) v_u_94, (copy) v_u_79, (copy) v_u_78, (copy) v_u_80
    debug.profilebegin("L1")
    local v526 = {}
    for v527, v528 in pairs(v_u_521) do
        if not v527:IsDescendantOf(workspace) then
            if v528[1] then
                v528[1]:Destroy()
            end
            table.insert(v526, v527)
        end
    end
    debug.profileend()
    debug.profilebegin("L2")
    for _, v529 in pairs(v526) do
        v_u_521[v529] = nil
    end
    debug.profileend()
    debug.profilebegin("L3")
    for _, v_u_530 in pairs(game.Players:GetPlayers()) do
        if v_u_530 ~= game.Players.LocalPlayer then
            pcall(function()
                -- upvalues: (copy) v_u_530, (ref) v_u_521, (ref) v_u_23, (ref) v_u_5, (ref) v_u_94, (ref) v_u_79, (ref) v_u_78, (ref) v_u_80
                local v531 = v_u_530.Character
                if v531 then
                    v531 = v531:FindFirstChild("HumanoidRootPart")
                end
                if v531 and v_u_530.Character:FindFirstChild("Right Arm") then
                    if not v_u_521[v_u_530.Character] then
                        v_u_521[v_u_530.Character] = {}
                    end
                    local v532 = v_u_521[v_u_530.Character]
                    local v533 = nil
                    local v534 = v_u_530.Character:FindFirstChild("Inventory")
                    local v535 = v_u_530.Character:FindFirstChild("SelectedSlot")
                    if v534 and v535 then
                        local v536 = v534:FindFirstChild("Slot" .. v535.Value)
                        if v536 then
                            local v537 = v_u_23:JSONDecode(v536.Value)
                            if v537 and (v537.name and v537.count > 0) then
                                v533 = v537.name
                            end
                        end
                    end
                    if v532[2] ~= v533 then
                        v532[2] = v533
                        if v532[1] then
                            v532[1]:Destroy()
                        end
                        if v532[2] then
                            local v538 = v_u_5[v532[2]]
                            local v539 = nil
                            local v540 = 0
                            if v538 then
                                if v538.block then
                                    local v541 = v_u_94(v538.block)
                                    if v541 then
                                        v539 = v541:Clone()
                                        v539.Size = Vector3.new(1.3, 1.3, 1.3)
                                        v539.CanCollide = false
                                        v539.Anchored = true
                                        v540 = 2
                                    end
                                end
                                if not v539 then
                                    local v542 = (script.ItemTextures:FindFirstChild(v538.texture or "missing") or script.ItemTextures.missing):Clone()
                                    v539 = Instance.new("Part")
                                    v539.Size = Vector3.new(1.3, 1.3, 0.05)
                                    v539.Transparency = 1
                                    v539.CanCollide = false
                                    v539.Anchored = true
                                    for _, v543 in pairs(v539:GetChildren()) do
                                        if v543:IsA("Texture") then
                                            v543.StudsPerTileU = 1.3
                                            v543.StudsPerTileV = 1.3
                                            v543.OffsetStudsU = 0.65
                                            v543.OffsetStudsV = 0.65
                                        end
                                    end
                                    local v544 = Instance.new("SurfaceGui")
                                    v544.CanvasSize = Vector2.new(32, 32)
                                    v544.Face = Enum.NormalId.Front
                                    v544.LightInfluence = 1
                                    v542:Clone().Parent = v544
                                    local v545 = Instance.new("SurfaceGui")
                                    v545.CanvasSize = Vector2.new(32, 32)
                                    v545.Face = Enum.NormalId.Back
                                    v544.LightInfluence = 1
                                    v542.Parent = v545
                                    v544.Parent = v539
                                    v545.Parent = v539
                                    v540 = 1
                                end
                            end
                            if v539 then
                                local v546
                                if v540 == 3 then
                                    v546 = v_u_79
                                elseif v540 == 2 then
                                    v546 = v_u_78
                                else
                                    v546 = v_u_80
                                end
                                v539.Massless = true
                                v539.Anchored = false
                                v539.CFrame = v_u_530.Character["Right Arm"].CFrame * v546
                                local v547 = Instance.new("WeldConstraint")
                                v547.Part0 = v_u_530.Character["Right Arm"]
                                v547.Part1 = v539
                                v547.Parent = v539
                                v539.Parent = v_u_530.Character
                                v532[1] = v539
                            end
                        end
                    end
                end
            end)
        end
    end
    debug.profileend()
end)
v_u_20.Heartbeat:Connect(function(_)
    -- upvalues: (copy) v_u_8
    v_u_8.update()
    debug.profilebegin("Tasks")
    v_u_8.Resume()
    debug.profileend()
end)
local function v_u_557(p548, p549, p550)
    -- upvalues: (copy) v_u_30
    local v551
    if type(p548) == "userdata" or string.lower((type(p548))) == "vector" then
        v551 = p548.X
        p549 = p548.Y
        p550 = p548.Z
    else
        v551 = p548
    end
    local v552 = v551 / v_u_30 + 0.5
    local v553 = math.floor(v552)
    local v554 = p549 / v_u_30 + 0.5
    local v555 = math.floor(v554)
    local v556 = p550 / v_u_30 + 0.5
    return v553, v555, math.floor(v556)
end
local v_u_558 = 0
local v_u_559 = 0
local v_u_560 = false
local v_u_561 = 0
local v_u_562 = 0
local v_u_563 = 0
local v_u_564 = workspace.CurrentCamera.CFrame
local function v565()
    -- upvalues: (ref) v_u_564
    workspace.CurrentCamera.CFrame = v_u_564
end
local v566 = Instance.new("Part")
v566.Size = Vector3.new(1, 1, 0.05)
v566.Transparency = 1
v566.CanCollide = false
v566.Anchored = true
v566.Parent = nil
v566.CastShadow = false
v566.Name = "HandTexPart"
local v567 = Instance.new("SurfaceGui")
v567.Name = "handUI_Front"
v567.Face = Enum.NormalId.Front
v567.CanvasSize = Vector2.new(32, 32)
v567.LightInfluence = 0.9
v567.Parent = v566
local v_u_568 = script.Hand:Clone()
v_u_568.Parent = workspace.CurrentCamera
local v_u_569 = {
    v566:Clone(),
    v566:Clone(),
    v566:Clone(),
    v566:Clone(),
    v566:Clone(),
    v566:Clone(),
    v566:Clone(),
    v566:Clone(),
    v566:Clone(),
    v566:Clone(),
    v566:Clone()
}
v_u_569[1].handUI_Front.LightInfluence = 0.65
local function v_u_573()
    -- upvalues: (copy) v_u_569
    for _, v570 in pairs(v_u_569) do
        for _, v571 in pairs(v570:GetChildren()) do
            for _, v572 in pairs(v571:GetChildren()) do
                v572:Destroy()
            end
        end
        v570.Parent = nil
    end
end
local v_u_574 = "none"
local v_u_575 = nil
script.Cloud:Clone().Parent = workspace
local v_u_576 = Vector3.new(0, 0, 0)
local function v709(p577)
    -- upvalues: (ref) v_u_564, (ref) v_u_558, (ref) v_u_559, (ref) v_u_70, (ref) v_u_145, (copy) v_u_30, (copy) v_u_68, (ref) v_u_557, (copy) v_u_34, (copy) v_u_10, (copy) v_u_17, (copy) v_u_27, (ref) v_u_560, (ref) v_u_576, (ref) v_u_563, (ref) v_u_561, (ref) v_u_149, (ref) v_u_562, (ref) v_u_88, (copy) v_u_23, (ref) v_u_575, (copy) v_u_5, (ref) v_u_568, (copy) v_u_573, (copy) v_u_94, (ref) v_u_574, (ref) v_u_84, (copy) v_u_569, (ref) v_u_124, (copy) v_u_76, (ref) v_u_150, (copy) v_u_14, (copy) v_u_19, (copy) v_u_35, (ref) v_u_125, (copy) v_u_72, (copy) v_u_153, (copy) v_u_142
    local v578 = workspace.CurrentCamera
    debug.profilebegin("Cam")
    local v579 = v578.CFrame * v_u_564:Inverse()
    CFrame.new(Vector3.new(), v579.LookVector)
    local v580 = v_u_564:ToEulerAnglesYXZ()
    v_u_564 = v578.CFrame
    debug.profilebegin("Consts")
    local v581 = -v_u_558
    local v582 = math.sin(v581) / 6 * v_u_559
    local v583 = v_u_558
    local v584 = math.cos(v583)
    local v585 = math.abs(v584) / 4 * v_u_559
    local v586 = v_u_558
    local v587 = math.cos(v586)
    local v588 = -math.abs(v587) / 90 * v_u_559
    local v589 = -v_u_558
    local v590 = math.sin(v589) / 200 * v_u_559
    debug.profileend()
    debug.profilebegin("Setup")
    local v591 = v_u_70
    if v591 then
        v591 = v_u_70:FindFirstChild("Humanoid")
    end
    local v_u_592 = v_u_70
    if v_u_592 then
        v_u_592 = v_u_70:FindFirstChild("HumanoidRootPart")
    end
    local function v599()
        -- upvalues: (ref) v_u_145, (copy) v_u_592, (ref) v_u_30, (ref) v_u_68, (ref) v_u_557, (ref) v_u_34, (ref) v_u_10, (ref) v_u_17
        if v_u_145 then
            local v593 = v_u_592.Position
            local v594 = -3 - v_u_30 / 2
            local v595 = v593 + Vector3.new(0, v594, 0)
            local v596, _ = v_u_68.getBlock(v_u_557(v595.X, v595.Y, v595.Z))
            local v597 = v596 and (v596.id and v_u_34[v596.id])
            if v597 then
                local v598 = v_u_10.Material[v597.material] or v_u_10.Material.default
                v_u_17.playSound(v_u_592.Position + Vector3.new(0, -3, 0), v598)
            end
        end
    end
    debug.profileend()
    debug.profilebegin("SoundsNNeck")
    if v591 and v_u_592 then
        local v600 = v_u_70:FindFirstChild("Head")
        local v601 = v_u_70:FindFirstChild("Torso")
        if v600 and (v601 and v601:FindFirstChild("Neck")) then
            local v602, _, _ = v578.CFrame:ToEulerAnglesYXZ()
            if not _lastNeckUpdate or tick() - _lastNeckUpdate >= 0.3 then
                _lastNeckUpdate = tick()
                v_u_27.ChangeNeckWeld:FireServer(-v602)
            end
        end
        local v603 = v_u_592.Velocity
        if v591.MoveDirection.Magnitude > 0 and v_u_145 then
            local v604 = v_u_558
            local v605 = v603.X
            local v606 = v603.Z
            v_u_558 = (v604 + Vector3.new(v605, 0, v606).Magnitude / v_u_30 * 1.8 * p577) % 6.283185307179586
            local v607 = v_u_559
            v_u_559 = v607 + 0.1 * (1 - v607)
            if (v_u_558 >= 4.71238898038469 or v_u_558 < 1.5707963267948966) and not v_u_560 then
                v_u_560 = true
                v599()
            elseif v_u_558 < 4.71238898038469 and (v_u_558 >= 1.5707963267948966 and v_u_560) then
                v_u_560 = false
                v599()
            end
        else
            local v608 = v_u_559
            v_u_559 = v608 + 0.2 * (0 - v608)
        end
        if v_u_576.Magnitude < 0.01 and v591.MoveDirection.Magnitude <= 0 then
            v_u_576 = Vector3.new(0, 0, 0)
        else
            v_u_576 = v_u_576:Lerp(v591.MoveDirection, 0.2 * p577 * 60)
        end
        game.Players.LocalPlayer:Move(v_u_576, nil)
        local v609 = v_u_563
        local v610 = v_u_592.Velocity.Y / 100
        v_u_563 = v609 + 0.4 * (math.tanh(v610) / 10 - v609)
    end
    local v611 = v_u_149 * 12 - 0.1
    v_u_561 = (1 - math.clamp(v611, 0, 1)) * 1
    local v612 = v_u_562
    v_u_562 = v612 + 0.15 * (v_u_561 - v612)
    if v591 then
        local v613 = v582 + 0
        local v614 = v585 + 0.3
        v591.CameraOffset = Vector3.new(v613, v614, 0)
    end
    local v615 = v578.CFrame * CFrame.new(0, 0, -0.45) * CFrame.Angles(v580 * 0.125, 0, 0)
    v578.CFrame = v578.CFrame * CFrame.new(0, 0, -0.45) * CFrame.Angles(v580 * 0.125 + v_u_563 + v588, 0, v_u_562 + v590)
    debug.profileend()
    debug.profilebegin("Hand")
    local v616 = nil
    if v_u_88 then
        local v617 = v_u_23:JSONDecode(v_u_88.Value)
        if v617.name and v617.count > 0 then
            v616 = v617.name
        end
    end
    if v616 ~= v_u_575 then
        v_u_575 = v616
        if v616 then
            local v618 = v_u_5[v616]
            if v618 then
                if v618.block then
                    if v_u_568 then
                        v_u_568:Destroy()
                    end
                    v_u_573()
                    local v619 = v_u_94(v618.block)
                    if v619 then
                        v_u_568 = v619
                        v_u_568.Size = Vector3.new(0.7, 0.7, 0.7)
                        for _, v620 in pairs(v_u_568:GetChildren()) do
                            if v620:IsA("Texture") then
                                v620.StudsPerTileU = 0.7
                                v620.StudsPerTileV = 0.7
                                v620.OffsetStudsU = 0.35
                                v620.OffsetStudsV = 0.35
                            end
                        end
                        v_u_568.CanCollide = false
                        v_u_568.Anchored = true
                        v_u_568.Parent = v578
                        v_u_574 = "block"
                    end
                else
                    if v_u_568 then
                        v_u_568:Destroy()
                    end
                    v_u_573()
                    local v621 = (script.ItemTextures:FindFirstChild(v618.texture or "missing") or script.ItemTextures.missing):Clone()
                    local v622 = {
                        ["stewie"] = {
                            ["frames"] = 28,
                            ["fps"] = 15,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 8),
                            ["reverse_at_end"] = false
                        },
                        ["infsword"] = {
                            ["frames"] = 9,
                            ["fps"] = 11,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 8),
                            ["reverse_at_end"] = true
                        },
                        ["infplate"] = {
                            ["frames"] = 9,
                            ["fps"] = 11,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 8),
                            ["reverse_at_end"] = true
                        },
                        ["inflegs"] = {
                            ["frames"] = 9,
                            ["fps"] = 11,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 8),
                            ["reverse_at_end"] = true
                        },
                        ["infpick"] = {
                            ["frames"] = 9,
                            ["fps"] = 11,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 8),
                            ["reverse_at_end"] = true
                        },
                        ["galaxia"] = {
                            ["frames"] = 6,
                            ["fps"] = 12,
                            ["size"] = Vector2.new(64, 64),
                            ["grid"] = Vector2.new(1, 6),
                            ["reverse_at_end"] = false
                        },
                        ["lunaria"] = {
                            ["frames"] = 6,
                            ["fps"] = 12,
                            ["size"] = Vector2.new(64, 64),
                            ["grid"] = Vector2.new(1, 6),
                            ["reverse_at_end"] = false
                        },
                        ["meatball"] = {
                            ["frames"] = 8,
                            ["fps"] = 11,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 8),
                            ["reverse_at_end"] = true
                        },
                        ["larpsword"] = {
                            ["frames"] = 9,
                            ["fps"] = 11,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 9),
                            ["reverse_at_end"] = true
                        },
                        ["larpplate"] = {
                            ["frames"] = 9,
                            ["fps"] = 11,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 9),
                            ["reverse_at_end"] = true
                        },
                        ["larplegs"] = {
                            ["frames"] = 9,
                            ["fps"] = 11,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 9),
                            ["reverse_at_end"] = true
                        },
                        ["larppick"] = {
                            ["frames"] = 9,
                            ["fps"] = 11,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 9),
                            ["reverse_at_end"] = true
                        },
                        ["starbeam"] = {
                            ["frames"] = 9,
                            ["fps"] = 11,
                            ["size"] = Vector2.new(8, 8),
                            ["grid"] = Vector2.new(1, 9),
                            ["reverse_at_end"] = true
                        },
                        ["dstarbeam"] = {
                            ["frames"] = 9,
                            ["fps"] = 11,
                            ["size"] = Vector2.new(8, 8),
                            ["grid"] = Vector2.new(1, 9),
                            ["reverse_at_end"] = true
                        },
                        ["singul"] = {
                            ["frames"] = 6,
                            ["fps"] = 9,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 6),
                            ["reverse_at_end"] = false
                        },
                        ["darknessblade"] = {
                            ["frames"] = 6,
                            ["fps"] = 12,
                            ["size"] = Vector2.new(32, 32),
                            ["grid"] = Vector2.new(1, 6),
                            ["reverse_at_end"] = false
                        },
                        ["corruptionblade"] = {
                            ["frames"] = 9,
                            ["fps"] = 11,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 9),
                            ["reverse_at_end"] = false
                        },
                        ["endestpearl"] = {
                            ["frames"] = 5,
                            ["fps"] = 6,
                            ["size"] = Vector2.new(16, 16),
                            ["grid"] = Vector2.new(1, 4),
                            ["reverse_at_end"] = true
                        }
                    }
                    if v_u_84 then
                        for v623 = 1, #v_u_569 do
                            local v624 = v_u_569[v623]
                            v624.Parent = workspace.CurrentCamera
                            local v_u_625 = v621:Clone()
                            v_u_625.Parent = v624.handUI_Front
                            local v_u_626 = v622[v_u_625.Name]
                            if v_u_626 then
                                v_u_625.ImageRectSize = v_u_626.size
                                task.spawn(function()
                                    -- upvalues: (copy) v_u_625, (copy) v_u_626
                                    local v627 = 0
                                    local v628 = 1
                                    while v_u_625.Parent do
                                        v627 = v627 + v628
                                        if v_u_626.reverse_at_end then
                                            if v_u_626.frames - 1 <= v627 then
                                                v627 = v_u_626.frames - 1
                                                v628 = -1
                                            elseif v627 <= 0 then
                                                v627 = 0
                                                v628 = 1
                                            end
                                        else
                                            v627 = v627 % v_u_626.frames
                                        end
                                        local v629 = v627 % v_u_626.grid.X
                                        local v630 = v627 / v_u_626.grid.X
                                        local v631 = math.floor(v630)
                                        v_u_625.ImageRectOffset = Vector2.new(v629 * v_u_626.size.X, v631 * v_u_626.size.Y)
                                        task.wait(1 / v_u_626.fps)
                                    end
                                end)
                            end
                            v624.Anchored = false
                            if v623 ~= 1 then
                                v624.CFrame = v_u_569[1].CFrame * CFrame.new((v623 - 1) * -0.0003920685613182424, 0, (v623 - 1) * 0.003980738906688788)
                                local v632 = Instance.new("WeldConstraint", v624.handUI_Front)
                                v632.Part0 = v_u_569[1]
                                v632.Part1 = v_u_569[v623]
                            end
                        end
                    else
                        for _, v633 in pairs(v_u_569) do
                            for _, v634 in pairs(v633:GetChildren()) do
                                for _, v635 in pairs(v634:GetChildren()) do
                                    v635:Destroy()
                                end
                            end
                            if v633 ~= v_u_569[1] then
                                v633.Parent = nil
                            end
                        end
                    end
                    v_u_569[1].Parent = workspace.CurrentCamera
                    v621.Parent = v_u_569[1]
                    v_u_574 = "texture"
                end
            end
        else
            if v_u_568 then
                v_u_568:Destroy()
            end
            v_u_573()
            v_u_568 = script.Hand:Clone()
            v_u_568.Parent = workspace.CurrentCamera
            v_u_574 = "none"
        end
    end
    if v591 then
        local v636 = v_u_124
        v_u_124 = math.clamp(v636, 0, 0.36)
        local v637 = v_u_124 / 0.36
        local v638 = -v637 * 4
        local v639 = math.sin(v638)
        local v640 = v637 ^ 0.3333333333333333 * 1.6
        local v641 = math.sin(v640)
        if v_u_574 == "texture" then
            local v642 = v637 * 2.718
            local v643 = math.sin(v642) * 2
            local v644 = v637 * 2.8
            local v645 = math.sin(v644) * 1.24
            local v646 = -v637 * 4.7
            local v647 = math.sin(v646)
            if v647 < 0 then
                v647 = v647 * 1.5 or v647
            end
            local v648 = v_u_569[1]
            local v649 = v615 * CFrame.new(-v591.CameraOffset / 2.9 * 3)
            local v650 = CFrame.new
            local v651 = v645 * -0.28 + 0.4
            local v652 = v647 * 0.16 + -0.1
            local v653 = v643 * -0.23 + -0.37
            local v654 = v649 * v650(Vector3.new(v651, v652, v653) * 3)
            local v655 = CFrame.fromEulerAnglesYXZ
            local v656 = v641 * -22 + 12
            local v657 = math.rad(v656)
            local v658 = v641 * 25 + 90
            local v659 = math.rad(v658) + 0.15
            local v660 = v643 * -57 + -53
            v648.CFrame = v654 * v655(v657, v659, (math.rad(v660)))
        elseif v_u_574 == "block" then
            local v661 = v637 * 2.618
            local v662 = math.sin(v661) * 2
            local v663 = v_u_568
            local v664 = v615 * CFrame.new(-v591.CameraOffset / 2.3 * 2)
            local v665 = CFrame.new
            local v666 = v662 * -0.21 + 0.48
            local v667 = v639 * 0.2 + -0.335
            local v668 = v662 * -0.025 + -0.6
            local v669 = v664 * v665(Vector3.new(v666, v667, v668) * 2)
            local v670 = CFrame.fromEulerAnglesYXZ
            local v671 = v641 * 61 + 0
            local v672 = math.rad(v671)
            local v673 = v641 * 12 + -135
            local v674 = math.rad(v673)
            local v675 = v641 * 19 + 0
            v663.CFrame = v669 * v670(v672, v674, (math.rad(v675)))
        elseif v_u_574 == "none" then
            local v676 = v637 * 2.2
            local v677 = math.sin(v676)
            local v678 = v_u_568
            local v679 = v615 * CFrame.new(-v591.CameraOffset / 2.3) * CFrame.new(v677 * -0.21 + 0.5, v639 * 0.45 + -0.51, v677 * -0.12 + -0.6)
            local v680 = CFrame.fromEulerAnglesYXZ
            local v681 = v641 * -2 + -23
            local v682 = math.rad(v681)
            local v683 = v641 * 65 + -90
            local v684 = math.rad(v683)
            local v685 = v641 * 5 + -135
            v678.CFrame = v679 * v680(v682, v684, (math.rad(v685)))
        end
        local v686 = v_u_124 - p577
        v_u_124 = math.clamp(v686, 0, 0.36)
    end
    debug.profileend()
    debug.profilebegin("CC")
    local v687 = Vector3.new(0.8509804, 0.9254902, 1)
    local v688 = 100
    local v689 = v578.CFrame.Position
    local v690, _ = v_u_68.getBlock(v_u_557(v689.X, v689.Y, v689.Z))
    if v690 then
        v690 = v690.id
    end
    local v691
    if v690 then
        v691 = v_u_34[v690]
    else
        v691 = v690
    end
    v_u_76.Brightness = 0
    v_u_76.Contrast = -0.1
    v_u_76.Saturation = -0.2
    v_u_76.TintColor = Color3.new(1, 1, 1)
    if not v690 or ((v691.blocktype == "fluid" or v691.blocktype == "nonsolid") and true or v691.blocktype == "hollow") then
        if v690 == v_u_35.Water then
            v_u_76.Brightness = -0.1
            v_u_76.Contrast = -0.1
            v_u_76.Saturation = -0.2
            v_u_76.TintColor = Color3.new(0.7764705882352941, 0.984313725490196, 1)
            v687 = Vector3.new(0.16862746, 0.48235294, 0.46666667)
            v688 = 50
        elseif v690 == v_u_35.Lava then
            v_u_76.Brightness = 0.2
            v_u_76.Contrast = -0.4
            v_u_76.Saturation = -0.5
            v_u_76.TintColor = Color3.new(1, 0.5176470588235295, 0.11764705882352941)
            v687 = Vector3.new(0.9607843, 0.39607844, 0.039215688)
            v688 = 12
        end
    else
        if v_u_150 <= 0 then
            if v_u_14.getGamemode() ~= 1 then
                v_u_19.GameRemotes.Demo:FireServer(5, "suffocation")
            end
            v_u_150 = v_u_150 + 0.5
        end
        v_u_150 = v_u_150 - p577
        v_u_76.Brightness = -0.2
        v_u_76.Contrast = -0.1
        v_u_76.Saturation = -0.2
        v_u_76.TintColor = Color3.new(1, 1, 1)
    end
    local v692 = game.Lighting
    local v693 = v692.ClockTime
    if v693 < 12 then
        local v694 = v693 - 6
        v708 = math.clamp(v694, 0, 1)
        if v708 then
            ::l107::
            local v695 = v687 * v708
            v692.FogColor = Color3.new(v695.X, v695.Y, v695.Z)
            v692.FogEnd = v688
            v692.FogStart = v688 / 4
            debug.profileend()
            debug.profilebegin("Other")
            local v696 = v578.CFrame.Position
            local v697 = (v696.X + 0.5 * v_u_30) / v_u_30
            local v698 = math.floor(v697)
            local v699 = (v696.Y + 0.5 * v_u_30) / v_u_30
            local v700 = math.floor(v699) - 1
            local v701 = (v696.Z + 0.5 * v_u_30) / v_u_30
            local v702 = math.floor(v701)
            local v703 = Vector3.new(v698, v700, v702)
            local v704 = v_u_149 + p577
            v_u_149 = math.clamp(v704, 0, 10)
            local v705 = v_u_125 - p577
            v_u_125 = math.max(v705, 0)
            if v_u_72:FindFirstChild("HUDGui") then
                local v706 = v_u_72.HUDGui.DataFrame
                v706.ViewDist.Text = v_u_153[2]
                v706.Coord.Text = "Coordinates: " .. v703.X .. ", " .. v703.Y .. ", " .. v703.Z
                v706.ServerAge.Text = "Server age: " .. v_u_142(workspace.ServerInfo.ServerAge.Value)
                v706.GameAge.Text = "Game age: " .. v_u_142(workspace.ServerInfo.GameAge.Value)
            end
            debug.profileend()
            debug.profileend()
            return
        end
    end
    local v707 = v693 - 17
    local v708 = 1 - math.clamp(v707, 0, 1)
    goto l107
end
v_u_20:BindToRenderStep("NS_cam_bf", Enum.RenderPriority.Input.Value - 2, v565)
v_u_20:BindToRenderStep("NS_cam", Enum.RenderPriority.Camera.Value, v709)
local function v_u_717(p710, p711, p712, p713, p714)
    -- upvalues: (copy) v_u_68, (ref) v_u_143, (ref) v_u_154, (copy) v_u_30, (copy) v_u_19, (copy) v_u_14, (copy) v_u_34
    if p711 < 0 or p711 > 255 then
        return
    else
        local v715, _ = v_u_68.getBlock(p710, p711, p712)
        if v715 and v715.quad ~= false then
            if v_u_143 and v_u_154 <= 0 then
                return
            elseif v715.quad ~= false then
                if v715 and (v715.id and (v715.blocktype ~= "fluid" and (p714 - workspace.CurrentCamera.CFrame.Position).Magnitude < 5.5 * v_u_30)) then
                    v_u_19.GameRemotes.BreakBlock:FireServer(p710, p711, p712, p713)
                    if v_u_14.getGamemode() ~= 1 then
                        v_u_143 = Vector3.new(p710, p711, p712)
                        local v716 = v_u_34[v715.id]
                        v_u_154 = v716 and v716.hardness or 1
                        return
                    end
                    v_u_68.destroyBlock(p710, p711, p712)
                end
            end
        else
            return
        end
    end
end
local v_u_718 = false
v_u_20:BindToRenderStep("rloop", Enum.RenderPriority.Camera.Value + 1, function(_)
    -- upvalues: (ref) v_u_70, (copy) v_u_30, (copy) v_u_68, (ref) v_u_718, (ref) v_u_144
    if v_u_70 and v_u_70:FindFirstChild("HumanoidRootPart") then
        local v719 = v_u_70.HumanoidRootPart
        local v720 = v719.Position
        local v721 = v720.X / 16 / v_u_30
        local v722 = math.floor(v721)
        local v723 = v720.Z / 16 / v_u_30
        local v724 = math.floor(v723)
        if v_u_68.getChunk(v722, v724) then
            if v_u_718 then
                v_u_718 = false
                if not v_u_144 then
                    v719.Anchored = false
                end
            end
        elseif not v_u_718 then
            v719.Anchored = true
            v_u_718 = true
            return
        end
    end
end)
local function v726(_, p725)
    -- upvalues: (ref) v_u_70, (copy) v_u_21, (ref) v_u_71
    if v_u_70 and v_u_70:FindFirstChild("Humanoid") then
        if v_u_21.TouchEnabled then
            if p725 == Enum.UserInputState.Begin then
                if v_u_71 then
                    v_u_71 = false
                    v_u_70.Humanoid.WalkSpeed = 12
                else
                    v_u_71 = true
                    v_u_70.Humanoid.WalkSpeed = 14.43
                end
            end
        else
            if p725 == Enum.UserInputState.Begin then
                v_u_71 = true
                v_u_70.Humanoid.WalkSpeed = 14.43
                return
            end
            if p725 == Enum.UserInputState.End then
                v_u_71 = false
                v_u_70.Humanoid.WalkSpeed = 12
            end
        end
    end
end
local function v728(_, p727)
    if p727 == Enum.UserInputState.Begin then
        game.ReplicatedStorage.GameRemotes.DropItem:InvokeServer()
    end
end
function v_u_3.updateVis(p729)
    -- upvalues: (copy) v_u_35, (copy) v_u_23, (copy) v_u_72
    if p729.id == v_u_35.Chest.id then
        for v730 = 1, 27 do
            s_inv["Slot" .. v730 + 35].Value = v_u_23:JSONEncode(p729.storage[v730])
        end
    elseif p729.id == v_u_35.Furnace.id then
        s_inv.Slot36.Value = v_u_23:JSONEncode(p729.slot1)
        s_inv.Slot37.Value = v_u_23:JSONEncode(p729.slot2)
        s_inv.Slot38.Value = v_u_23:JSONEncode(p729.output)
        local v731 = (1 - (p729.totalfuel == 0 and 0 or (p729.fuel / p729.totalfuel or 0))) * 13
        local v732 = math.floor(v731) * 2
        local v733 = v_u_72.HUDGui.Inventory.Furnace
        v733.FuelPa.FuelPc.Position = UDim2.new(0, 0, 0, v732)
        v733.FuelPa.FuelPc.FuelPb.Position = UDim2.new(0, 0, 0, -v732)
        local v734 = v733.ArrowPa
        local v735 = UDim2.new
        local v736 = p729.progress / 200 * 22
        v734.Size = v735(0, math.floor(v736) * 2, 0, 30)
    end
end
local v_u_737 = false
local v_u_738 = {
    [v_u_35.Water.id] = 5,
    [v_u_35.PhantomWater.id] = 5,
    [v_u_35.Lava.id] = 4,
    [v_u_35.Air.id] = 0
}
local function v_u_771()
    -- upvalues: (copy) v_u_3, (ref) v_u_87, (copy) v_u_23, (copy) v_u_5, (copy) v_u_36, (copy) v_u_68, (copy) v_u_35, (copy) v_u_738, (copy) v_u_19, (ref) v_u_124, (copy) v_u_380, (copy) v_u_18, (ref) v_u_737, (ref) v_u_557
    local v739 = v_u_3.BlockUnderMouse
    local v740 = v_u_3.FluidUnderMouse
    local v741 = s_inv["Slot" .. v_u_87].Value
    local v742
    if v741 then
        local v743 = v_u_23:JSONDecode(v741)
        local v744 = v_u_5[v743.name]
        v742 = (v744 == nil or v743.count <= 0) and {} or v744
    else
        v742 = {}
    end
    if v740 and v_u_3.IsFluidInReach then
        if v742.id == v_u_36.Bucket.id then
            local v745 = v_u_3.TargetFluidCoordinate
            local v746 = v745.X
            local v747 = v745.Y
            local v748 = v745.Z
            local v749, v750 = v_u_68.getBlock(v746, v747, v748)
            if v749 and (v749.id == v_u_35.Water.id and (not v749.depth or v749.depth == v_u_738[v749.id])) then
                v750:change(v746 % 16, v747, v748 % 16, v_u_35.Air.id)
                if not v_u_19.GameRemotes.UseBlock:InvokeServer(v746, v747, v748, v_u_87) then
                    v750:change(v746 % 16, v747, v748 % 16, v749.id)
                end
                return true
            end
        end
        if not v739 then
            return
        end
        if (v_u_3.FluidHitCf.Position - workspace.CurrentCamera.CFrame.Position).Magnitude < (v_u_3.BlockHitCf.Position - workspace.CurrentCamera.CFrame.Position).Magnitude then
            return
        end
    end
    if v739 then
        if v_u_124 <= 0.04 then
            v_u_124 = 10
        end
        local v751 = v_u_3.TargetBlockCoordinate
        local v752 = v751.X
        local v753 = v751.Y
        local v754 = v751.Z
        local v755, v756 = v_u_68.getBlock(v752, v753, v754)
        if not (v755 and v755.id) then
            return
        end
        if (v_u_3.BlockHitCf.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > v_u_3.PLAYER_REACH then
            return
        end
        if v755.id == v_u_35.CraftingTable.id then
            v_u_3.UsingBlock = Vector3.new(v752, v753, v754)
            v_u_380("CraftingTable")
            return true
        end
        if v755.id == v_u_35.Chest.id then
            if not v_u_18.IsBreaking((Vector3.new(v752, v753, v754))) then
                v_u_3.UsingBlock = Vector3.new(v752, v753, v754)
                v_u_380("Chest")
                v_u_3.updateVis(v755)
                v_u_19.GameRemotes.LoadBlock:InvokeServer(v752, v753, v754)
                return true
            end
        elseif v755.id == v_u_35.Furnace.id then
            if not v_u_18.IsBreaking((Vector3.new(v752, v753, v754))) then
                v_u_3.UsingBlock = Vector3.new(v752, v753, v754)
                v_u_380("Furnace")
                v_u_3.updateVis(v755)
                v_u_19.GameRemotes.LoadBlock:InvokeServer(v752, v753, v754)
                return true
            end
        elseif v755.id == v_u_35.Bed.id then
            if not v_u_18.IsBreaking((Vector3.new(v752, v753, v754))) then
                v_u_19.GameRemotes.SetBedPos:InvokeServer(v739.Position)
                return true
            end
        else
            if v755.id == v_u_35.Door.id then
                local v757 = not v755.open
                v_u_68.updateBlock(v752, v753, v754, {
                    ["open"] = v757
                })
                if v755.upper then
                    local v758, _ = v_u_68.getBlock(v752, v753 - 1, v754)
                    if v758 and v758.id == v_u_35.Door.id then
                        v_u_68.updateBlock(v752, v753 - 1, v754, {
                            ["open"] = v757
                        })
                    end
                else
                    local v759, _ = v_u_68.getBlock(v752, v753 + 1, v754)
                    if v759 and v759.id == v_u_35.Door.id then
                        v_u_68.updateBlock(v752, v753 + 1, v754, {
                            ["open"] = v757
                        })
                    end
                end
                v_u_19.GameRemotes.UseBlock:InvokeServer(v752, v753, v754)
                return true
            end
            if v742.tooltype == "farmingtool" and (v755.id == v_u_35.GrassBlock.id or (v755.id == v_u_35.Dirt.id or v755.id == v_u_35.JungleBlock.id)) then
                v_u_19.GameRemotes.UseBlock:InvokeServer(v752, v753, v754, v_u_87)
                return true
            end
            if v755.id == v_u_35.DryFarmland.id or v755.id == v_u_35.WetFarmland.id then
                if v742.id == v_u_36.Seed.id then
                    v756:change(v752 % 16, v753 + 1, v754 % 16, v_u_35.Wheat1.id, {
                        ["facing"] = 5
                    })
                    local v760, v761 = v_u_19.GameRemotes.UseBlock:InvokeServer(v752, v753, v754, v_u_87)
                    if not v760 then
                        v756:change(v752 % 16, v753 + 1, v754 % 16, v761)
                    end
                    return true
                end
            else
                if (v742.id == v_u_36.OakSapling.id or (v742.id == v_u_36.BirchSapling.id or v742.id == v_u_36.JungleSapling.id)) and (v755.id == v_u_35.GrassBlock.id or (v755.id == v_u_35.Dirt.id or (v755.id == v_u_35.JungleBlock.id or v755.id == v_u_35.SnowBlock.id))) then
                    if v742.id == v_u_36.OakSapling.id then
                        v756:change(v752 % 16, v753 + 1, v754 % 16, v_u_35.OakSapling.id, {
                            ["facing"] = 5
                        })
                    elseif v742.id == v_u_36.BirchSapling.id then
                        v756:change(v752 % 16, v753 + 1, v754 % 16, v_u_35.BirchSapling.id, {
                            ["facing"] = 5
                        })
                    elseif v742.id == v_u_36.JungleSapling.id then
                        v756:change(v752 % 16, v753 + 1, v754 % 16, v_u_35.JungleSapling.id, {
                            ["facing"] = 5
                        })
                    end
                    local v762, v763 = v_u_19.GameRemotes.UseBlock:InvokeServer(v752, v753, v754, v_u_87)
                    if not v762 then
                        v756:change(v752 % 16, v753 + 1, v754 % 16, v763)
                    end
                    return true
                end
                if v742.id == v_u_36.RedApple.id or (v742.id == v_u_36.Bread.id or (v742.id == v_u_36.MultiversalApple.id or (v742.id == v_u_36.CosmicMeatballs.id or (v742.id == v_u_36.UltimateStew.id or (v742.id == v_u_36.SpeedPotion.id or (v742.id == v_u_36.RegenPotion.id or (v742.id == v_u_36.GoldenApple.id or (v742.id == v_u_36.TheMasterEmerald.id or (v742.id == v_u_36.FakeChaosEmerald.id or (v742.id == v_u_36.CookedBeef.id or (v742.id == v_u_36.TheChaosEmeralds.id or v742.id == v_u_36.SelfMedkit.id))))))))))) then
                    if v_u_737 == false then
                        game.ReplicatedStorage.GameRemotes.ConsumeItem:InvokeServer(game.Players.LocalPlayer.Character.Inventory, v_u_87)
                        v_u_737 = true
                        task.wait(0.25)
                        v_u_737 = false
                        return
                    end
                elseif v742.id == v_u_36.KawaiiApple.id then
                    if v_u_737 == false then
                        game.ReplicatedStorage.GameRemotes.ConsumeItem:InvokeServer(game.Players.LocalPlayer.Character.Inventory, v_u_87)
                        return
                    end
                elseif v742.id == v_u_36.Bucket.id or (v742.id == v_u_36.WaterBucket.id or v742.id == v_u_36.LavaBucket.id) then
                    local v764, v765, v766 = v_u_557(v_u_3.BlockHitCf.Position - v_u_3.BlockHitCf.LookVector / 64)
                    local _, v767 = v_u_68.getBlock(v764, v765, v766)
                    local v768 = v742.id == v_u_36.WaterBucket.id and v_u_35.Water.id
                    if not v768 then
                        if v742.id == v_u_36.LavaBucket.id then
                            v768 = v_u_35.Lava.id
                        else
                            v768 = false
                        end
                    end
                    v767:change(v764 % 16, v765, v766 % 16, v768)
                    local v769, v770 = v_u_19.GameRemotes.UseBlock:InvokeServer(v764, v765, v766, v_u_87)
                    if not v769 then
                        v767:change(v764 % 16, v765, v766 % 16, v770)
                    end
                    return true
                end
            end
        end
    end
end
local function v_u_811()
    -- upvalues: (ref) v_u_124, (copy) v_u_3, (copy) v_u_23, (ref) v_u_88, (copy) v_u_36, (copy) v_u_35, (ref) v_u_70, (ref) v_u_557, (copy) v_u_68, (copy) v_u_34, (copy) v_u_10, (copy) v_u_17, (copy) v_u_30, (copy) v_u_120, (copy) v_u_14, (copy) v_u_19, (ref) v_u_87
    if v_u_124 <= 0.04 then
        v_u_124 = 10
    end
    local v772 = v_u_3.BlockUnderMouse
    if v772 and v_u_3.IsBlockInReach then
        local v773 = v_u_23:JSONDecode(v_u_88.Value)
        local v774 = v773.name
        local v775
        if v774 then
            v775 = v_u_36[v774]
        else
            v775 = v774
        end
        if v775 then
            v774 = v775.block or v774
        end
        local v776 = v_u_35[v774]
        if v776 or v775 and v775.placeable then
            local v777 = v_u_35[v772.Name]
            local v778, v779, v780
            if v777 and v777.replaceable then
                local v781 = v_u_3.BlockHitCf.Position + v_u_3.BlockHitCf.LookVector / 32
                local v782 = v781.X / 3 + 0.5
                v778 = math.floor(v782)
                local v783 = v781.Y / 3 + 0.5
                v779 = math.floor(v783)
                local v784 = v781.Z / 3 + 0.5
                v780 = math.floor(v784)
            else
                local v785 = v_u_3.BlockHitCf.Position - v_u_3.BlockHitCf.LookVector / 32
                local v786 = v785.X / 3 + 0.5
                v778 = math.floor(v786)
                local v787 = v785.Y / 3 + 0.5
                v779 = math.floor(v787)
                local v788 = v785.Z / 3 + 0.5
                v780 = math.floor(v788)
            end
            local v789 = v_u_70
            if v789 then
                v789 = v_u_70:FindFirstChild("HumanoidRootPart")
            end
            if not v789 then
                return
            end
            local _ = v776 and (v776.blocktype and v776.blocktype ~= "nonsolid")
            local v790 = true
            local v791
            if v790 then
                local v792 = v_u_557
                local v793 = v789.Position.X
                local v794 = v789.Position.Y + 2
                local v795 = v789.Position.Z
                v791 = Vector3.new(v792(v793, v794, v795))
            else
                v791 = v790
            end
            local v796
            if v790 then
                local v797 = v_u_557
                local v798 = v789.Position.X
                local v799 = v789.Position.Y - 2
                local v800 = v789.Position.Z
                v796 = Vector3.new(v797(v798, v799, v800))
            else
                v796 = v790
            end
            if v790 == false or v791 ~= Vector3.new(v778, v779, v780) and v796 ~= Vector3.new(v778, v779, v780) then
                local v801, v802 = v_u_68.getBlock(v778, v779, v780)
                if v801 then
                    v801 = v801.id
                end
                local v803 = v_u_34[v801]
                if (v802 and not v801 or (v803.blocktype == "fluid" or (v776.blocktype == "slab" or v803.replaceable))) and (v773 and v773.count > 0) then
                    local v804 = v_u_10.Material[v776.material] or v_u_10.Material.default
                    v_u_17.playSound(Vector3.new(v778, v779, v780) * v_u_30, v804)
                    local v805 = nil
                    if v775.placeable == 0 then
                        v805 = v_u_120(Vector3.new(v778, v779, v780) * 3, workspace.CurrentCamera.CFrame.Position)
                    elseif v775.placeable == 1 then
                        v805 = v_u_120(v_u_3.BlockHitCf.Position, v_u_3.BlockHitCf.Position + v_u_3.BlockHitSurfaceNormal)
                    elseif v775.placeable == 2 then
                        local v806 = -(v_u_3.BlockHitCf.LookVector * Vector3.new(1, 0, 1)) + v_u_3.BlockHitCf.Position
                        v805 = v_u_120(v_u_3.BlockHitCf.Position, v806)
                    end
                    local v807 = v805 == Vector3.new(0, 1, 0) and 5 or (v805 == Vector3.new(1, 0, 0) and 1 or (v805 == Vector3.new(-1, 0, 0) and 2 or (v805 == Vector3.new(0, 0, 1) and 3 or (v805 == Vector3.new(0, 0, -1) and 4 or v805))))
                    if v803 and (v803.blocktype == "slab" and v807 == 5) then
                        v779 = v779 + 1
                    end
                    if v_u_68.placeBlock(v778, v779, v780, v802, v807, v776.id) then
                        if v_u_14.getGamemode() ~= 1 then
                            v773.count = v773.count - 1
                            v_u_88.Value = v_u_23:JSONEncode(v773)
                        end
                        local v808, v809, v810 = v_u_19.GameRemotes.PlaceBlock:InvokeServer(v778, v779, v780, v_u_87, v807)
                        if not v808 then
                            v773.count = v810
                            v_u_88.Value = v_u_23:JSONEncode(v773)
                            v802:change(v778 % 16, v779, v780 % 16, v809)
                        end
                    end
                end
            end
        end
    end
end
local v_u_812 = false
local function v_u_819()
    -- upvalues: (ref) v_u_812, (ref) v_u_43, (ref) v_u_124, (ref) v_u_151, (ref) v_u_98, (ref) v_u_146
    if v_u_812 == true then
        return
    elseif v_u_43 == true then
        if v_u_124 <= 0.04 then
            v_u_124 = 10
        end
        if v_u_151 then
            coroutine.wrap(function()
                -- upvalues: (ref) v_u_812, (ref) v_u_151, (ref) v_u_98
                v_u_812 = true
                local v813, v814 = game.ReplicatedStorage.GameRemotes.Attack:InvokeServer(v_u_151)
                if v813 then
                    v_u_98 = {
                        tick(),
                        v813,
                        v814,
                        v814 and tick() or 0
                    }
                end
                v_u_812 = false
            end)()
            return true
        elseif v_u_146 then
            coroutine.wrap(function()
                -- upvalues: (ref) v_u_812, (ref) v_u_146, (ref) v_u_98
                v_u_812 = true
                local v815, v816 = game.ReplicatedStorage.GameRemotes.AttackMob:InvokeServer(v_u_146)
                if v815 then
                    v_u_98 = {
                        tick(),
                        v815,
                        v816,
                        v816 and tick() or 0
                    }
                end
                v_u_812 = false
            end)()
            return true
        else
            coroutine.wrap(function()
                -- upvalues: (ref) v_u_812, (ref) v_u_98
                v_u_812 = true
                local v817, v818 = game.ReplicatedStorage.GameRemotes.Attack:InvokeServer(false)
                if v817 then
                    v_u_98 = {
                        tick(),
                        v817,
                        v818,
                        v818 and tick() or 0
                    }
                end
                v_u_812 = false
            end)()
            return false
        end
    else
        return
    end
end
local v_u_820 = 0
local v_u_821 = 0
local v_u_822 = 0
local function v_u_827()
    -- upvalues: (ref) v_u_88, (copy) v_u_23, (ref) v_u_820, (ref) v_u_821, (ref) v_u_822, (copy) v_u_771, (copy) v_u_811
    if v_u_88 then
        local v823 = v_u_23:JSONDecode(v_u_88.Value)
        if v823.name == "DarknessMatterStaff2" and v823.count > 0 then
            if tick() - v_u_820 >= 0.25 then
                v_u_820 = tick()
                local v824 = workspace.CurrentCamera.CFrame.LookVector
                game.ReplicatedStorage.GameRemotes.DarknessOrb:FireServer(v824)
            end
        end
        if v823.name == "EndestPearl1" and v823.count > 0 then
            if tick() - v_u_821 >= 0.5 then
                v_u_821 = tick()
                local v825 = workspace.CurrentCamera.CFrame.LookVector
                game.ReplicatedStorage.GameRemotes.EndestPearlThrow:FireServer(v825)
            end
        end
        if v823.name == "LaserDivinitySword" and v823.count > 0 then
            if tick() - v_u_822 >= 0.5 then
                v_u_822 = tick()
                local v826 = workspace.CurrentCamera.CFrame.LookVector
                game.ReplicatedStorage.GameRemotes.LaserBeam:FireServer(v826)
            end
        end
    end
    if not v_u_771() then
        v_u_811()
    end
end
local v_u_828 = v_u_557
local v_u_829 = {}
local v_u_830 = {
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine"
}
local v_u_831 = nil
for _, v832 in ipairs({
    "GamePass",
    "GamePass2",
    "GamePass3",
    "GamePass4",
    "GamePass5",
    "GamePass6",
    "GamePass7",
    "GamePass8",
    "GamePass9",
    "GamePass10",
    "GamePass11"
}) do
    v_u_829[#v_u_829 + 1] = v_u_72:WaitForChild("GamePass Shop Gui"):WaitForChild("Box"):WaitForChild(v832)
end
local v_u_833 = 0
function moveShopSelectionRight(_, p834)
    -- upvalues: (ref) v_u_833, (ref) v_u_831, (copy) v_u_829
    print(v_u_833)
    if v_u_833 == 0 then
        v_u_833 = 2
    else
        v_u_833 = v_u_833 + 1
        if p834 then
            if v_u_831 then
                local v835 = nil
                for v836, v837 in ipairs(v_u_829) do
                    if v837 == v_u_831 then
                        if v836 + 1 >= #v_u_829 then
                            v_u_833 = v_u_833 - 1
                            return
                        end
                        v835 = v_u_829[v836 + 1]
                    end
                end
                print("Switching ", v_u_831, " to ", v835)
                v_u_831.BorderColor3 = Color3.new(0, 0, 0)
                v_u_831 = v835
                v_u_831.BorderColor3 = Color3.new(85, 170, 255)
            else
                v_u_831 = v_u_829[1]
                v_u_831.BorderColor3 = Color3.new(85, 170, 255)
            end
        end
        if v_u_833 > 1 then
            v_u_833 = 0
        end
    end
end
local v_u_838 = 0
function moveShopSelectionLeft(_, p839)
    -- upvalues: (ref) v_u_838, (ref) v_u_831, (copy) v_u_829
    if v_u_838 == 1 then
        v_u_838 = 2
    else
        v_u_838 = v_u_838 + 1
        if p839 then
            if v_u_831 then
                local v840 = nil
                for v841, v842 in ipairs(v_u_829) do
                    if v842 == v_u_831 then
                        if v841 - 1 < 1 then
                            v_u_838 = v_u_838 - 1
                            return
                        end
                        v840 = v_u_829[v841 - 1]
                    end
                end
                print("Switching ", v_u_831, " to ", v840)
                v_u_831.BorderColor3 = Color3.new(0, 0, 0)
                v_u_831 = v840
                v_u_831.BorderColor3 = Color3.new(85, 170, 255)
            else
                v_u_831 = v_u_829[1]
                v_u_831.BorderColor3 = Color3.new(85, 170, 255)
            end
        end
        if v_u_838 > 1 then
            v_u_838 = 0
        end
    end
end
local v_u_843 = 0
function promptShopSelection(_, p844)
    -- upvalues: (ref) v_u_831, (ref) v_u_843, (copy) v_u_69
    if p844 and v_u_831 then
        if v_u_843 == v_u_831.gid.Value then
            return
        end
        v_u_843 = v_u_831.gid.Value
        game:GetService("MarketplaceService"):PromptGamePassPurchase(v_u_69, v_u_831.gid.Value)
        wait(0.2)
        v_u_843 = 0
    end
end
local function v_u_859(p845, p846)
    -- upvalues: (copy) v_u_21, (copy) v_u_819, (ref) v_u_147, (copy) v_u_3, (ref) v_u_148, (ref) v_u_124, (ref) v_u_828, (copy) v_u_717, (copy) v_u_827, (copy) v_u_830, (ref) v_u_87, (copy) v_u_182, (ref) v_u_143, (copy) v_u_19
    if p846 then
        if v_u_21.GamepadEnabled then
            if p845.KeyCode == Enum.KeyCode.ButtonR2 then
                if not v_u_819() then
                    v_u_147 = true
                    if v_u_3.BlockUnderMouse then
                        if v_u_3.IsBlockInReach then
                            v_u_148 = true
                            if v_u_124 <= 0.04 then
                                v_u_124 = 10
                            end
                            local v847 = v_u_3.BlockHitCf.Position + v_u_3.BlockHitCf.LookVector / 64
                            local v848, v849, v850 = v_u_828(v847.X, v847.Y, v847.Z)
                            v_u_717(v848, v849, v850, nil, v847)
                        end
                    else
                        v_u_148 = false
                    end
                end
            elseif p845.KeyCode == Enum.KeyCode.ButtonL2 then
                v_u_827()
            end
        end
        if p845.UserInputType == Enum.UserInputType.MouseButton1 then
            if not v_u_819() then
                v_u_147 = true
                if not v_u_3.BlockUnderMouse then
                    v_u_148 = false
                    return
                end
                if v_u_3.IsBlockInReach then
                    v_u_148 = true
                    if v_u_124 <= 0.04 then
                        v_u_124 = 10
                    end
                    local v851 = v_u_3.BlockHitCf.Position + v_u_3.BlockHitCf.LookVector / 64
                    local v852, v853, v854 = v_u_828(v851.X, v851.Y, v851.Z)
                    v_u_717(v852, v853, v854, nil, v851)
                    return
                end
            end
        else
            if p845.UserInputType == Enum.UserInputType.MouseButton2 then
                v_u_827()
                return
            end
            if p845.UserInputType == Enum.UserInputType.Keyboard then
                local v855 = {}
                for v856, v857 in pairs(v_u_830) do
                    v855[v857] = v856
                end
                local v858 = v855[p845.KeyCode.Name]
                if v858 and (v858 >= 1 and v858 < 10) then
                    v_u_87 = v858 - 1
                    v_u_182()
                    return
                end
            end
        end
    else
        if v_u_21.GamepadEnabled and p845.KeyCode == Enum.KeyCode.ButtonR2 then
            v_u_147 = false
            v_u_148 = false
            if v_u_143 then
                v_u_143 = nil
                v_u_19.GameRemotes.CancelBlock:InvokeServer(nil, nil, nil)
            end
        end
        if p845.UserInputType == Enum.UserInputType.MouseButton1 then
            v_u_147 = false
            v_u_148 = false
            if v_u_143 then
                v_u_143 = nil
                v_u_19.GameRemotes.CancelBlock:InvokeServer(nil, nil, nil)
            end
        end
    end
end
function itemright(_, p860)
    -- upvalues: (ref) v_u_87, (copy) v_u_182
    if p860 == Enum.UserInputState.Begin and s_inv then
        v_u_87 = (v_u_87 + 1) % 9
        v_u_182()
    end
end
function itemleft(_, p861)
    -- upvalues: (ref) v_u_87, (copy) v_u_182
    if p861 == Enum.UserInputState.Begin and s_inv then
        v_u_87 = (v_u_87 + -1) % 9
        v_u_182()
    end
end
v_u_22:BindAction("dropItem", v728, true, Enum.KeyCode.Q, Enum.KeyCode.DPadUp)
v_u_22:SetTitle("dropItem", "Drop")
v_u_22:SetPosition("dropItem", UDim2.new(0.3, 0, -0.3, 0))
v_u_22:BindAction("toggleInv", v383, false, Enum.KeyCode.E, Enum.KeyCode.ButtonY)
v_u_22:BindAction("sprint", v726, true, Enum.KeyCode.LeftControl, Enum.KeyCode.ButtonL3)
v_u_22:SetTitle("sprint", "Sprint")
v_u_22:SetPosition("sprint", UDim2.new(0.6, 0, 0, 0))
v_u_22:BindAction("itemRight", itemright, false, Enum.KeyCode.ButtonB)
v_u_22:BindAction("itemLeft", itemleft, false, Enum.KeyCode.ButtonX)
v_u_21.TouchTap:Connect(function(_, p862)
    -- upvalues: (copy) v_u_819, (copy) v_u_811
    if not (p862 or v_u_819()) then
        v_u_811()
    end
end)
v_u_21.TouchLongPress:Connect(function(_, p863, p864)
    -- upvalues: (ref) v_u_89, (ref) v_u_147, (copy) v_u_3, (ref) v_u_148, (ref) v_u_124, (ref) v_u_828, (copy) v_u_717, (ref) v_u_143, (copy) v_u_19
    if not v_u_89 then
        if p863 == Enum.UserInputState.Begin and not p864 then
            v_u_147 = true
            if not v_u_3.BlockUnderMouse then
                v_u_148 = false
                return
            end
            if v_u_3.IsBlockInReach then
                v_u_148 = true
                if v_u_124 <= 0.04 then
                    v_u_124 = 10
                end
                local v865 = v_u_3.BlockHitCf.Position + v_u_3.BlockHitCf.LookVector / 64
                local v866, v867, v868 = v_u_828(v865.X, v865.Y, v865.Z)
                v_u_717(v866, v867, v868, nil, v865)
                return
            end
        elseif p863 == Enum.UserInputState.End then
            v_u_147 = false
            v_u_148 = false
            if v_u_143 then
                v_u_143 = nil
                v_u_19.GameRemotes.CancelBlock:InvokeServer(nil, nil, nil)
            end
        end
    end
end)
v_u_21.InputBegan:Connect(function(p869, p870)
    -- upvalues: (copy) v_u_859
    if not p870 then
        v_u_859(p869, true)
    end
end)
v_u_21.InputEnded:Connect(function(p871, _)
    -- upvalues: (copy) v_u_21, (ref) v_u_147, (ref) v_u_148, (ref) v_u_143, (copy) v_u_19
    if v_u_21.GamepadEnabled and p871.KeyCode == Enum.KeyCode.ButtonR2 then
        v_u_147 = false
        v_u_148 = false
        if v_u_143 then
            v_u_143 = nil
            v_u_19.GameRemotes.CancelBlock:InvokeServer(nil, nil, nil)
        end
    end
    if p871.UserInputType == Enum.UserInputType.MouseButton1 then
        v_u_147 = false
        v_u_148 = false
        if v_u_143 then
            v_u_143 = nil
            v_u_19.GameRemotes.CancelBlock:InvokeServer(nil, nil, nil)
        end
    end
end)
v_u_21.InputChanged:Connect(function(p872)
    -- upvalues: (ref) v_u_87, (copy) v_u_182
    if p872.UserInputType ~= Enum.UserInputType.MouseMovement then
        if p872.UserInputType == Enum.UserInputType.MouseWheel then
            if -p872.Position.Z > 0 then
                if s_inv then
                    v_u_87 = (v_u_87 + 1) % 9
                    v_u_182()
                    return
                end
            elseif s_inv then
                v_u_87 = (v_u_87 + -1) % 9
                v_u_182()
            end
        end
    end
end)
v_u_19.GameRemotes.PlaySound.OnClientEvent:Connect(v_u_17.playSound)
if v_u_21.TouchEnabled == true then
    game.Players.LocalPlayer.PlayerGui:WaitForChild("ContextActionGui").DisplayOrder = -1
    v_u_21.TouchPan:Connect(function(_, _, _, _, _)
        -- upvalues: (ref) v_u_56, (ref) v_u_54, (ref) v_u_55
        v_u_56 = true
        if v_u_54 then
            v_u_54 = false
            v_u_55 = true
        end
    end)
    v_u_21.TouchStarted:Connect(function(_, _)
        -- upvalues: (ref) v_u_56
        v_u_56 = true
    end)
    v_u_21.TouchEnded:Connect(function(_, _)
        -- upvalues: (ref) v_u_56, (ref) v_u_55
        v_u_56 = false
        v_u_55 = false
    end)
    v_u_21.TouchTapInWorld:Connect(function(_, p873)
        -- upvalues: (copy) v_u_827
        if not p873 then
            v_u_827()
        end
    end)
end
local function v_u_879(p874, p875, p876)
    -- upvalues: (copy) v_u_68, (copy) v_u_19
    local v877, v878 = v_u_68.destroyBlock(p874, p875, p876)
    if v_u_19.GameRemotes.AcceptBreakBlock:InvokeServer() == false then
        v878:change(p874, p875, p876, v877.id, v877)
    end
end
local v_u_880 = nil
v_u_20.RenderStepped:Connect(function(p881)
    -- upvalues: (copy) v_u_74, (ref) v_u_70, (copy) v_u_72, (copy) v_u_75, (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_30, (copy) v_u_18, (ref) v_u_880, (ref) v_u_147, (ref) v_u_148, (ref) v_u_124, (ref) v_u_828, (copy) v_u_717, (ref) v_u_151, (ref) v_u_146, (ref) v_u_77, (copy) v_u_14, (copy) v_u_35, (ref) v_u_143, (copy) v_u_23, (ref) v_u_88, (copy) v_u_5, (copy) v_u_6, (ref) v_u_154, (ref) v_u_123, (ref) v_u_122, (copy) v_u_10, (copy) v_u_17, (copy) v_u_879, (copy) v_u_19
    v_u_74.Icon = "rbxasset://textures/Blank.png"
    local v882
    if v_u_70 then
        v882 = v_u_70:FindFirstChild("Humanoid")
    else
        v882 = nil
    end
    if v882 then
        local v883 = workspace.CurrentCamera
        local v884 = workspace.CurrentCamera.FieldOfView
        v883.FieldOfView = v884 + 0.25 * (v_u_72:WaitForChild("Settings"):WaitForChild("FOV").Value + v_u_70.Humanoid.WalkSpeed * 2.5 - v884)
    else
        workspace.CurrentCamera.FieldOfView = v_u_72:WaitForChild("Settings"):WaitForChild("FOV").Value
    end
    if v882 then
        v882.HipHeight = 0.1
        local v885, v886, v887 = v_u_75:ProjectMouseRay2({ v_u_1 })
        local v888, v889, v890 = v_u_75:ProjectMouseRay2({ v_u_2 })
        local v891 = v_u_3.BlockUnderMouse
        if v886 then
            v_u_3.BlockUnderMouse = v886
            local v892 = v885.Position
            v_u_3.IsBlockInReach = (v892 - workspace.CurrentCamera.CFrame.Position).Magnitude < 5.5 * v_u_30
            v_u_3.BlockHitCf = v885
            local v893 = v_u_3.TargetBlockCoordinate
            local v894 = v892 - v887 / 6 + Vector3.new(1.5, 1.5, 1.5)
            local v895 = v894.X / 3
            local v896 = math.floor(v895)
            local v897 = v894.Y / 3
            local v898 = math.floor(v897)
            local v899 = v894.Z / 3
            local v900 = math.floor(v899)
            local v901 = Vector3.new(v896, v898, v900)
            v_u_3.TargetBlockCoordinate = v901
            v_u_3.TargetBlockCoordChanged = v893 ~= v901
            if v_u_3.TargetBlockCoordChanged then
                v_u_18.SetPrimaryPosition(v901 * 3)
            elseif v_u_3.IsBlockInReach ~= true then
                v_u_18.SetPrimaryPosition(false)
            end
            v_u_3.BlockHitSurfaceNormal = v887
        else
            v_u_3.BlockUnderMouse = false
            v_u_3.IsBlockInReach = false
            v_u_3.BlockHitSurfaceNormal = false
        end
        if (v_u_3.TargetBlockCoordChanged or (v891 ~= v886 or v_u_3.IsBlockInReach ~= v_u_880)) and v_u_3.BlockUnderMouse then
            v_u_147 = v_u_147
            v_u_148 = true
            if v_u_147 then
                if v_u_3.BlockUnderMouse then
                    if v_u_3.IsBlockInReach then
                        v_u_148 = true
                        if v_u_124 <= 0.04 then
                            v_u_124 = 10
                        end
                        local v902 = v_u_3.BlockHitCf.Position + v_u_3.BlockHitCf.LookVector / 64
                        local v903, v904, v905 = v_u_828(v902.X, v902.Y, v902.Z)
                        v_u_717(v903, v904, v905, nil, v902)
                    end
                else
                    v_u_148 = false
                end
            end
        end
        if v889 then
            v_u_3.FluidUnderMouse = v889
            local v906 = v888.Position
            v_u_3.IsFluidInReach = (v906 - workspace.CurrentCamera.CFrame.Position).Magnitude < 5.5 * v_u_30
            v_u_3.FluidHitCf = v888
            local v907 = v_u_3.TargetFluidCoordinate
            local v908 = v906 - v890 / 6 + Vector3.new(1.5, 1.5, 1.5)
            local v909 = v908.X / 3
            local v910 = math.floor(v909)
            local v911 = v908.Y / 3
            local v912 = math.floor(v911)
            local v913 = v908.Z / 3
            local v914 = math.floor(v913)
            local v915 = Vector3.new(v910, v912, v914)
            v_u_3.TargetFluidCoordinate = v915
            v_u_3.TargetFluidCoordChanged = v907 ~= v915
        else
            v_u_3.FluidUnderMouse = false
            v_u_3.IsFluidInReach = false
        end
        local v916, v917, _ = v_u_75:ProjectMouseRay({
            workspace.CurrentCamera,
            v_u_2,
            v_u_1,
            v_u_70
        })
        if v917 and (v917.Parent and ((v916.Position - workspace.CurrentCamera.CFrame.Position).Magnitude < 5.5 * v_u_30 and game.Players:GetPlayerFromCharacter(v917.Parent))) then
            v_u_151 = v917.Parent
        elseif v917 and (v917.Parent and ((v916.Position - workspace.CurrentCamera.CFrame.Position).Magnitude < 5.5 * v_u_30 and v917.Parent:FindFirstChild("Mob"))) then
            v_u_146 = v917.Parent
        else
            v_u_151 = nil
            v_u_146 = nil
        end
        if v_u_3.IsBlockInReach then
            if v886 then
                v_u_77 = v887
                if v_u_147 and (v_u_148 and v_u_14.getGamemode() ~= 1) then
                    local v918 = v886.Position.X / v_u_30
                    local v919 = math.floor(v918)
                    local v920 = v886.Position.Y / v_u_30
                    local v921 = math.ceil(v920)
                    local v922 = v886.Position.Z / v_u_30
                    local v923 = math.floor(v922)
                    local v924 = Vector3.new(v919, v921, v923)
                    local v925 = v_u_35[v886.Name]
                    if v_u_143 then
                        local v926 = v_u_23:JSONDecode(v_u_88.Value)
                        local v927 = not v925.toolRequire
                        local v928 = 1
                        if v926 and (v926.count and (v926.count > 0 and v926.name)) then
                            local v929 = v_u_5[v926.name]
                            if v925 and (v925.toolRequire and (v929 and (v929.level and (v929.tooltype and v929.tooltype == v925.toolRequire)))) then
                                v927 = v925.toolLevelRequire and v_u_6[v925.toolRequire .. "R"][v929.level] >= v_u_6[v925.toolRequire .. "R"][v925.toolLevelRequire] and true or (not v925.toolLevelRequire and true or v927)
                            end
                            if v927 then
                                if v929 and (v929.level and (v929.tooltype and v929.tooltype == v925.toolRequire)) then
                                    v928 = v_u_6.speedMul[v929.level]
                                elseif v929 and (v929.level and (v929.tooltype and v929.tooltype == v925.betterTool)) then
                                    v928 = v_u_6.speedMul[v929.level]
                                end
                            end
                        end
                        local v930 = p881 * (v927 and 0.6666666666666666 or 0.2) * v928
                        local v931 = math.max(0, v930)
                        v_u_154 = v_u_154 - v931
                        v_u_123 = v_u_123 - v931
                        v_u_122 = v_u_122 - v931
                        if v_u_124 <= 0.04 then
                            v_u_124 = 10
                            v_u_122 = 0.2
                            if v925 then
                                local v932 = v_u_10.BlockBreak[v886.Name] or v_u_10.BlockBreak.Default
                                local v933 = v_u_17.playSound
                                local v934 = v924.X
                                local v935 = v924.Y
                                local v936 = v924.Z
                                local v937 = v933((Vector3.new(v934, v935, v936) + v887 / 2) * v_u_30, v932, 0.6 + math.random() * 0.05, 0.55)
                                if v937 then
                                    local v938 = Instance.new("EqualizerSoundEffect")
                                    v938.HighGain = -1
                                    v938.MidGain = -1
                                    v938.LowGain = -4
                                    v938.Parent = v937
                                end
                            end
                        end
                        if v_u_123 <= 0 then
                            v_u_123 = 0.25
                        end
                        if v_u_154 <= 0 then
                            coroutine.resume(coroutine.create(v_u_879), v_u_143.X, v_u_143.Y, v_u_143.Z)
                            v_u_143 = nil
                            v_u_154 = 0
                        end
                    end
                end
            end
        else
            if v_u_143 then
                v_u_143 = nil
                v_u_19.GameRemotes.CancelBlock:InvokeServer(nil, nil, nil)
            end
            v_u_18.SetPrimaryPosition(false)
        end
    end
    v_u_880 = v_u_3.IsBlockInReach
end)
local v_u_939 = game:GetService("TextService")
local function v_u_946(p940)
    -- upvalues: (copy) v_u_939
    local v941 = workspace.CurrentCamera.ViewportSize.Y
    local v942 = v_u_939:GetTextSize(p940, 17, Enum.Font.SourceSansBold, Vector2.new(10000, v941))
    local v943 = UDim2.new
    local v944 = v942.X + 7
    local v945 = v942.Y
    return v943(0, v944, 0, (math.min(v945, v941)))
end
local function v_u_972()
    -- upvalues: (copy) v_u_72, (copy) v_u_23, (copy) v_u_5, (copy) v_u_946, (ref) v_u_56, (copy) v_u_210, (ref) v_u_54, (ref) v_u_89, (ref) v_u_55
    local v947 = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
    v947.Name = "MouseTagLabel"
    local v948 = Instance.new("TextLabel", v947)
    v948.Size = UDim2.new(0.078, 0, 0.023, 0)
    v948.AnchorPoint = Vector2.new(0.5, 0.5)
    v948.Name = "MouseTag"
    v948.ZIndex = 999999999999
    v948.BackgroundColor3 = Color3.new(0, 0, 0)
    v948.BorderSizePixel = 0
    v948.BackgroundTransparency = 0.35
    v948.TextColor3 = Color3.new(1, 1, 1)
    v948.Font = Enum.Font.SourceSansBold
    v948.TextScaled = true
    v948.TextWrapped = true
    for _, v_u_949 in pairs(v_u_72.HUDGui.Inventory.Slots:GetChildren()) do
        if v_u_949:IsA("Frame") then
            v_u_949.MouseEnter:Connect(function(_, _)
                -- upvalues: (copy) v_u_949, (ref) v_u_23, (ref) v_u_5, (ref) v_u_946, (ref) v_u_56, (ref) v_u_210
                if v_u_949.Visible == true and v_u_949:FindFirstChild("Slot") then
                    if v_u_949:FindFirstChild("Slot"):FindFirstChild("Display") then
                        if v_u_949:FindFirstChild("Slot"):FindFirstChild("Display"):FindFirstChild("SlotB") then
                            if v_u_949:FindFirstChild("Slot"):FindFirstChild("Display"):FindFirstChild("SlotB"):GetChildren()[1] ~= nil then
                                local v950 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("MouseTagLabel").MouseTag
                                local v951 = v_u_23:JSONDecode(s_inv[v_u_949.Name].Value)
                                local v952 = v_u_5[v951.name] and (v_u_5[v951.name].name or v951.name) or v951.name
                                v950.Visible = true
                                local v953 = game:GetService("UserInputService"):GetMouseLocation()
                                v950.Position = UDim2.new(0, v953.X, 0, v953.Y)
                                v950.Text = v952
                                v950.Size = v_u_946(v952)
                            end
                        elseif v_u_949:FindFirstChild("Slot"):FindFirstChild("Display"):GetChildren()[1] and (v_u_949:IsA("Frame") or v_u_949:IsA("ImageLabel")) then
                            local v954 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("MouseTagLabel").MouseTag
                            local v955 = v_u_23:JSONDecode(s_inv[v_u_949.Name].Value)
                            local v956 = v_u_5[v955.name] and (v_u_5[v955.name].name or v955.name) or v955.name
                            v954.Visible = true
                            local v957 = game:GetService("UserInputService"):GetMouseLocation()
                            v954.Position = UDim2.new(0, v957.X, 0, v957.Y)
                            v954.Text = v956
                            v954.Size = v_u_946(v956)
                        end
                    end
                    local v958 = v_u_23:JSONDecode(s_inv["Slot-1"].Value)
                    local v959 = v_u_23:JSONDecode(s_inv[v_u_949.Name].Value)
                    local v960 = v958 and v958.name
                    if v960 then
                        v960 = v958.count > 0
                    end
                    local v961 = v959 and v959.name
                    if v961 then
                        v961 = v959.count > 0
                    end
                    if v_u_56 and (v960 and not v961) then
                        local v962 = v_u_210
                        local v963 = string.match
                        local v964 = v_u_949.Name
                        v962(-1, tonumber(v963(v964, "%d+")), true, 1)
                    end
                end
            end)
            v_u_949.MouseMoved:Connect(function()
                -- upvalues: (copy) v_u_949
                if v_u_949.Visible == true and (v_u_949:FindFirstChild("Slot") and v_u_949:FindFirstChild("Slot"):FindFirstChild("Display")) then
                    if v_u_949:FindFirstChild("Slot"):FindFirstChild("Display"):FindFirstChild("SlotB") then
                        if v_u_949:FindFirstChild("Slot"):FindFirstChild("Display"):FindFirstChild("SlotB"):GetChildren()[1] ~= nil then
                            game.Players.LocalPlayer.PlayerGui:FindFirstChild("MouseTagLabel").MouseTag.Visible = true
                            local v965 = game:GetService("UserInputService"):GetMouseLocation()
                            game.Players.LocalPlayer.PlayerGui:FindFirstChild("MouseTagLabel").MouseTag.Position = UDim2.new(0, v965.X, 0, v965.Y)
                            return
                        end
                    elseif v_u_949:FindFirstChild("Slot"):FindFirstChild("Display"):GetChildren()[1] and (v_u_949:IsA("Frame") or v_u_949:IsA("ImageLabel")) then
                        game.Players.LocalPlayer.PlayerGui:FindFirstChild("MouseTagLabel").MouseTag.Visible = true
                        local v966 = game:GetService("UserInputService"):GetMouseLocation()
                        game.Players.LocalPlayer.PlayerGui:FindFirstChild("MouseTagLabel").MouseTag.Position = UDim2.new(0, v966.X, 0, v966.Y)
                    end
                end
            end)
            v_u_949.MouseLeave:Connect(function()
                -- upvalues: (ref) v_u_54, (ref) v_u_89, (ref) v_u_55, (copy) v_u_949, (ref) v_u_23, (ref) v_u_210
                v_u_54 = true
                if v_u_89 and (v_u_55 and v_u_949.Name ~= "Slot-1") then
                    local v967 = v_u_23:JSONDecode(s_inv["Slot-1"].Value)
                    local v968 = v967 and v967.name
                    if v968 then
                        v968 = v967.count > 0
                    end
                    if not v968 then
                        local v969 = v_u_23:JSONDecode(s_inv[v_u_949.Name].Value)
                        local v970 = v969 and v969.name
                        if v970 then
                            v970 = v969.count > 0
                        end
                        if v970 then
                            local v971 = string.match(v_u_949.Name, "%d+")
                            v_u_210(-1, tonumber(v971), true)
                        end
                    end
                end
                game.Players.LocalPlayer.PlayerGui:FindFirstChild("MouseTagLabel").MouseTag.Visible = false
            end)
        end
    end
end
local v_u_973 = false
local v_u_974 = false
local v_u_975 = 0
local v_u_976 = 0
local v_u_977 = 0
function reload()
    -- upvalues: (ref) v_u_144, (ref) v_u_973, (ref) v_u_974, (ref) v_u_975, (ref) v_u_976, (copy) v_u_100, (copy) v_u_72, (ref) v_u_70, (copy) v_u_30, (copy) v_u_972, (copy) v_u_429, (copy) v_u_362, (ref) v_u_87, (copy) v_u_182, (copy) v_u_168, (ref) v_u_145, (copy) v_u_68, (ref) v_u_828, (copy) v_u_34, (copy) v_u_10, (copy) v_u_17, (copy) v_u_69, (copy) v_u_19, (copy) v_u_1, (ref) v_u_977
    v_u_144 = true
    print("- Reloading character... -")
    v_u_973 = false
    v_u_974 = false
    v_u_975 = 0
    v_u_976 = 0
    local v978 = 0
    local v979 = 0
    for _, v980 in pairs(v_u_100) do
        local v981, _ = pcall(v980.Disconnect, v980)
        if v981 then
            v978 = v978 + 1
        else
            v979 = v979 + 1
        end
    end
    print("Successfully disconnected", v978, "signal connections")
    table.clear(v_u_100)
    local v_u_982 = v_u_72:WaitForChild("LoadingGui")
    local v_u_983 = v_u_70:WaitForChild("HumanoidRootPart")
    v_u_70.HumanoidRootPart.CFrame = CFrame.new(0, 60 * v_u_30, 0)
    v_u_983.Anchored = true
    task.spawn(function()
        -- upvalues: (copy) v_u_982
        v_u_982.Label1.Text = "Loading inventory.."
        v_u_982.Label1Shadow.Text = "Loading inventory.."
    end)
    s_inv = v_u_70:WaitForChild("Inventory")
    while #s_inv:GetChildren() < 94 do
        task.wait()
        local v984 = #s_inv:GetChildren() / 36
        local v985 = math.clamp(v984, 0, 1)
        v_u_982.LBar.Bar.Size = UDim2.new(v985, 0, 1, 0)
    end
    v_u_972()
    print("Inventory has been updated")
    local v986 = v_u_70:WaitForChild("Humanoid")
    task.spawn(function()
        -- upvalues: (copy) v_u_982
        v_u_982.Label1.Text = "Loading HUD.."
        v_u_982.Label1Shadow.Text = "Loading HUD.."
    end)
    v_u_429(v986)
    linkHunger(game.Players.LocalPlayer)
    v_u_362()
    v_u_87 = 8
    v_u_182()
    v_u_168()
    print("Loaded inventory hud")
    local v987 = v_u_100
    local v988 = v_u_72.HUDGui.Inventory.DropButton.MouseButton1Down
    table.insert(v987, v988:Connect(function()
        game.ReplicatedStorage.GameRemotes.DropItem:InvokeServer(true)
    end))
    v986:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
    v986.MaxSlopeAngle = 1
    local v989 = v_u_100
    local v990 = v986.StateChanged
    local function v999(p991, p992)
        -- upvalues: (ref) v_u_145, (copy) v_u_983, (ref) v_u_30, (ref) v_u_68, (ref) v_u_828, (ref) v_u_34, (ref) v_u_10, (ref) v_u_17, (ref) v_u_974, (ref) v_u_975, (ref) v_u_976, (ref) v_u_70
        if p992 == Enum.HumanoidStateType.Running or (p992 == Enum.HumanoidStateType.RunningNoPhysics or (p992 == Enum.HumanoidStateType.Landed or p992 == Enum.HumanoidStateType.StrafingNoPhysics)) then
            v_u_145 = true
            if p992 == Enum.HumanoidStateType.Landed then
                local v993 = v_u_983.Position
                local v994 = -3 - v_u_30 / 2
                local v995 = v993 + Vector3.new(0, v994, 0)
                local v996, _ = v_u_68.getBlock(v_u_828(v995.X, v995.Y, v995.Z))
                local v997 = v996 and v996.id and v_u_34[v996.id]
                if v997 then
                    local v998 = v_u_10.Material[v997.material] or v_u_10.Material.default
                    v_u_17.playSound(v_u_983.Position + Vector3.new(0, -3, 0), v998, 1.3, 0.8)
                end
            end
        else
            v_u_145 = false
        end
        if p992 == Enum.HumanoidStateType.Freefall then
            v_u_974 = true
            v_u_975 = 0
            v_u_976 = v_u_70.HumanoidRootPart.Position.Y
        elseif p991 == Enum.HumanoidStateType.Freefall then
            v_u_974 = false
        end
    end
    table.insert(v989, v990:Connect(v999))
    task.spawn(function()
        -- upvalues: (ref) v_u_70
        v_u_70.HumanoidRootPart:WaitForChild("Jumping").Volume = 0
        v_u_70.HumanoidRootPart:WaitForChild("Running").Volume = 0
        v_u_70.HumanoidRootPart:WaitForChild("Landing").Volume = 0
        v_u_70.HumanoidRootPart:WaitForChild("Died").Volume = 0
        print("Disabled local default sounds")
    end)
    task.spawn(function()
        -- upvalues: (copy) v_u_982
        v_u_982.LBar.Visible = false
        v_u_982.Label1.Text = "Waiting for chunks.. (If this is stuck forever, rejoin).."
        v_u_982.Label1Shadow.Text = "Waiting for chunks.. (If this is stuck forever, rejoin).."
    end)
    local v1000 = game.ReplicatedStorage.PlayerPositionSaves
    local v1001 = v_u_69.UserId
    local v1002 = v1000:WaitForChild(tostring(v1001), 4)
    if v1002 then
        v1002 = v1002.Value
    end
    local v1003 = v_u_19.MWorldSpawns:GetChildren()
    local v1004 = #v1003 > 0 and v1003[math.random(1, #v1003)].Value or v_u_19.WorldSpawn.Value
    if v1002 then
        v_u_983.Anchored = true
        local v1005 = v1002.X
        local v1006 = v1002.Y
        local v1007 = v1002.Z
        local v1008 = Vector3.new(v1005, v1006, v1007)
        v_u_983.CFrame = CFrame.new(v1008)
        local v1009 = v_u_983.Position / 3
        local v1010 = v1009.X
        local v1011 = math.round(v1010)
        local v1012 = v1009.Y
        local v1013 = math.floor(v1012)
        local v1014 = v1009.Z
        local v1015 = math.round(v1014)
        local v1016 = Vector3.new(v1011, v1013, v1015)
        local v1017 = v1016.X / 16
        local v1018 = math.floor(v1017)
        local v1019 = v1016.Z / 16
        local v1020 = math.floor(v1019)
        repeat
            task.wait(0.1)
        until v_u_68.World[v1018] and v_u_68.World[v1018][v1020]
        local v1021 = workspace
        local v1022 = Ray.new
        local v1023 = v_u_983.Position
        local v1024 = -255 * v_u_30
        local _, _ = v1021:FindPartOnRayWithWhitelist(v1022(v1023, (Vector3.new(0, v1024))), { v_u_1 })
        while true do
            task.wait(0.1)
            local v1025, v1026 = v_u_68.getBlock(v1016.X, v1016.Y, v1016.Z)
            if v1025 and v1025.id ~= nil then
                v1016 = v1016 + Vector3.new(0, 1, 0)
            end
            local v1027 = workspace
            local v1028 = Ray.new
            local v1029 = v1016 * 3
            local v1030 = -255 * v_u_30
            local v1031, _ = v1027:FindPartOnRayWithWhitelist(v1028(v1029, (Vector3.new(0, v1030))), { v_u_1 })
            if not (v1025 and v1025.id) and v1031 then
                local v1032 = v1016.X * 3
                local v1033 = v1016.Y * 3
                local v1034 = v1016.Z * 3
                local v1035 = Vector3.new(v1032, v1033, v1034) + Vector3.new(1.5, 0, 1.5)
                v_u_983.CFrame = CFrame.new(v1035)
                print("Waiting for chunk load")
                repeat
                    task.wait()
                until v1026.Loaded
                v_u_983.Anchored = false
                ::l31::
                v_u_144 = false
                game.ReplicatedStorage.GameRemotes.StartRecordingPos:FireServer()
                v_u_974 = false
                v_u_973 = false
                v_u_975 = 0
                v_u_976 = 0
                if v_u_982 then
                    v_u_982:Destroy()
                    workspace.CurrentCamera.FieldOfView = v_u_72:WaitForChild("Settings"):WaitForChild("FOV").Value
                end
                v_u_87 = 0
                v_u_182()
                v_u_977 = v_u_977 + 1
                print("Character is successfully loaded")
                return
            end
        end
    else
        v_u_983.Anchored = true
        repeat
            task.wait(0.1)
        until game.Players.LocalPlayer:FindFirstChild("spawnOverride") or game.Players.LocalPlayer:FindFirstChild("SpawnOK")
        print("Finding suitable spawn position")
        if game.Players.LocalPlayer:FindFirstChild("spawnOverride") then
            v1004 = game.Players.LocalPlayer.spawnOverride.Value
            game.Players.LocalPlayer.spawnOverride:Destroy()
        elseif game.Players.LocalPlayer:FindFirstChild("SpawnOK") then
            game.Players.LocalPlayer.SpawnOK:Destroy()
        end
        v_u_983.CFrame = CFrame.new(v1004.X, v1004.Y, v1004.Z)
        local v1036 = v_u_983.Position / 3
        local v1037 = v1036.X
        local v1038 = math.round(v1037)
        local v1039 = v1036.Y
        local v1040 = math.floor(v1039)
        local v1041 = v1036.Z
        local v1042 = math.round(v1041)
        local v1043 = Vector3.new(v1038, v1040, v1042)
        local v1044 = v1043.X / 16
        local v1045 = math.floor(v1044)
        local v1046 = v1043.Z / 16
        local v1047 = math.floor(v1046)
        repeat
            task.wait(0.1)
        until v_u_68.World[v1045] and v_u_68.World[v1045][v1047]
        print("Finding suitable spawn position")
        local v1048 = workspace
        local v1049 = Ray.new
        local v1050 = v_u_983.Position
        local v1051 = -255 * v_u_30
        local _, _ = v1048:FindPartOnRayWithWhitelist(v1049(v1050, (Vector3.new(0, v1051))), { v_u_1 })
        while true do
            task.wait(0.1)
            local v1052, v1053 = v_u_68.getBlock(v1043.X, v1043.Y, v1043.Z)
            if v1052 and v1052.id ~= nil then
                v1043 = v1043 + Vector3.new(0, 1, 0)
            end
            local v1054 = workspace
            local v1055 = Ray.new
            local v1056 = v1043 * 3
            local v1057 = -255 * v_u_30
            local v1058, _ = v1054:FindPartOnRayWithWhitelist(v1055(v1056, (Vector3.new(0, v1057))), { v_u_1 })
            if not (v1052 and v1052.id) and v1058 then
                v_u_983.CFrame = CFrame.new(v1043 * 3)
                print("Waiting for chunk load")
                repeat
                    task.wait()
                until v1053.Loaded
                v_u_983.Anchored = false
                goto l31
            end
        end
    end
end
v_u_69.CharacterAdded:Connect(function(p1059)
    -- upvalues: (ref) v_u_144, (ref) v_u_70
    if not v_u_144 then
        v_u_70 = p1059
        reload()
    end
end)
task.spawn(reload)
game.ReplicatedStorage.GameRemotes.ServerChat.OnClientEvent:Connect(function(p1060)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        ["Text"] = p1060.Text,
        ["Color"] = p1060[2] or Color3.new(0, 1, 0),
        ["Font"] = p1060[3] or Enum.Font.SourceSansBold,
        ["FontSize"] = Enum.FontSize.Size18
    })
end)
local v_u_1061 = game.Lighting.WaterColorCorrection
local v_u_1062 = game.Lighting.LavaColorCorrection
local v_u_1063 = game.ReplicatedStorage.SnowPart
function mLoop(_)
    -- upvalues: (ref) v_u_70, (copy) v_u_1063, (copy) v_u_68, (ref) v_u_828, (copy) v_u_30, (copy) v_u_3, (copy) v_u_34, (copy) v_u_35, (copy) v_u_1062, (copy) v_u_457, (copy) v_u_69, (ref) v_u_121, (ref) v_u_152, (copy) v_u_14, (copy) v_u_19, (copy) v_u_1061, (ref) v_u_102, (ref) v_u_125, (ref) v_u_974, (ref) v_u_973, (ref) v_u_976, (ref) v_u_975
    if v_u_70 and (v_u_70.Parent and v_u_70:FindFirstChild("HumanoidRootPart")) then
        local v1064 = v_u_70.Humanoid
        local v1065 = v_u_70.HumanoidRootPart
        v1064:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        v1064:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        v_u_1063.CFrame = CFrame.new(v1065.CFrame.Position + Vector3.new(0, 10, 0))
        local v1066 = v1065.Position
        local _, _ = v_u_68.getBlock(v_u_828(v1066.X, v1066.Y - 2, v1066.Z))
        local v1067 = v1065:FindFirstChild("Grav")
        if not v1067 then
            v1067 = Instance.new("BodyForce")
            v1067.Name = "Grav"
            v1067.Force = Vector3.new()
            v1067.Parent = v1065
        end
        local v1068 = v1065:FindFirstChild("Swim")
        if not v1068 then
            v1068 = Instance.new("BodyVelocity")
            v1068.Name = "Swim"
            v1068.Velocity = Vector3.new()
            v1068.MaxForce = Vector3.new()
            v1068.Parent = v1065
        end
        local v1069 = v1065.Velocity
        local v1070 = workspace.CurrentCamera.CFrame.Position / v_u_30 + Vector3.new(0.5, 0, 0.5)
        local v1071 = v1070.X
        local v1072 = math.floor(v1071)
        local v1073 = v1070.Y
        local v1074 = math.floor(v1073)
        local v1075 = v1070.Z
        local v1076 = math.floor(v1075)
        local v1077 = Vector3.new(v1072, v1074, v1076)
        v_u_3.CamPosRounded = v1077
        local v1078 = v_u_68.getBlock(v1077.X, v1077.Y, v1077.Z)
        local v1079 = v_u_68.getBlock(v1077.X, v1077.Y - 1, v1077.Z)
        local v1080 = v1078 and v1078.id
        if v1080 then
            v1080 = v_u_34[v1078.id].blocktype
        end
        local v1081 = v1079 and v1079.id
        if v1081 then
            v1081 = v_u_34[v1079.id].blocktype
        end
        local v1082 = false
        local v1083 = false
        local v1084, v1085
        if v1080 == "fluid" then
            v1084 = v1078.id == v_u_35.Water.id and true or v1078.id == v_u_35.PhantomWater.id
            if v1078.id == v_u_35.Lava.id then
                v1085 = true
            else
                v1085 = false
            end
        else
            v1085 = false
            v1084 = false
        end
        if v1081 == "fluid" then
            v1082 = v1079.id == v_u_35.Water.id and true or v1079.id == v_u_35.PhantomWater.id
            if v1079.id == v_u_35.Lava.id then
                v1083 = true
            else
                v1083 = false
            end
        end
        if v1084 then
            local v1086 = v_u_68.getBlock(v1077.X, v1077.Y + 1, v1077.Z)
            local v1087 = v1086 and v1086.id
            if v1087 then
                v1087 = v_u_34[v1086.id].blocktype
            end
            if v1087 ~= "fluid" or v1078.id ~= v_u_35.Water.id and v1078.id ~= v_u_35.PhantomWater.id then
                if v1070.Y - v1078.position.Y - 0.4 > 0 then
                    v1084 = false
                end
            end
        end
        if v1085 then
            local v1088 = workspace.Gravity * 0.75
            v1067.Force = Vector3.new(0, v1088, 0)
            if v1064.Jump then
                v1068.Velocity = Vector3.new(0, 3, 0)
                v1068.MaxForce = Vector3.new(0, 280, 0)
                v1068.P = 7500
            else
                v1068.MaxForce = Vector3.new(0, 0, 0)
            end
            v1065.Velocity = v1069 * 0.5
            v_u_1062.Enabled = true
            game.Lighting.FogEnd = 75
            game.Lighting.FogStart = 0
        elseif v1084 then
            v_u_457()
            v_u_69.PlayerGui.HUDGui.Hotbar.BubbleBar.Visible = true
            if v_u_121 == false then
                v_u_121 = tick()
            elseif tick() - v_u_121 > 2 then
                if v_u_152 < 1 then
                    v_u_121 = tick()
                    local v1089 = v1064.MaxHealth * 0.05
                    if v_u_14.getGamemode() ~= 1 then
                        v_u_19.GameRemotes.Demo:FireServer(v1089, "drowning")
                    end
                elseif tick() - v_u_121 > 5 then
                    v_u_121 = tick()
                    v_u_152 = v_u_152 - 1
                end
            end
            v_u_1061.Enabled = true
            game.Lighting.FogEnd = 75
            game.Lighting.FogStart = 0
        else
            v_u_121 = false
            v_u_152 = 10
            v_u_69.PlayerGui.HUDGui.Hotbar.BubbleBar.Visible = false
            v_u_1061.Enabled = false
            v_u_1062.Enabled = false
            game.Lighting.FogEnd = 2000
            game.Lighting.FogStart = 500
        end
        if v1083 then
            v_u_102 = true
            local v1090 = workspace.Gravity * 0.7
            v1067.Force = Vector3.new(0, v1090, 0)
            if v1064.Jump then
                v1068.Velocity = Vector3.new(0, 6, 0)
                v1068.MaxForce = Vector3.new(0, 28000, 0)
                v1068.P = 7500
            else
                v1068.MaxForce = Vector3.new(0, 0, 0)
            end
            v1065.Velocity = v1069 * 0.7
        elseif v1082 then
            v_u_102 = true
            local v1091 = workspace.Gravity * 0.8
            v1067.Force = Vector3.new(0, v1091, 0)
            if v1064.Jump then
                v1068.Velocity = Vector3.new(0, 8, 0)
                v1068.MaxForce = Vector3.new(0, 28000, 0)
                v1068.P = 7500
            else
                v1068.MaxForce = Vector3.new(0, 0, 0)
            end
            v1065.Velocity = v1069 * 0.8
        else
            v_u_102 = false
            v1068.Velocity = Vector3.new()
            v1068.MaxForce = Vector3.new()
            v1067.Force = Vector3.new()
        end
        if v_u_125 <= 0 and v1065.Position.Y <= -64 * v_u_30 then
            local v1092 = v1064.MaxHealth * 20
            if v_u_14.getGamemode() ~= 1 then
                v_u_19.GameRemotes.Demo:FireServer(v1092, "void")
            end
            v_u_125 = 0.5
        end
        if v_u_974 and not v_u_102 then
            v_u_973 = true
            local v1093 = v_u_70.HumanoidRootPart.Position.Y - v_u_976
            v_u_976 = v_u_70.HumanoidRootPart.Position.Y
            if v1093 < 0 then
                v_u_975 = v_u_975 - v1093
                return
            end
        elseif v_u_973 then
            v_u_973 = false
            local v1094 = v_u_70.HumanoidRootPart.Position.Y - v_u_976
            v_u_976 = v_u_70.HumanoidRootPart.Position.Y
            if v1094 < 0 then
                v_u_975 = v_u_975 - v1094
            end
            if not v_u_102 then
                local v1095 = v_u_975 / v_u_30 + 0.1 - 3
                local v1096 = math.max(0, v1095) * 5
                if v1096 >= 5 and v_u_14.getGamemode() ~= 1 then
                    v_u_19.GameRemotes.Demo:FireServer(v1096, "fall")
                end
                if v_u_30 <= v_u_975 then
                    local v1097 = v_u_30
                    local v1098, v1099, v1100 = v_u_828(v_u_70.HumanoidRootPart.Position - Vector3.new(0, v1097, 0))
                    local v1101, _ = v_u_68.getBlock(v1098, v1099, v1100)
                    if v1101 and (v1101.id == v_u_35.DryFarmland.id or v1101.id == v_u_35.WetFarmland.id) then
                        game.ReplicatedStorage.GameRemotes.StompSoil:FireServer(v1098, v1099, v1100)
                    end
                end
            end
            v_u_975 = 0
        end
    end
end
game.ReplicatedStorage.GameRemotes.BeingAttacked.OnClientEvent:Connect(function(p1102)
    -- upvalues: (ref) v_u_70
    if p1102 and p1102.Magnitude > 0 then
        for _, v1103 in pairs(v_u_70:GetChildren()) do
            if v1103:IsA("Part") then
                local v1104 = v1103.Velocity
                local v1105 = CFrame.new
                local v1106 = Vector3.new()
                local v1107 = p1102.X
                local v1108 = p1102.Z
                local v1109 = v1105(v1106, (Vector3.new(v1107, 0, v1108)))
                local v1110 = CFrame.new
                local v1111 = v1103.Velocity.Y / 4
                v1103.Velocity = v1104 + (v1109 * v1110(0, 5 / (math.max(0, v1111) + 1), -3)).Position
            end
        end
    end
end)
coroutine.wrap(function()
    -- upvalues: (copy) v_u_1063, (copy) v_u_30, (copy) v_u_19, (copy) v_u_69, (copy) v_u_2, (copy) v_u_1
    wait(5)
    local v1112 = v_u_1063.ParticleEmitter
    v_u_1063.Parent = workspace
    while true do
        while true do
            wait(1)
            local v1113 = workspace.CurrentCamera.CFrame.Position
            local v1114 = (v1113.X + 0.5 * v_u_30) / v_u_30
            local v1115 = math.floor(v1114)
            local v1116 = (v1113.Z + 0.5 * v_u_30) / v_u_30
            local v1117 = math.floor(v1116)
            if v_u_19.GameRemotes.GetBiome:InvokeServer(v1115, v1117) == "winter" and (v_u_69.Character and v_u_69.Character.HumanoidRootPart) then
                break
            end
            v1112.Enabled = false
        end
        local v1118 = RaycastParams.new()
        v1118.FilterDescendantsInstances = { v_u_2, v_u_1 }
        v1118.FilterType = Enum.RaycastFilterType.Whitelist
        if workspace:Raycast(v_u_69.Character.HumanoidRootPart.Position, Vector3.new(0, 90, 0), v1118) then
            v1112.Enabled = false
        else
            v1112.Enabled = true
        end
    end
end)()
game:GetService("ScriptContext").Error:Connect(function(p1119)
    -- upvalues: (copy) v_u_69
    if p1119 == "not enough memory" then
        v_u_69:Kick("Not enough memory, please reconnect")
    end
end)
_G.ESPENB = false
game.ReplicatedStorage:WaitForChild("GameRemotes"):WaitForChild("SendSignNotif").OnClientEvent:Connect(function()
    -- upvalues: (copy) v_u_68
    if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 1068463222) then
        if _G.ESPENB == true then
            _G.ESPENB = false
        else
            v_u_68.ProcessAllXrayChunks()
            _G.ESPENB = true
        end
    else
        return
    end
end)
local function v_u_1123(p1120)
    -- upvalues: (copy) v_u_8
    local v1121 = p1120[1]
    if v1121.BlockerPart then
        v1121.BlockerPart:Destroy()
    end
    v1121.vfold:Destroy()
    v_u_8.TryToYield()
    v1121.vlfold:Destroy()
    for v1122, _ in pairs(v1121) do
        v1121[v1122] = nil
    end
end
local function v_u_1128(p1124)
    -- upvalues: (copy) v_u_8
    local v1125 = 0
    local v1126 = p1124[1]
    if v1126.Loaded == true then
        for _, v1127 in pairs(v1126.vlfold:GetChildren()) do
            v1127.Transparency = 0
            v1125 = v1125 + 1
            if v1125 > 100 then
                v_u_8.TryToYield()
            end
        end
    end
end
local function v_u_1133(p1129)
    -- upvalues: (copy) v_u_9, (copy) v_u_8
    local v1130 = 0
    local v1131 = p1129[1]
    if v1131.Loaded == true then
        for _, v1132 in pairs(v1131.vlfold:GetChildren()) do
            v1132.Transparency = 1
            v1130 = v1130 + 1
            if v1130 > 100 then
                v_u_8.TryToYield()
            end
        end
    else
        v1131.Fideltiy = v_u_9.ChunkFidelity.Default
    end
end
v_u_20.RenderStepped:Connect(function(p1134)
    -- upvalues: (ref) v_u_70, (copy) v_u_68, (copy) v_u_30, (ref) v_u_31, (copy) v_u_8, (copy) v_u_1123, (copy) v_u_33, (copy) v_u_9, (copy) v_u_1133, (copy) v_u_1128, (ref) v_u_32, (copy) v_u_384, (ref) v_u_385, (copy) v_u_380, (copy) v_u_3, (copy) v_u_18, (copy) v_u_72, (ref) v_u_43
    debug.profilebegin("L1")
    local v1135 = game.Players.LocalPlayer
    local v1136
    if v_u_70 and (v_u_70.Parent and v_u_70:FindFirstChild("HumanoidRootPart")) then
        local v1137 = v1135.Character.HumanoidRootPart
        debug.profilebegin("L2")
        mLoop(p1134)
        debug.profileend()
        v_u_68.update(p1134)
        v1136 = v1137.Position
    else
        v1136 = workspace.CurrentCamera.CFrame.Position
    end
    debug.profileend()
    local v1138 = Vector2.new(v1136.X / 16 / v_u_30, v1136.Z / 16 / v_u_30)
    debug.profilebegin("L3")
    for v1139, v1140 in pairs(v_u_68.RenderingChunks) do
        for v1141, v1142 in pairs(v1140) do
            if not (v_u_68.LoadingChunks[v1139] and v_u_68.LoadingChunks[v1139][v1141]) then
                if v_u_31 < Vector2.new(v1138.X - (v1139 + 0.5), v1138.Y - (v1141 + 0.5)).Magnitude then
                    v_u_68.World[v1139][v1141] = nil
                    v_u_68.LoadingChunks[v1139][v1141] = nil
                    v_u_68.RenderingChunks[v1139][v1141] = nil
                    v1142.Loaded = -1
                    v_u_8.NewTask(coroutine.create(v_u_1123), { v1142 }, "ChunkDeloading")
                elseif Vector2.new(v1139 * 16 + 8 - v1136.X / 3, v1141 * 16 + 8 - v1136.Z / 3).Magnitude < v_u_33 then
                    if v1142.Fidelity < v_u_9.ChunkFidelity.Fancy then
                        v1142.Fidelity = v_u_9.ChunkFidelity.Fancy
                        v_u_8.NewTask(coroutine.create(v_u_1133), { v1142 }, "ChunkFidelityWorker")
                    end
                elseif v1142.Fidelity > v_u_9.ChunkFidelity.Fast then
                    v1142.Fidelity = v_u_9.ChunkFidelity.Fast
                    v_u_8.NewTask(coroutine.create(v_u_1128), { v1142 }, "ChunkFidelityWorker")
                end
            end
        end
    end
    debug.profileend()
    debug.profilebegin("L4")
    local v1143 = -v_u_32
    local v1144 = v_u_32
    for v1145 = math.floor(v1143), math.ceil(v1144) do
        local v1146 = -v_u_32
        local v1147 = v_u_32
        for v1148 = math.floor(v1146), math.ceil(v1147) do
            local v1149 = v1138.X + v1145
            local v1150 = v1138.Y + v1148
            local v1151 = math.floor(v1149)
            local v1152 = math.floor(v1150)
            if v_u_32 >= Vector2.new(v1138.X - (v1151 + 0.5), v1138.Y - (v1152 + 0.5)).Magnitude then
                local v1153 = v_u_68.getChunk(v1151, v1152)
                if (not v1153 or v1153.Loaded ~= true) and not (v_u_68.LoadingChunks[v1151] and v_u_68.LoadingChunks[v1151][v1152]) then
                    v_u_68.loadServerChunk(v1151, v1152)
                end
            end
        end
    end
    debug.profileend()
    if v_u_384 == "Mobile" and (v_u_385 ~= nil and v_u_385.Visible == false) then
        v_u_385.Visible = true
        v_u_385.Open.Activated:Connect(v_u_380)
    end
    local v1154 = v_u_3.BlockUnderMouse
    if v_u_3.BlockUnderMouse and v_u_18.IsBreaking(v_u_3.BlockUnderMouse.Position) then
        if v1154.Name == "Chest" then
            v_u_72.HUDGui.Overshadow.Visible = false
            v_u_72.HUDGui.Inventory.Visible = false
        elseif v1154.Name == "Furnace" then
            v_u_72.HUDGui.Overshadow.Visible = false
            v_u_72.HUDGui.Inventory.Visible = false
        end
    end
    if v1135:FindFirstChild("PlayerGui") then
        if v1135.PlayerGui:FindFirstChild("HUDGui") and v1135.PlayerGui.HUDGui:FindFirstChild("Back") then
            v_u_385 = v1135.PlayerGui.HUDGui.Back
        end
        if v1135.Character:FindFirstChildOfClass("ForceField") then
            v_u_43 = false
            return
        end
        v_u_43 = true
    end
end)
