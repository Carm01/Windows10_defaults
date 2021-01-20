#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Google-Noto-Emoji-Food-Drink-32364-hot-pepper.ico
#AutoIt3Wrapper_Outfile_x64=ModUsersHive.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=PowerpointFix
#AutoIt3Wrapper_Res_Fileversion=1.1.0.0
#AutoIt3Wrapper_Res_ProductName=PowerpointFix
#AutoIt3Wrapper_Res_ProductVersion=1.1.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Carm0
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#NoTrayIcon
#include <File.au3>
Local $sFILE = 'c:\' & @ComputerName & '.txt'
Local $sUSER, $a
If UBound(ProcessList(@ScriptName)) > 2 Then Exit ; only one instance running
$a = _FileListToArrayRec('c:\users', "*", $FLTAR_FOLDERS, $FLTAR_NORECUR, $FLTAR_SORT, $FLTAR_NOPATH)
For $i = 1 To UBound($a) - 1
	If $a[$i] = 'Public' Or $a[$i] = 'All Users' Or $a[$i] = 'Default User' Or $a[$i] = 'altirisad' Then ; profiles to ignore
		;
	Else
		hive($a[$i])
	EndIf
Next

If @ScriptDir = 'c:\windows\temp' Then ; if the exe is placed in this directory then the script sill self destruct upon completion(be careful)
	OnAutoItExit()
EndIf
Exit

Func hive($sUSER) ; these changes are made to the default user hive
	$pHive = "HKEY_USERS\Temp\"     ;Path\Name of Loaded Hive
	$cmd = " /c reg.exe load HKU\Temp C:\users\" & $sUSER & "\NTUSER.dat"
	Run(@ComSpec & $cmd, "", "", @SW_HIDE)
	Sleep(1000)
	$RegTest = RegRead("HKEY_USERS\Temp\Environment", "Temp")
	If $RegTest <> "" Then

		#Region Microsoft Office Powerpoint "disable extend these displays"
		RegWrite($pHive & "Software\Microsoft\Office\16.0\PowerPoint\Options", "DisableSetTopology", "REG_DWORD", "1")
		;RegDelete($pHive & "Software\Microsoft\Office\16.0\PowerPoint\Options", "DisableSetTopology")
		#EndRegion Microsoft Office Powerpoint "disable extend these displays"
		Sleep(50)
		;$c = RegRead($pHive & "Software\Microsoft\Office\16.0\PowerPoint\Options", "DisableSetTopology"); If you want to read a specific value
		;MsgBox(0, $sUSER, $c)

		Do
			Sleep(800)
			Run(@ComSpec & " /c reg.exe unload HKU\Temp", "", "", @SW_HIDE)
			RegRead("HKEY_USERS\Temp\Environment", "Temp")
		Until @error <> ""

	Else
		FileWrite($sFILE, @ComputerName & ' ' & $sUSER & ' hive unable load hive; in use.' & @CRLF) ; if the HIVE is in use somehow then this will be written as an error message
	EndIf
EndFunc   ;==>hive

; part of the auto self destruct function
Func OnAutoItExit()
	Local $iDelay = 2
	Run(@ComSpec & ' /c ping -n ' & $iDelay & ' localhost > nul & del /f /q "' & @ScriptFullPath & '"', '', @SW_HIDE)
EndFunc   ;==>OnAutoItExit

; https://www.autoitscript.com/forum/topic/167388-yet-another-_regwriteallusers/?tab=comments#comment-1224842
