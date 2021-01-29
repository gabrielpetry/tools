set s = createobject("WScript.Shell")
s.run "taskkill /im Light Host.exe", , True
WScript.Sleep 1000
s.run "C:\tools\Light Host\Light Host.exe", 2