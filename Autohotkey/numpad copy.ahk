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

#if GetKeyState("ScrollLock", "T") and !getKeyState("F23", "P")
{
    NumpadIns::spotify()
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
        sleep 2
        move_mouse_to_window()
    Return

    +NumpadAdd::vnc()
    !NumpadAdd::spotify()
    ^NumpadAdd::firefox()

    NumpadDiv::
        path = "C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe"
        if (WinActive("VoiceMeeter"))
            Send, !{F4}
        else
            Run, %path%
    Return

    NumpadMult::
        InputBox, What, "O que foi feito?"
        Run, "C:\Users\gabri\AppData\Local\Programs\Python\Python39\pythonw.exe" "C:\tools\Autohotkey\scripts\notion.py" "%What%"
    Return

    NumpadSub::obs()
}