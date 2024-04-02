#Persistent
CoordMode, Mouse, Screen

; Set the distance from the corner where the shortcut will trigger
cornerBuffer := 10

; Define the top-right corner
cornerX_Right := A_ScreenWidth - cornerBuffer
cornerY := cornerBuffer

; Define the top-left corner
cornerX_Left := cornerBuffer

; Define variables to track whether the Task View has been activated and whether the mouse is in the bottom-right corner
taskViewActivated := false

; Define the function to switch to the next window
SwitchToNextWindow() {
    WinActivate, ahk_class Shell_TrayWnd
    Send, ^#{Right}
}

; Define the function to switch to the previous window
SwitchToPreviousWindow() {
    WinActivate, ahk_class Shell_TrayWnd
    Send, ^#{Left}
}

; Define a function to check if Task View is open
IsTaskViewOpen() {
    WinGetTitle, currentWindow, A
    return (currentWindow = "Task View")
}

; Define a function to send keys to navigate to next window
NavigateToNextWindow() {
    Send, {Right}{Enter}
}

; Define a function to activate Windows Task View (Win+Tab)
ActivateTaskView() {
    IF !WinActive("ahk_class Windows.UI.Core.CoreWindow")
        Send, #{Tab}
}

; Show the popup message
MsgBox, 4, Save Palestine and Muslims in India, Ascalamualikum Brother. You know that the terrorist Israel are killing our innocent babies, and they think killing babies is self-defense and the babies are animals. So we have to BOYCOTT their products and also Indian products. They support killing babies in Israel. They sent troops to kill babies in Israel, and they are killing Muslims in their Fu*king India and also in our border. They destroy their homes, mosques, shops, and property. They interfere in our internal affairs. India is harmful for our independence. So we have to throw them away from the earth.`nClick Yes to run.
IfMsgBox No
    ExitApp ; Exit the script if "No" is clicked

; Continuously check if the mouse is in the corners
Loop {
    MouseGetPos, mouseX, mouseY
    if (mouseX >= cornerX_Right && mouseY <= cornerY) {
        SwitchToNextWindow()
        taskViewActivated := false
        Sleep, 500 ; Reduce sleep time to 500 milliseconds
    } else if (mouseX <= cornerX_Left && mouseY <= cornerY) {
        SwitchToPreviousWindow()
        taskViewActivated := false
        Sleep, 500 ; Reduce sleep time to 500 milliseconds
    } else {
        if (mouseX >= (A_ScreenWidth - cornerBuffer) && mouseY >= (A_ScreenHeight - cornerBuffer)) {
            if (!taskViewActivated) {
                if (IsTaskViewOpen()) {
                    NavigateToNextWindow()
                } else {
                    ActivateTaskView()
                }
                taskViewActivated := true
            }
        } else {
            taskViewActivated := false
        }
    }
    Sleep, 50 ; Reduce main loop sleep time to improve responsiveness
}

MButton::
if (A_PriorHotkey = A_ThisHotkey && A_TimeSincePriorHotkey < 300) {
    ; Double-click detected
    Send, {Alt Down}{Esc}
    Sleep 100  ; Adjust the sleep time if needed
    Send, {Alt Up}
} else {
    ; Single-click detected
    Click Middle
}
Return

RButton::
if (A_PriorHotkey = A_ThisHotkey && A_TimeSincePriorHotkey < 300) {
    ; Double-click detected
    Run, osk.exe  ; Open modern On-Screen Keyboard
} else {
    ; Single-click detected
    Click Right  ; Perform the default action of the right mouse button
}
Return
