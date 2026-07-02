#Requires AutoHotkey v2.0
#SingleInstance Force

; ============================================================================
; 🪟 WINDOW MANAGEMENT HOTKEYS
; ============================================================================

; Win + Alt + T: Toggle "Always on Top" for the active window
#!t:: {
    WinSetAlwaysOnTop -1, "A"
    ToolTip("Always on Top Toggled")
    SetTimer () => ToolTip(), -1500 ; Hide tooltip after 1.5s
}

; Win + Alt + Q: Force close the active window (Cleaner than Alt+F4)
#!q:: {
    ActiveHwnd := WinExist("A")
    if (ActiveHwnd) {
        WinClose("ahk_id " ActiveHwnd)
    }
}

; Win + Alt + N: Launch or focus Notepad
#!n:: {
    if WinExist("ahk_class Notepad")
        WinActivate
    else
        Run("notepad.exe")
}

; ============================================================================
; 📋 UTILITY & SYSTEM HOTKEYS
; ============================================================================

; Win + Alt + V: Paste raw text (strips formatting/styles from clipboard)
#!v:: {
    A_Clipboard := A_Clipboard ; Converts clipboard contents to plain text
    Send("^v")
}

; Win + Alt + C: Open Google Chrome (or focus if already open)
#!c:: {
    if WinExist("ahk_exe chrome.exe")
        WinActivate
    else
        Run("chrome.exe")
}

; ============================================================================
; 🛠️ SCRIPT CONTROL (Crucial for testing changes)
; ============================================================================

; Win + Alt + R: Quick reload this script after making adjustments
#!r:: {
    ToolTip("Reloading AHK Script...")
    Sleep(500)
    Reload()
}
