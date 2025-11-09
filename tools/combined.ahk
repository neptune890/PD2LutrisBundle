; Prompt for user name
InputBox, userName, Diablo II Setup, Please enter your name:
if ErrorLevel {
    MsgBox, User cancelled input.
    ExitApp
}

; Prompt for Diablo II CD key
InputBox, cdKey, Diablo II Setup, Please enter your D2 CD key:
if ErrorLevel {
    MsgBox, User cancelled input.
    ExitApp
}

; Prompt for Diablo II LOD CD key
InputBox, cdKeylod, Diablo II LOD Setup, Please enter your D2:LOD CD key:
if ErrorLevel {
    MsgBox, User cancelled input.
    ExitApp
}

; Save to INI file using expected keys
iniPath := "C:\tools\user_info.ini"
IniWrite, %userName%, %iniPath%, UserInfo, username
IniWrite, %cdKey%, %iniPath%, UserInfo, cdkey
IniWrite, %cdKeylod%, %iniPath%, UserInfo, cdkeylod

;MsgBox, User info saved successfully.

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
ControlSend,, d, Diablo II Installer
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

; Step 4: Wait for Installation Complete screen using ImageSearch
Loop, 90 {
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\tools\install_complete.bmp
    if (ErrorLevel = 0) {
        if WinExist("Diablo II Installer") {
			WinClose, Diablo II Installer
		}
        break
    }
    Sleep, 1000
}

; If image wasn't found after 90 seconds, close the installer window
if (ErrorLevel = 1) {
    if WinExist("Diablo II Installer") {
        WinClose, Diablo II Installer
    }
}

SetTitleMatchMode, 2

; Read user info
IniRead, userName, C:\tools\user_info.ini, UserInfo, username
IniRead, cdKey, C:\tools\user_info.ini, UserInfo, cdkey
IniRead, cdKeylod, C:\tools\user_info.ini, UserInfo, cdkeylod

if FileExist("C:\\tools\\Downloader_Diablo2_Lord_of_Destruction_enUS.exe") {
	RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\Blizzard Entertainment\Downloader\82C051339F174D5CF9C383BBF752B9B6B1DB2B54, Path, C:\tools
	Run, C:\tools\Downloader_Diablo2_Lord_of_Destruction_enUS.exe
	} else {
	MsgBox, Installation downloader missing.
}
; Step 1: Wait for and click "Install Diablo II - LOD"
Loop {
    IfWinExist, Diablo II - Lord of Destruction
    {
        WinActivate, Diablo II - Lord of Destruction
        Sleep, 500
        Break
    }
    Sleep, 1000
}

; Send "I" to activate "Install Diablo II - LOD" button
Send, i
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
ControlSetText, Edit2, %cdKeylod%, CD-Key:
; Temporary delay for visual confirmation
Sleep, 500  ; Wait 0.5 seconds before clicking OK
;ControlClick, Button1, CD-Key: ; OK button
Send, !o
Sleep, 500


; Step 4: Wait for Installation Complete screen using ImageSearch
Loop, 90 {
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\tools\install_complete.bmp
    if (ErrorLevel = 0) {
		if WinExist("Diablo II - Lord of Destruction") {
			WinClose, Diablo II - Lord of Destruction
		}
        break
    }
    Sleep, 1000
}

; If image wasn't found after 90 seconds, close the installer window
if (ErrorLevel = 1) {
    if WinExist("Diablo II - Lord of Destruction") {
        WinClose, Diablo II - Lord of Destruction
    }
}
