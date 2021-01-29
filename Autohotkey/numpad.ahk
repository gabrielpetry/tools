NumLock::
    SetTimer, RemoveToolTip, -700
    if GetKeyState("ScrollLock", "T")
        ToolTip, "Disabled"
    else
        ToolTip, "Enabled"
    lastStatus := !GetKeyState("ScrollLock", "T")
    SetScrollLockState, %lastStatus%
return

lastWindowId := 0

#if !GetKeyState("ScrollLock", "T")
{
    NumpadIns::0
    NumpadDown::2
    NumpadPgdn::3
    Numpadleft::4
    Numpad5::5
    NumpadRight::6
    NumpadHome::7
    NumpadUp::8
    NumpadPgup::9
}

#if GetKeyState("ScrollLock", "T") and !getKeyState("F23", "P")
{
    Numpad0::spotify()
    Numpad1::Send {Media_Play_Pause}
    Numpad2::Send {Media_Prev}
    Numpad3::Send {Media_Next}
    Numpad4::discord()
    Numpad5::
        if(!WinExist("VcXsrv"))
            return
        vnc()
    Return
    Numpad6::Send {F13}
    Numpad7::Send {F14}
    Numpad8::Send {F15}
    Numpad9::Send {F16}
    NumpadAdd::
        SendMode, Input
        SetTitleMatchMode, 2
        
        if (WinActive("VcXsrv")) {
            send #{Tab}
            return
        }

        if (!WinExist("Firefox"))
            Run, firefox.exe
        if (WinActive(Firefox))
            if (WinExist("lastWindowId"))
                WinActivate, ahk_id %lastWindowId%
            else
                Send !{Tab}
        else {
            lastWindowId := WinExist("A")
            WinActivate Firefox
        }

        move_mouse_to_window()
    Return

    +NumpadAdd::
        if (WinExist("VcXsrv"))
            vnc()
        else
            vscode()
    Return
    !NumpadAdd::spotify()
    ^NumpadAdd::firefox()

    NumpadDiv::voicemeeter()

    NumpadMult::notiontask()

    NumpadSub::obs()
}