; logging and delete file library
;
FormatTime, TimeString,,  dd/MMM/yy HH:mm
FormatTime, TimeString2,, dd/MM/yy
DateStr  := SubStr(TimeString2, 1, 2)
FoundPos := InStr(TimeString2, "/")
MonthStr := SubStr(TimeString2, FoundPos+1, 2)

; new year reset file
FileReset(fileIN){
   global DateStr
   global MonthStr

   if(DateStr = "01" and MonthStr = "01")                   ; check date 01 and month 01
      FileDelete, %fileIN%
}

; event file logging
FileLogging(fileIN){
   global MonthStr
   global TimeString

   if (OddOrEven(MonthStr) = "Even")					    ; indent tab on even month
   {
      space5x := ">    "
      newline = %space5x% %A_ScriptName% %TimeString%
      FilePrepend(fileIN, newline)
   }
   else
   {
      newline = %A_ScriptName% %TimeString%
      FilePrepend(fileIN, newline)
   }
}

; indent tab for easy read
OddOrEven(num)
{
    return ((Num & 1) != 0) ? "Odd" : "Even"
}

; last date write first
FilePrepend(fileIN, string) {
   input := FileOpen(fileIN, 0)
   text := input.Read()
   input.Close()
   output := FileOpen(fileIN, 5)
   output.WriteLine(string)
   output.Write(text)
   output.Close()
}