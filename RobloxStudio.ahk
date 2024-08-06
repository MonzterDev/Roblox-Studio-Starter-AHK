#Requires AutoHotkey v2.0

; There are two sets of hotkeys.
; One set (START_KEY and STOP_KEY) is the hotkeys which are sent to Roblox Studio.
; The other set (F5 and F6) towards the bottom of the script is the hotkeys which are used to trigger the script.

START_KEY := "F5" ; Change this to the key you have set to Start in Roblox Studio.
STOP_KEY := "F6" ; Change this to the key you have set to Stop in Roblox Studio.

; Define a function to send a key to Roblox Studio
SendKeyToRobloxStudio(key)
{
    ; Get the window handle of Roblox Studio
    hwnd := WinExist("ahk_exe RobloxStudioBeta.exe")

    ; Check if the Roblox Studio window exists
    if hwnd
    {
        ; Get the current mouse position
        MouseGetPos &originalX, &originalY

        ; Get the handle of the currently active window
        activeWindow := WinExist("A")

        ; Activate the Roblox Studio window
        WinActivate(hwnd)

        ; Wait a moment to ensure the window is activated
        Sleep 100

        ; Send the specified key to the Roblox Studio window
        ControlSend(key, , hwnd)

        ; Reactivate the previously active window
        if activeWindow
        {
            WinActivate(activeWindow)
            ; Move the mouse back to the original position
            MouseMove(originalX, originalY)
        }
        else
        {
            MsgBox "The previously active window was not found."
        }
    }
    else
    {
        ; Notify the user if Roblox Studio is not found
        MsgBox "Roblox Studio is not running or not found."
    }
}

; Hotkeys to use the function
F5::
{
    SendKeyToRobloxStudio("{" START_KEY "}")
}

F6::
{
    SendKeyToRobloxStudio("{" STOP_KEY "}")
}
