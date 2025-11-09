SetTitleMatchMode, 2

; Read user info
IniRead, userName, C:\tools\user_info.ini, UserInfo, username
IniRead, cdKey, C:\tools\user_info.ini, UserInfo, cdkey

if FileExist("C:\\tools\\Downloader_Diablo2_enUS.exe") {
	RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\Blizzard Entertainment\Downloader\84CE44E25D34D9A292D7AAD5D31E54E866C10C9C, Path, C:\tools
	Run, C:\tools\Downloader_Diablo2_enUS.exe
} else {
	MsgBox, Installation downloader missing.
}
; Step 1: Wait for and click "Install Diablo II"
Loop {
    IfWinExist, Diablo II Installer
    {
        WinActivate, Diablo II Installer
        Sleep, 500
        Break
    }
    Sleep, 1000
}

; Send "D" to activate "Install Diablo II" button
Send, d
Sleep, 1000

WinWait, End User License Agreement
WinActivate
Sleep, 500

; Click inside the window to ensure focus
Click, 200, 200  ; Adjust coordinates if needed to hit the scrollable area
Sleep, 300

; Scroll through the EULA
Loop, 20 {
    Send, {PgDn}
}

; Click Agree
ControlClick, Button2, End User License Agreement
Sleep, 500

; Step 3: Enter Name and CD Key
WinWait, CD-Key:
WinActivate
Sleep, 500
ControlSetText, Edit1, %userName%, CD-Key:
ControlSetText, Edit2, %cdKey%, CD-Key:
; Temporary delay for visual confirmation
Sleep, 500  ; Wait 0.5 seconds before clicking OK
;ControlClick, Button1, CD-Key: ; OK button
Send, !o
Sleep, 500

; Step 4: Confirm Installation Directory
WinWait, Installation Destination Directory
WinActivate
Sleep, 500

; Send Enter to confirm
Send, {Enter}
Sleep, 500

; Step 5: Wait for Installation Complete screen using ImageSearch
Loop, 60 {
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\tools\install_complete.bmp
    if (ErrorLevel = 0) {
        ; Found the image
        ; MsgBox, Installation Complete screen detected.
        break
    }
    Sleep, 1000
}

; Send "B" to go back
Send, b
Sleep, 1000

; Send "X" to exit installer
Send, x
Sleep, 1000
