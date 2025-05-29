;																Old update : 14-May-25
;																New update : 15-May-25
#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir, %A_ScriptDir%  ; Ensures a consistent starting directory.

Start:
scrp_full_name  = %A_ScriptName%
scrp_name := substr(scrp_full_name,1,StrLen(scrp_full_name)-4)
ini_name  = %scrp_name%.ini
ini2_name = MT4 Open All.ini
log_name  = %scrp_name%.log

#Include %A_ScriptDir%\MT4 Library.ahk
FileReset(log_name)								; **New Year's Day reset log file

; run with a command-line argument
; argument = "-Check or "-Open"
arg = %1%
;;arg = -Open
if (arg="")
{
	MsgBox, Please run with a command-line argument. -Check or -Open
	goto, Exit
}

; check and close MT4,MT5 before event
if (arg = "-Check" or arg = "-check")
{
	; plan_today := "Close" or ""
	plan_today = Day%A_DD%
	IniRead, plan_today, %ini_name%, Date, %plan_today%

	if (plan_today = "Close" or plan_today = "close")
	{
		Run, MT4 Close All.exe									; close all MT4, MT5 terminal
		IniWrite, CLOSED, %ini2_name%, MT4 Status, Status		; write MT4 Open All status
		FileLogging(log_name)
	}
}

; open MT4,MT5 after event
if (arg = "-Open" or arg = "-open")
{
	IniRead, status, %ini2_name%, MT4 Status, Status
	if (status = "CLOSED")						; open only CLOSED status in MT4 Open All
	{
		Run, MT4 Open All.exe					; open all MT4, MT5 terminal
	}
}

Exit:
ExitApp