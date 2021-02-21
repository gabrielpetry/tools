; second keyboard uses f23 as modkey, alway send F23+numkey
; if F23 is down, so we can undestand that a key from there is being pressed
#if (getKeyState("F23", "P"))
{ ;This is the line that makes all the lines below possible.
    F23::return ;F23 is the dedicated 2nd keyboard "modifier key." You MUST allow it to "return,"
    Numpad0::sendKeySlow("F17", "Ctrl")
    ; Numpad1::sendKeySlow("F18", "Ctrl")
    Numpad2::sendKeySlow("F19", "Ctrl")
    Numpad3::sendKeySlow("F20", "Ctrl")
    Numpad4::sendKeySlow("F21", "Ctrl")
    Numpad5::sendKeySlow("F22", "Ctrl")
    Numpad6::sendKeySlow("F23", "Ctrl")
    Numpad7::sendKeySlow("F24", "Ctrl")
    Numpad8::sendKeySlow("F17", "Alt")
    Numpad9::sendKeySlow("F18", "Alt")

    NumpadDiv::sendKeySlow("F19", "Alt")
    NumpadMult::sendKeySlow("F20", "Alt")
    backspace::sendKeySlow("F21", "Alt")
    NumpadSub::sendKeySlow("F22", "Alt")
    NumpadAdd::sendKeySlow("F23", "Alt")
    NumpadEnter::sendKeySlow("F24", "Alt")
    ; Del::sendKeySlow("F17", "Shift")
    Del::vsthost()
    ,::sendKeySlow("F18", "Shift")
}