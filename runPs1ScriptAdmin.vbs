Set oShell = CreateObject("Shell.Application")  
oShell.ShellExecute "powershell", "-executionpolicy bypass -file C:\tools\setAudioDgAffinity.ps1", "", "runas", 1  