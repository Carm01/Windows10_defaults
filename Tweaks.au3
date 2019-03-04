#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Google-Noto-Emoji-Travel-Places-42652-sun.ico
#AutoIt3Wrapper_Outfile_x64=Tweaks_gen.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Tweeks
#AutoIt3Wrapper_Res_Fileversion=1.0.0.1
#AutoIt3Wrapper_Res_ProductName=Tweeks
#AutoIt3Wrapper_Res_ProductVersion=1.0.0.1
#AutoIt3Wrapper_Res_LegalCopyright=Carm0
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Constants.au3>
Local $q = 0
If UBound(ProcessList(@ScriptName)) > 2 Then Exit

#Region disable Cortana
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\Windows Search', 'AllowCortana', 'REG_DWORD', '0') ; disables cortona search bar
#EndRegion disable Cortana

;RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\OneDrive','DisableFileSyncNGSC','REG_DWORD','1'); disables onedrive

#Region Disable Defender
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows Defender', 'DisableAntiSpyware', 'REG_DWORD', '1') ; disables Defender
#EndRegion Disable Defender

;#Region Turn off Microsoft Consumer Experience
;RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\CloudContent', 'DisableWindowsConsumerFeatures', 'REG_DWORD', '1') ; Turn off consumer experience
;disabling this and tips and tricks prevents spotlight from working
;#EndRegion Turn off Microsoft Consumer Experience

#Region Turn off Microsoft Consumer Experience undo
RegDelete('HKLM64\SOFTWARE\Policies\Microsoft\Windows\CloudContent', 'DisableWindowsConsumerFeatures')
#EndRegion Turn off Microsoft Consumer Experience undo

#Region Prevent "how do you want to open this file"
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\Explorer', 'NoNewAppAlert', 'REG_DWORD', '1') ; https://superuser.com/questions/993375/how-do-you-want-to-open-this-file
#EndRegion Prevent "how do you want to open this file"

#Region Prevent EDGE ICON from appearing
RegWrite('HKLM64\Software\Microsoft\Windows\CurrentVersion\Explorer', 'DisableEdgeDesktopShortcutCreation', 'REG_DWORD', '1') ; removed the edge icon from the desktop
#EndRegion Prevent EDGE ICON from appearing

#Region Defer updates current branch 365 days
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate', 'DeferFeatureUpdates', 'REG_DWORD', '1')
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate', 'BranchReadinessLevel', 'REG_DWORD', ' 32')
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate', 'DeferFeatureUpdatesPeriodInDays', 'REG_DWORD', ' 365')
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate', 'PauseFeatureUpdatesStartTime', 'REG_DWORD', ' ')
#EndRegion Defer updates current branch 365 days

; October 9 2018
#Region Prevent IE first run Wizard
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Internet Explorer\Main', 'DisableFirstRunCustomize', 'REG_DWORD', ' 1')
#EndRegion Prevent IE first run Wizard

#Region Do not launch the privacy setting experience upon first time user login ( Build 1809 only)
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\OOBE', 'DisablePrivacyExperience', 'REG_DWORD', ' 1')
#EndRegion Do not launch the privacy setting experience upon first time user login ( Build 1809 only)

; October 11-2018
#Region Set telemetry to basic
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\DataCollection', 'AllowTelemetry', 'REG_DWORD', ' 1')
#EndRegion Set telemetry to basic

;#Region Do not show windows tips and tricks
;RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\DataCollection', 'DisableSoftLanding', 'REG_DWORD', ' 0')
;disabling this and consumer experience prevents spotlight from working
;#EndRegion Do not show windows tips and tricks

#Region Do not show windows tips and tricks UNDO
RegDelete('HKLM64\SOFTWARE\Policies\Microsoft\Windows\DataCollection', 'DisableSoftLanding')
#EndRegion Do not show windows tips and tricks UNDO

