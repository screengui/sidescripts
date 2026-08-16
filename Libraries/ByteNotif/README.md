# ByteNotif Documentation

`ByteNotif` is a lightweight, customizable Roblox ModuleScript designed for creating animated toast notifications in player interfaces.

---

## Installation & Setup

1. Initialize the Library:

```lua
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/screengui/sidescripts/refs/heads/main/Libraries/ByteNotif/NotificationLibrary.lua"))()
```

- This is REQUIRED for the notification library to work.

---

## API Reference

### `NotificationLibrary.Notify(config)`

Creates and displays a new notification on the player's screen with slide-in/slide-out tweening and a remaining-time progress bar.

#### Configuration Table Parameters

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `Title` | `string` | `"Notification"` | The header text displayed at the top of the notification card. |
| `Text` | `string` | `""` | The main message content inside the notification card. |
| `Duration` | `number` | `4` | How long (in seconds) the notification stays visible before auto-dismissing. |
| `Type` | `string` | `"Info"` | Notification visual theme preset (`"Info"`, `"Success"`, `"Warning"`, `"Error"`). |
| `Color` | `Color3` | *Based on `Type*` | Custom accent color for the left border and progress bar. Overrides preset themes. |

---

## Themes & Defaults

The library includes four built-in visual color presets:

| Theme | Accent Color (`Color3.fromRGB`) | Preview |
| --- | --- | --- |
| **Info** | `0, 150, 255` | Vibrant Blue |
| **Success** | `46, 204, 113` | Emerald Green |
| **Warning** | `241, 196, 15` | Amber Yellow |
| **Error** | `231, 76, 60` | Crimson Red |

---

## Usage Examples

### Basic Information Toast

```lua
NotificationLibrary.Notify({
    Title = "System Update",
    Text = "Your progress has been saved automatically.",
    Type = "Info",
    Duration = 5
})

```

### Success Notification

```lua
NotificationLibrary.Notify({
    Title = "Item Purchased!",
    Text = "You bought a Speed Potion for 50 Coins.",
    Type = "Success"
})

```

### Custom Accent Color

```lua
NotificationLibrary.Notify({
    Title = "Level Up!",
    Text = "You reached Level 50!",
    Color = Color3.fromRGB(155, 89, 182), -- Custom Purple
    Duration = 6
})

```

---

## Features & Architecture

* **Auto-Stacking Layout:** Uses `UIListLayout` to automatically arrange multiple incoming notifications cleanly at the bottom-right corner of the screen (`UDim2.new(1, -310, 0, 10)`).
* **Tween Animations:** Utilizes `TweenService` with `Enum.EasingStyle.Quart` for fluid entrance and exit transitions.
* **Animated Countdown:** Features a bottom progress bar that dynamically shrinks over the course of the given `Duration`.
* **Garbage Collection:** Calls `Instance:Destroy()` on notification cards post-animation to clean up instances and prevent UI memory leaks.
