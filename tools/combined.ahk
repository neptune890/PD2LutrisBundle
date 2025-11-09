
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

; Download D2 Installer
SetTitleMatchMode, 2

;if FileExist("C:\\tools\\D2-1.14b-Installer-enUS") {
;    MsgBox, Installer already exists. Skipping download.
;    ExitApp
;}

if FileExist("C:\\tools\\Downloader_Diablo2_enUS.exe") {
	Run, C:\tools\Downloader_Diablo2_enUS.exe

	WinWait, File Download - Security Warning,, 10
	IfWinExist, File Download - Security Warning
	{
		WinActivate
		Sleep, 500
		ControlClick, Cancel
	}

	; Wait for the Browse for Folder dialog
	WinWait, Browse For Folder
	WinActivate
	Sleep, 500

	; Click inside the window to ensure focus
	Click, 100, 100  ; Adjust coordinates if needed to hit the scrollable area
	Sleep, 300

	; Reset to top of tree
	Send, {Home}
	Sleep, 300

	; Navigate to "This PC"
	Send, This
	Sleep, 300
	Send, {Right}
	Sleep, 300

	; Navigate to "Local Disk (C:)"
	Send, Local Disk
	Sleep, 300
	Send, {Right}
	Sleep, 300

	; Navigate to "tools"
	Send, tools
	Sleep, 300

	; Confirm selection
	Send, {Enter}

}

; Run D2 Installer
SetTitleMatchMode, 2

; Read user info
IniRead, userName, C:\tools\user_info.ini, UserInfo, username
IniRead, cdKey, C:\tools\user_info.ini, UserInfo, cdkey

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

; Download D2 LOD Installer
SetTitleMatchMode, 2

;if FileExist("C:\\tools\\D2-1.14b-Installer-enUS") {
;    MsgBox, Installer already exists. Skipping download.
;    ExitApp
;}

if FileExist("C:\\tools\\Downloader_Diablo2_Lord_of_Destruction_enUS.exe") {
	Run, C:\tools\Downloader_Diablo2_Lord_of_Destruction_enUS.exe

	WinWait, File Download - Security Warning,, 10
	IfWinExist, File Download - Security Warning
	{
		WinActivate
		Sleep, 500
		ControlClick, Cancel
	}

	; Wait for the Browse for Folder dialog
	WinWait, Browse For Folder
	WinActivate
	Sleep, 500
	
	; Click inside the window to ensure focus
	Click, 100, 100  ; Adjust coordinates if needed to hit the scrollable area
	Sleep, 300

	; Reset to top of tree
	Send, {Home}
	Sleep, 300

	; Navigate to "This PC"
	Send, This
	Sleep, 300
	Send, {Right}
	Sleep, 300

	; Navigate to "Local Disk (C:)"
	Send, Local Disk
	Sleep, 300
	Send, {Right}
	Sleep, 300

	; Navigate to "tools"
	Send, tools
	Sleep, 300

	; Confirm selection
	Send, {Enter}

}

; Run D2 LOD Installer
SetTitleMatchMode, 2

; Read user info
IniRead, userName, C:\tools\user_info.ini, UserInfo, username
IniRead, cdKey, C:\tools\user_info.ini, UserInfo, cdkey
IniRead, cdKeylod, C:\tools\user_info.ini, UserInfo, cdkeylod

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
Loop, 60 {
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\tools\install_complete.bmp
    if (ErrorLevel = 0) {
        ; Found the image
        ; MsgBox, Installation Complete screen detected.
        break
    }
    Sleep, 1000
}

WinActivate, Diablo II - Lord of Destruction
Sleep, 500

; Send "B" to go back
Send, b
Sleep, 1000

; Send "X" to exit installer
Send, x
Sleep, 1000