#Region Disable text collection and handwiting data
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\InputPersonalization', 'RestrictImplicitTextCollection', 'REG_DWORD', ' 1')
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\InputPersonalization', 'RestrictImplicitInkCollection', 'REG_DWORD', ' 1')
#EndRegion Disable text collection and handwiting data

#Region Turn off location services
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors', 'DisableLocation', 'REG_DWORD', ' 1')
#EndRegion Turn off location services

; October 22-2018
; https://social.technet.microsoft.com/wiki/contents/articles/4980.how-to-enable-or-disable-remote-desktop-via-group-policy-windows-2008.aspx
#Region ENABLE RDP
RegWrite('HKLM64\SYSTEM\CurrentControlSet\Control\Terminal Server', 'fDenyTSConnections', 'REG_DWORD', '0') ; ENABLE RDP
#EndRegion ENABLE RDP

;October 29 2018 - https://serverfault.com/questions/581567/session-logout-force-termination-of-application-on-windows-terminal-server-2008
#Region Disable “This App is Preventing Shutdown or Restart” Screen
RegWrite('HKLM64\SYSTEM\CurrentControlSet\Control', 'WaitToKillServiceTimeout', 'REG_SZ', '4000')
#EndRegion Disable “This App is Preventing Shutdown or Restart” Screen

;November 19 2018
#Region set BCDtimeout
$x = 'bcdedit /timeout 3'
RunWait('"' & @ComSpec & '" /c ' & $x, @SystemDir, @SW_HIDE)
#EndRegion set BCDtimeout

;December 17-2018
#Region remove OneDrive icon from quick access file explorer
;RegWrite('HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}', 'System.IsPinnedToNameSpaceTree', 'REG_DWORD', '0')
#EndRegion remove OneDrive icon from quick access file explorer

;Feb-07-2019
#Region set high performance power mode
$x = 'powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c'; high performance
;$x = 'powercfg -setactive a1841308-3541-4fab-bc81-f71556f20b4a'; Power saver
;$x = 'powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e'; ballanced
;RunWait(@ComSpec & " /c " & $x); this or the one in line 112 can be used no difference in time or result
RunWait('"' & @ComSpec & '" /c ' & $x, @SystemDir, @SW_HIDE)
#EndRegion set high performance power mode

#Region Set Eastern TimeZone
RegWrite('HKLM64\SYSTEM\CurrentControlSet\Control\TimeZoneInformation', 'TimeZoneKeyName', 'REG_SZ', 'Eastern Standard Time')
#EndRegion Set Eastern TimeZone

#Region Disable UAC
RegWrite('HKLM64\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System', 'ConsentPromptBehaviorAdmin', 'REG_DWORD', '0')
RegWrite('HKLM64\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System', 'EnableLUA', 'REG_DWORD', '0')
#EndRegion Disable UAC

#Region turn off Advertising ID
RegWrite('HKLM64\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo', 'DisabledByGroupPolicy', 'REG_DWORD', '1')
#EndRegion turn off Advertising ID

hive()

