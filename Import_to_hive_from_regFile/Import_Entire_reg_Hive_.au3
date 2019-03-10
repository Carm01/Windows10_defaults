#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Google-Noto-Emoji-Travel-Places-42652-sun.ico
#AutoIt3Wrapper_Outfile_x64=Tweaks_gen.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Tweeks
#AutoIt3Wrapper_Res_Fileversion=2.0.0.0
#AutoIt3Wrapper_Res_ProductName=Tweeks 2.0
#AutoIt3Wrapper_Res_ProductVersion=2.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=https://github.com/Carm01
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Constants.au3>
Local $q = 0
If UBound(ProcessList(@ScriptName)) > 2 Then Exit ; allows on one instance to run

; per user nuisances and conveniences
$pHive = "HKEY_USERS\Temp\"     ;Path\Name of Loaded Hive
Run(@ComSpec & " /c reg.exe load HKU\Temp C:\Users\Default\NTUSER.dat", "", "", @SW_HIDE)
Sleep(1000)
$RegTest = RegRead("HKEY_USERS\Temp\Environment", "Temp")
$q = $q + 1
If $RegTest <> "" Then

	#Region Do not display start screen for any application
	$s = 'regedit /s office.reg'
	RunWait('"' & @ComSpec & '" /c ' & $s, @SystemDir, @SW_HIDE)
	#EndRegion Do not display start screen for any application

	Do
		Sleep(800)
		Run(@ComSpec & " /c reg.exe unload HKU\Temp", "", "", @SW_HIDE)
		RegRead("HKEY_USERS\Temp\Environment", "Temp")
	Until @error <> ""

	;MsgBox(0, "Black Magic Installer", "Casewatch Settings Installed for Default User Profile")
Else
	MsgBox(0, "Black Magic Installer", "Could not load the Default User Hive", 60)
	Exit ('667')
EndIf





