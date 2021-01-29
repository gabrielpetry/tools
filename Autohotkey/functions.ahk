log(text) {
    OutputDebug, %A_Now%: %text%
}

mods_up() {
    keys := ["AltUp", "RShiftUp", "LShiftUp", "CtrlUp", "F23Up", "RWinUp", "LWinUp"]
    for k, v in keys {
        sleep 100
        Send, {%v%}
    }
    sleep 10

}

run_or_switch_to_app(winTitle, exe, titleMode = 2, runPath = "") {
    SetTitleMatchMode, %titleMode%

    if (!WinExist(winTitle)) {
        Run, %exe%, %runPath%
        WinWait, %winTitle%
        WinActivate %winTitle%
        Return
    }

    if (WinActive(winTitle)) 
        WinMinimize, %winTitle%
    else
        WinActivate %winTitle%

    mods_up()
}

; return 0 for short, 1 for long, so
; 0001; 3 short 1 long press
Morse(timeout = 100) { ;
    tout := timeout/1000
    key := RegExReplace(A_ThisHotKey,"[\*\~\$\#\+\!\^]")
    Loop {
        t := A_TickCount
        KeyWait %key%
        Pattern .= A_TickCount-t > timeout
        KeyWait %key%,DT%tout%
        If (ErrorLevel)
            Return Pattern
    }
}

isWindowFullScreen() ;; https://autohotkey.com/board/topic/38882-detect-fullscreen-application/
{
    wingetpos,,,w,h,A
    wwwh=%w%%h%
    swsh=%a_screenwidth%%a_screenheight%
    WinGet, Style, Style, A
    FullScreenActive := false
    if !(Style & 0xC00000) {
        if(wwwh = swsh) {
            FullScreenActive := true
        }
    }

    return FullScreenActive
}

RemoveToolTip:
    ToolTip
return

move_mouse_to_window() {
    sleep 2
    CoordMode, Mouse, Relative
    WinGetActiveStats, AWTitle, AWWidth, AWHeight, AWX, AWY
    MPosX := (AWWidth//2)
    MPosY := (AWHeight//2)
    MouseMove, %MPosX%, %MPosY%
}

open_explorer(path = "") {
    if (!WinExist("ahk_class CabinetWClass")) {
        Run, explorer.exe %path%
    }
    GroupAdd, explorers, ahk_class CabinetWClass
    
    if WinActive("ahk_exe explorer.exe")
        GroupActivate, explorers, r
    else
        WinActivate, ahk_class CabinetWClass

    move_mouse_to_window()
}

move_window_to_side(side = "Left") {
    WinGet, winid
    send #+{Up}
    sleep 2
    Send #+{%side%}
    sleep 2
    WinActivate ahk_pid %winid%

    move_mouse_to_window()
}

spotify() {
    a := WinExist("ahk_exe Spotify.exe")

    if (!a)
        Run, "C:\Users\gabri\AppData\Roaming\Spotify\Spotify.exe"
    if (WinActive("ahk_exe Spotify.exe"))
        Send !{Tab}
    WinActivate ahk_id %a%

    mods_up()
}

discord() {
    run_or_switch_to_app("Discord$", "C:\Users\gabri\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord", "RegEx")
    move_mouse_to_window()
}

vnc() {
    run_or_switch_to_app("VcXsrv", "C:\Program Files (x86)\x2goclient\x2goclient.exe", "RegEx")
    move_mouse_to_window()
}

firefox() {
    run_or_switch_to_app("Firefox$", "firefox.exe", "RegEx")
    move_mouse_to_window()
}

obs() {
    run_or_switch_to_app("OBS", "C:\Program Files\obs-studio\bin\64bit\obs64.exe", 2, "C:\Program Files\obs-studio\bin\64bit")
    move_mouse_to_window()
}

vscode() {
    run_or_switch_to_app("Visual Studio Code", "C:\Program Files\Microsoft VS Code\Code.exe")
    move_mouse_to_window()
}

vsthost() {
    Run, C:\tools\vsthostx64\startvsthost.vbs, C:\tools\vsthostx64
    mods_up()
}

voicemeeter() {
    path = "C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe"
    if (WinActive("VoiceMeeter"))
        WinKill, VoiceMeeter
    else
        Run, %path%

    move_mouse_to_window()
}

notiontask() {
    InputBox, What, "O que foi feito?"
        Run, "C:\Users\gabri\AppData\Local\Programs\Python\Python39\pythonw.exe" "C:\tools\Autohotkey\scripts\notion.py" "%What%"
    Return
}