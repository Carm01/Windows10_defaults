#NoTrayIcon
#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Alex-T-Fresh-Fruit-Pomegranate.ico
#AutoIt3Wrapper_Outfile_x64=AppXpro.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Removes some of windows 10 Provisioned Apps ( per user )
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_ProductVersion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Carm0
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Constants.au3>
If UBound(ProcessList(@ScriptName)) > 2 Then Exit ; added to make only one instance runnable
;powershell -Command "& {set-location 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings'; set-location ZoneMap\Domains; new-item SERVERNAME; set-location SERVERNAME; new-itemproperty . -Name http -Value 2 -Type DWORD;}"
;https://stackoverflow.com/questions/6037146/how-to-execute-powershell-commands-from-a-batch-file
;https://www.digitalcitizen.life/how-reinstall-all-windows-10-default-apps-powershell
;https://superuser.com/questions/958562/how-do-i-remove-candy-crush-saga-from-windows-10
; https://blog.danic.net/provisioned-apps-in-windows-10-pro/
Sleep(60000)
 $u = 'powershell -Command ' & '"' & 'Get-AppxPackage *candycrush* -allusers | Remove-AppxPackage' & '"'
 _GetDOSOutput($u)
 $u = 'powershell -Command ' & '"' & 'Get-AppxPackage *xbox* -allusers | Remove-AppxPackage' & '"'
 _GetDOSOutput($u)
 $u = 'powershell -Command ' & '"' & 'Get-AppxPackage *HiddenCity* -allusers | Remove-AppxPackage' & '"'
 _GetDOSOutput($u)
 $u = 'powershell -Command ' & '"' & 'Get-AppxPackage *Feedbackhub* -allusers | Remove-AppxPackage' & '"'
 _GetDOSOutput($u)
 $u = 'powershell -Command ' & '"' & 'Get-AppxPackage *officehub* -allusers | Remove-AppxPackage' & '"'
 _GetDOSOutput($u)
  $u = 'powershell -Command ' & '"' & 'Get-AppxPackage *BingNews* -allusers | Remove-AppxPackage' & '"'
 _GetDOSOutput($u)
  $u = 'powershell -Command ' & '"' & 'Get-AppxPackage *GameBar* -allusers | Remove-AppxPackage' & '"'
 _GetDOSOutput($u)
  $u = 'powershell -Command ' & '"' & 'Get-AppxPackage *SolitaireCollection* -allusers | Remove-AppxPackage' & '"'
 _GetDOSOutput($u)

 Func _GetDOSOutput($sCommand)
 Local $iPID, $sOutput = ""
 $iPID = Run('"' & @ComSpec & '" /c ' & $sCommand, "", @SW_hide, $STDERR_CHILD + $STDOUT_CHILD)
 While 1
  $sOutput &= StdoutRead($iPID, False, False)
  If @error Then
   ExitLoop
  EndIf
  Sleep(10)
 WEnd
 Return $sOutput
EndFunc   ;==>_GetDOSOutput
