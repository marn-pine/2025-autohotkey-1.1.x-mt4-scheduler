;																Old update : 14-May-25
;																New update : 15-May-25
#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Start:
scrp_full_name  = %A_ScriptName%
scrp_name := substr(scrp_full_name,1,StrLen(scrp_full_name)-4)
ini_name  = %scrp_name%.ini

DriveGet, status, Status, D:\
if (status != "Ready")
{
	MsgBox, Drive D: is not ready!
	ExitApp
}

; mode = "/portable" or ""
IniRead, mode, %ini_name%, Open Mode, Mode
Open_Terminal("Term01", mode)
Open_Terminal("Term02", mode)
Open_Terminal("Term03", mode)
Open_Terminal("Term04", mode)
Open_Terminal("Term05", mode)
Open_Terminal("Term06", mode)

Open_Terminal("Term07", mode)
Open_Terminal("Term08", mode)
Open_Terminal("Term09", mode)
Open_Terminal("Term10", mode)
Open_Terminal("Term11", mode)
Open_Terminal("Term12", mode)

IniWrite, OPENED, %ini_name%, MT4 Status, Status	; write MT4 Open All status
IniRead, pushb, %ini_name%, Pushbullet, Enable
if (pushb = "Yes" or pushb = "yes")
	Run, pushbullet-mt4-opened.exe					; PushBullet notify

Exit:
ExitApp

;------------------------------------------------------------------------------------	Function
Open_Terminal(term, mode)
{
	global ini_name

	IniRead, term, %ini_name%, Open Terminals, %term%
	if (term <> "")
	{
		; run in miximize window
		Run, %term% %mode%,, Max
		; delay for next terminal
		Sleep,(5*1000)
	}
	return
}
