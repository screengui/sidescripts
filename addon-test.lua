_G.Tabs.Main:AddToggle("Toggle", {
    Title = "Kill Aura",
    Default = false,
    Callback = function(state)
        if state then
            _G.Fluent:Notify({
                Title = "Enabled!",
                Content = "Kill Aura Enabled.",
                SubContent = "This will not work as it is only an example",
                Duration = 5
            })
        else
            _G.Fluent:Notify({
                Title = "Disabled!",
                Content = "Kill Aura Disabled.",
                SubContent = "This will not work as it is only an example",
                Duration = 5
            })
        end
    end
})
