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
