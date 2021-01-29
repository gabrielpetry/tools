Set objShell = WScript.CreateObject("WScript.Shell")
objShell.Run "taskkill /im intercept.exe", , True
WScript.Sleep 1000
objShell.Run("C:\tools\intercept\intercept.exe /apply"), 0, True