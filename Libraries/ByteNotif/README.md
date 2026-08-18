# <div align="center">âš¡ ByteNotif</div>

<div align="center">

A modern, lightweight, and customizable Roblox notification library designed for smooth UI toast popups with built-in sounds, themes, early dismissal, and interactive action buttons.

[![Roblox](https://img.shields.io/badge/Roblox-Luau-00A2FF?style=for-the-badge&logo=roblox&logoColor=white)](https://roblox.com)
[![License](https://img.shields.io/badge/License-MIT-green.style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/Version-2.0.0-blue?style=for-the-badge)](https://github.com/screengui/sidescripts)

</div>

---

## âœ¨ Features

- ðŸŽ¨ **Built-in & Custom Themes:** Standard presets (`Info`, `Success`, `Warning`, `Error`) with full custom `Color3` support.
- ðŸŽµ **Sound Integration:** Automatically plays type-specific audio cues with configurable asset IDs, volume, and pitch.
- ðŸ”˜ **Interactive Buttons:** Attach multi-action buttons (e.g., *Accept / Decline*) with custom callback functions.
- âš¡ **Fluid Animations:** Powered by `TweenService` for smooth entry, progress bar timers, and slide-out exits.
- ðŸ‘† **Flexible Dismissal:** Supports click-to-dismiss, top-right `Ã—` close buttons, or non-dismissable pinned alerts.
- ðŸ§¹ **Automatic Garbage Collection:** Automatically cleans up UI instances, audio objects, and active tweens to prevent memory leaks.

---

## ðŸš€ Quick Setup

Initialize `ByteNotif` in any `LocalScript` or executor environment:

```lua
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/screengui/sidescripts/refs/heads/main/Libraries/ByteNotif/NotificationLibrary.lua"))()
```

---

## ðŸ“š API Reference

### `NotificationLibrary.Notify(config)`

Creates and displays a new notification toast on the player's screen.

#### Configuration Options

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `Title` | `string` | `"Notification"` | Header text displayed at the top of the notification card. |
| `Text` | `string` | `""` | Main body message displayed inside the card. |
| `Duration` | `number` | `5` | Time (in seconds) the notification remains active before auto-dismissing. |
| `Type` | `string` | `"Info"` | Theme preset (`"Info"`, `"Success"`, `"Warning"`, `"Error"`). |
| `Color` | `Color3` | *Preset default* | Custom accent color for the side bar and progress timer. Overrides `Type`. |
| `DismissOnClick` | `boolean` | `true` | Allows players to click anywhere on the card to dismiss it instantly. |
| `CloseButton` | `boolean` | `true` | Shows an `Ã—` icon in the top-right corner. |
| `Buttons` | `table` | `{}` | Array of action button configuration tables. |
| `PlaySound` | `boolean` | `true` | Mutes audio playback if set to `false`. |
| `SoundId` | `string` | *Preset default* | Custom Roblox Asset ID string (e.g., `"rbxassetid://1234567"`). |
| `Volume` | `number` | `0.5` | Loudness of the sound effect (`0.0` to `1.0`+). |
| `Pitch` | `number` | `1.0` | Playback speed / pitch multiplier. |

---

#### ðŸ”˜ Action Button Configuration (`Buttons` Array)

Each button configuration object inside the `Buttons` array accepts the following parameters:

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `Text` | `string` | `"Button"` | Text label displayed on the action button. |
| `Callback` | `function` | `function() end` | Function executed when the button is clicked. Auto-dismisses the notification. |
| `Color` | `Color3` | `Color3.fromRGB(45, 45, 50)` | Background color of the button. |
| `TextColor` | `Color3` | `Color3.fromRGB(255, 255, 255)` | Text color of the button label. |

---

## ðŸŽ¨ Theme Presets

| Theme | Accent Color (`Color3.fromRGB`) | Default Audio Asset | Preview Style |
| :--- | :--- | :--- | :--- |
| **`Info`** | `0, 150, 255` | `rbxassetid://6895079853` | ðŸ”µ Vibrant Blue |
| **`Success`** | `46, 204, 113` | `rbxassetid://6895079712` | ðŸŸ¢ Emerald Green |
| **`Warning`** | `241, 196, 15` | `rbxassetid://6895079553` | ðŸŸ¡ Amber Yellow |
| **`Error`** | `231, 76, 60` | `rbxassetid://6895079371` | ðŸ”´ Crimson Red |

---

## ðŸ’» Code Examples

### Standard Information Toast

```lua
NotificationLibrary.Notify({
    Title = "System Update",
    Text = "Your game progress has been saved automatically.",
    Type = "Info",
    Duration = 5
})
```

### Success Notification with Default Audio

```lua
NotificationLibrary.Notify({
    Title = "Item Purchased!",
    Text = "You bought a Speed Potion for 50 Coins.",
    Type = "Success"
})
```

### Custom Color Accent

```lua
NotificationLibrary.Notify({
    Title = "Level Up!",
    Text = "Congratulations! You reached Level 50.",
    Color = Color3.fromRGB(155, 89, 182), -- Custom Purple
    Duration = 6
})
```

### Interactive Action Buttons (Accept / Decline)

```lua
NotificationLibrary.Notify({
    Title = "Trade Offer",
    Text = "PlayerOne sent you a trade request.",
    Type = "Info",
    Duration = 10,
    Buttons = {
        {
            Text = "Decline",
            Color = Color3.fromRGB(180, 50, 50),
            Callback = function()
                print("Trade declined!")
            end
        },
        {
            Text = "Accept",
            Color = Color3.fromRGB(46, 204, 113),
            Callback = function()
                print("Trade accepted!")
            end
        }
    }
})
```

### Custom Audio & Pitch Adjustment

```lua
NotificationLibrary.Notify({
    Title = "Rare Loot Found!",
    Text = "You obtained a Golden Sword from the chest.",
    SoundId = "rbxassetid://9114223178",
    Volume = 0.8,
    Pitch = 1.25
})
```

### Silent & Pinned Alert (Non-Dismissable)

```lua
NotificationLibrary.Notify({
    Title = "Server Maintenance",
    Text = "The server will shut down in 60 seconds.",
    Type = "Warning",
    PlaySound = false,
    DismissOnClick = false,
    CloseButton = false
})
```

---

## âš™ï¸ Architecture & Mechanics

- **Auto-Stacking Container:** Uses a client-side `ScreenGui` containing a `UIListLayout` aligned to `Bottom-Right` (`UDim2.new(1, -330, 0, 10)`).
- **Dynamic Resizing:** Cards auto-expand vertically (from `70px` to `95px`) when embedded buttons are supplied.
- **Memory Safety:** Automatically disconnects button connections, stops active duration tweens upon early dismissal, and destroys sound instances post-playback.

---

<div align="center">

Made with â¤ï¸ for Roblox Luau Developers

</div>
