#Include, functions.ahk
; Basic Configuration ----------------------------------------------------------
SetWorkingDir, %A_ScriptDir%
#SingleInstance force
#NoEnv
SendMode Input
#InstallKeybdHook
#InstallMouseHook
#useHook On
#MaxHotkeysPerInterval 2000
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm ;this may prevent taskbar flashing.
#HotkeyModifierTimeout 60 ; https://autohotkey.com/docs/commands/_HotkeyModifierTimeout.htm
#MaxThreadsPerHotkey 1
#KeyHistory 500 ; https://autohotkey.com/docs/commands/_KeyHistory.htm ; useful for debugging.
detecthiddenwindows, on
SetTitleMatchMode, RegEx
SendMode Input
; Who actually uses numpad as non numpad keys?
; if you use, feel judged.
; SetNumLockState, AlwaysOn

; ------------------------------------------------------------------------------

#Include, numpad.ahk
#Include, numpad2ndKeyboard.ahk

; remap rshift for something useful, my notebook does not have a /? key on the right1
RShift::/
LShift & RShift::Send ?

#IfWinNotActive, "X2GO"
    <#q::
        Send !{F4}
        mods_up()
    Return
#IfWinNotActive

F2::open_explorer()
!F2::open_explorer("D:\Bibliotecas\Downloads")

; archive first message on whatsapp web
!W::
    MouseMove, 550, 250, 0
    Send {RButton}
    sleep 5
    MouseMove, 578, 297, 0
    Send {Click}
Return

<#Tab::
F1::
    SetTitleMatchMode, RegEx

    if (WinActive("Firefox$")) {
        if WinActive("WhatsApp")
            Send ^{Tab}
        else
            Send ^1
        
        mods_up()
        Return
    }
    run_or_switch_to_app("Firefox$", "firefox.exe", "RegEx")
    move_mouse_to_window()
Return

F3::vscode()
F4::vnc()

; alt Fkeys send fkeys lol
^F1::Send, {F1}
^F2::Send, {F2}
^F3::Send, {F3}
^F4::Send, {F4}

#'::move_window_to_side("Left")
!'::move_window_to_side("Right")

F12::
    ToolTip, "Reloading"
    mods_up()
    SetScrollLockState, On
    SetNumLockState, On
    Sleep, 200
    Reload
return

;; how to use morse
!F11::
    p := Morse()
    If (p = "0")
        MsgBox Short press
    Else If (p = "00")
        MsgBox Two short presses
    Else If (p = "01")
        MsgBox Short+Long press
    Else
        MsgBox Press pattern %p%
return

+WheelDown::
    SendInput, ^{PgUp}
    mods_up()
Return
+WheelUp::
    SendInput, ^{PgDn}
    mods_up()
Return