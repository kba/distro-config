; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

~LWin Up:: return

; disable ctrl-shift-tab
; ^+Tab::return
; disable ctrl-escape
^Escape::return	

; disable win+l
; #l::return
#Tab::return
#+Tab::return
^#!n::
IfWinExist Untitled - Notepad
	WinActivate
else
	Run Notepad
return


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.

#IfWinNotActive ahk_class ConsoleWindowClass

bAllowOverride := False

~LButton::
	GetKeyState, keystate, RButton
	If (keystate = "D")
	{
		SendInput {RButton Up}
		SendInput {Escape}
		SendInput ^v
		bAllowOverride := True
	}
	Return

RButton::
	GetKeyState, keystate, LButton
	If (keystate = "D")
	{
		SendInput {LButton Up}
		SendInput ^c
		bAllowOverride := True
		Return
	}
	SendInput {RButton Down}
	Return

RButton Up::
	GetKeyState, keystate, LButton
	If (keystate = "D")
	{
		Return
	}
	If (bAllowOverride)
	{
		bAllowOverride := False
		Return
	}
	SendInput {RButton Up}
	Return