Func hive() ; these changes are made to the default user hive
	$pHive = "HKEY_USERS\Temp\" ;Path\Name of Loaded Hive
	Run(@ComSpec & " /c reg.exe load HKU\Temp C:\Users\Default\NTUSER.dat", "", "", @SW_HIDE)
	Sleep(1000)
	$RegTest = RegRead("HKEY_USERS\Temp\Environment", "Temp")
	$q = $q + 1
	If $RegTest <> "" Then

		#Region Microsoft Office Upload icon systray display
		RegWrite($pHive & "Software\Microsoft\Office\16.0\Common\FileIO", "DisableNotificationIcon", "REG_DWORD", "1")
		;RegDelete($pHive & "Software\Microsoft\Office")
		#EndRegion Microsoft Office Upload icon systray display

		#Region Remove the people icon from the system tray
		RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People", "PeopleBand", "REG_DWORD", "0")
		;RegDelete($pHive & "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")
		#EndRegion Remove the people icon from the system tray

		#Region Disallow WebSearch in search bar
		RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\Search", "BingSearchEnabled", "REG_DWORD", "0")
		RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\Search", "AllowSearchToUseLocation", "REG_DWORD", "0")
		RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\Search", "CortanaConsent", "REG_DWORD", "0")
		#EndRegion Disallow WebSearch in search bar

		#Region File Extensions/hidden files
		RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden", "REG_DWORD", "1")
		RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt", "REG_DWORD", "0")
		#EndRegion File Extensions/hidden files

		#Region Show this PC on all users desktop
		RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel", "{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "REG_DWORD", "0")
		RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu", "{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "REG_DWORD", "0")
		#EndRegion Show this PC on all users desktop

		#Region Set IE HomePage
		RegWrite($pHive & "Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", "https://eu.startpage.com/do/mypage.pl?prfe=36c84513558a2d34bf0d89ea505333ad92934a7f254bccb70c1c89932309a9bc818f1bb4bea737976c85d1fa017f7a45")
		#EndRegion Set IE HomePage

		#Region Disable Sync Provider Noticications
		RegWrite($pHive & "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSyncProviderNotifications", "REG_DWORD", "0")
		#EndRegion Disable Sync Provider Noticications

		#Region Turn On or Off App Suggestions on Start in Windows 10
		RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "SystemPaneSuggestionsEnabled", "REG_DWORD", "0")
		RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "SubscribedContent-338388Enabled", "REG_DWORD", "0")
		RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "SilentInstalledAppsEnabled", "REG_DWORD", "0")
		#EndRegion Turn On or Off App Suggestions on Start in Windows 10

		#Region Turn off "Get tips, tricks and suggestions as you use Windows"
		RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "SoftLandingEnabled", "REG_DWORD", "0")
		#EndRegion Turn off "Get tips, tricks and suggestions as you use Windows"

		#Region Turn off Game Bar Tips
		;RegWrite($pHive & "Software\Microsoft\GameBar", "ShowStartupPanel", "REG_DWORD", "0")
		#EndRegion Turn off Game Bar Tips

		; October 9 2018
		#Region Prevent “welcome to the best windows ever”
		RegWrite($pHive & "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "SubscribedContent-310093Enabled", "REG_DWORD", "0")
		#EndRegion Prevent “welcome to the best windows ever”

		; October 29 2018
		#Region Disable “This App is Preventing Shutdown or Restart” Screen - https://serverfault.com/questions/581567/session-logout-force-termination-of-application-on-windows-terminal-server-2008
		RegWrite($pHive & "Control Panel\Desktop", "WaitToKillAppTimeout", "REG_SZ", "7000")
		RegWrite($pHive & "Control Panel\Desktop", "HungAppTimeout", "REG_SZ", "7000")
		#EndRegion Disable “This App is Preventing Shutdown or Restart” Screen - https://serverfault.com/questions/581567/session-logout-force-termination-of-application-on-windows-terminal-server-2008

		;December 20 2018
		#Region Turn Off pop-up blocker IE
		RegWrite($pHive & "Software\Microsoft\Internet Explorer\New Windows", "PopupMgr", "REG_DWORD", "0")
		#EndRegion Turn Off pop-up blocker IE

		#cs
			#Region Prevent users from locking or restarting PC
			;https://www.thewindowsclub.com/prevent-users-shutting-down-restarting-windows-computer  -- Computer Configuration > Administrative Templates > Start Menu and Taskbar
			RegWrite($pHive & "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoClose", "REG_DWORD", "1")
			#EndRegion Prevent users from locking or restarting PC

			#Region Prevent Users from Locking workstation
			; https://serverfault.com/questions/903842/disable-prevent-locking-computers-with-gpo -- User Configuration\Administrative Templates\System\Ctrl+Alt+Del Options\Remove Lock Computer
			RegWrite($pHive & "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation", "REG_DWORD", "1")
			#EndRegion Prevent Users from Locking workstation
		#ce

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
EndFunc   ;==>hive
