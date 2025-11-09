;Define path to AutoHotkey.exe (portable version)
ahkExe := "C:\tools\AutoHotkeyU32.exe"

; Run prompt_user_info.ahk
;RunWait, %ahkExe% "C:\tools\prompt_user_info.ahk"

; Run run_downloader.ahk
RunWait, %ahkExe% "C:\tools\run_downloader.ahk"

; Run run_installer.ahk
RunWait, %ahkExe% "C:\tools\run_installer.ahk"

; Run run_downloader.ahk
RunWait, %ahkExe% "C:\tools\run_downloaderlod.ahk"

; Run run_installer.ahk
RunWait, %ahkExe% "C:\tools\run_installerlod.ahk"

