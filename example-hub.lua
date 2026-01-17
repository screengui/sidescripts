local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Toggle = Tabs.Main:AddToggle("MyToggle", 
{
    Title = "Toggle", 
    Description = "Toggle description",
    Default = false
    Callback = function(state)
	      if state then
	        print("Toggle On")
	      else
	        print("Toggle Off")
        end
    end 
})

_G.Fluent = Fluent
_G.Window = Window
_G.Tabs = Tabs
