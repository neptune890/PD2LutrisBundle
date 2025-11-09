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