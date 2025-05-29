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
ini2_name = MT4 Open All.ini

; terminal.exe for MT4, terminal64.exe for MT5
proc1 = terminal.exe
proc2 = terminal64.exe

; loop close processes
while(ProcessExist(proc1))
{
	Process, Close, %proc1%
	Sleep, 1000
}

; loop close processes
while(ProcessExist(proc2))
{
	Process, Close, %proc2%
	Sleep, 1000
}

IniWrite, CLOSED, %ini2_name%, MT4 Status, Status		; write MT4 Open All status
IniRead, pushb, %ini_name%, Pushbullet, Enable
if (pushb = "Yes" or pushb = "yes")
	Run, pushbullet-mt4-closed.exe						; PushBullet notify

;------------------------------------------------------------------------------------	Function
; check process exist
ProcessExist(Name)
{
	Process, Exist, %Name%
	return Errorlevel
}
