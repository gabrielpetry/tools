
set s = createobject("WScript.Shell")
s.run "TASKKILL /f /im voicemeeterpro.exe", , True
s.run "TASKKILL /f /im VoicemeeterMacroButtons.exe", , True
WScript.Sleep 2000


s.run """C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe""", 2
s.run """C:\Program Files (x86)\VB\Voicemeeter\VoicemeeterMacroButtons.exe""", 0