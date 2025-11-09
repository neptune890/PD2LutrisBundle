;Define path to AutoHotkey.exe (portable version)
ahkExe := "C:\tools\AutoHotkeyU32.exe"

; Run prompt_user_info.ahk
RunWait, %ahkExe% "C:\tools\getkeys.ahk"

; Run run_installer.ahk
RunWait, %ahkExe% "C:\tools\installd2.ahk"

; Run run_installer.ahk
RunWait, %ahkExe% "C:\tools\installd2lod.ahk"


