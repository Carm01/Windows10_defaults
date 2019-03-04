:: https://stealthpuppy.com/customize-the-windows-default-profile/#.XEfajs17mUm
:: disable Cortana
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /d 0 /t REG_DWORD /f
:: Disable Defender
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /d 1 /t REG_DWORD /f
:: Prevent "how do you want to open this file"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoNewAppAlert /d 1 /t REG_DWORD /f
:: Prevent EDGE ICON from appearing
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v DisableEdgeDesktopShortcutCreation /d 1 /t REG_DWORD /f
:: Defer updates current branch 365 days
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DeferFeatureUpdates /d 1 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v BranchReadinessLevel /d 32 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DeferFeatureUpdatesPeriodInDays /d 365 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v PauseFeatureUpdatesStartTime /d 0 /t REG_DWORD /f
:: Prevent IE first run Wizard
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /v DisableFirstRunCustomize /d 1 /t REG_DWORD /f
:: Do not launch the privacy setting experience upon first time user login 1809
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE" /v DisablePrivacyExperience /d 1 /t REG_DWORD /f
:: Set telemetry to basic
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /d 1 /t REG_DWORD /f
:: Disable text collection and handwiting data
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /d 1 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /d 1 /t REG_DWORD /f
:: Turn off location services
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /d 1 /t REG_DWORD /f
:: Enable RDP
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /d 0 /t REG_DWORD /f
::  sets kills background services in 4 seconds to be inline with the per usera app settings
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /d 4000 /t REG_SZ /f
:: BCD EDIT 3 seconds
bcdedit /timeout 3
:: remove OneDrive icon from quick access file explorer
REG ADD "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /d 0 /t REG_DWORD /f
:: set high performance power mode
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{025A5937-A6BE-4686-A844-36FE4BEC8B6D}" /v PreferredPlan /d 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c /t REG_SZ /f
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
:: to determine powerplans use: powercfg -LIST

:: set time zone to eastern
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v TimeZoneKeyName /d "Eastern Standard Time" /t REG_SZ /f
:: diable UAC 
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /d 0 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /d 0 /t REG_DWORD /f
:: turn off Advertising ID
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /d 1 /t REG_DWORD /f





:: Per user settings 

:: Hide Microsoft Office Upload icon systray display
REG ADD HKCU\Software\Microsoft\Office\16.0\Common\FileIO /v "DisableNotificationIcon" /d 1 /t REG_DWORD /f
:: Remove People icon from system tray
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People /v "PeopleBand" /d 0 /t REG_DWORD /f
:: Disallow WebSearch in search bar
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v "BingSearchEnabled" /d 0 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v "AllowSearchToUseLocation" /d 0 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v "CortanaConsent" /d 0 /t REG_DWORD /f
:: Show File Extensions/hidden files
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "Hidden" /d 1 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "HideFileExt" /d 0 /t REG_DWORD /f
:: Show this PC on all users desktop
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 0 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 0 /t REG_DWORD /f
::  Set IE HomePage
REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /d "https://eu.startpage.com/en/?&prfe=36c84513558a2d34bf0d89ea505333ad92934a7f254bccb70c1c89932309a9bc818f1bb4bea737976c85d1fa017f7a45&op=un11&t=blak" /t REG_SZ /f
:: Disable Sync Provider Noticications
REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "ShowSyncProviderNotifications" /d 0 /t REG_DWORD /f
:: Turn On or Off App Suggestions on Start in Windows 10
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SystemPaneSuggestionsEnabled" /d 0 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-338388Enabled" /d 0 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SilentInstalledAppsEnabled" /d 0 /t REG_DWORD /f
:: Turn off "Get tips, tricks and suggestions as you use Windows"
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SoftLandingEnabled" /d 0 /t REG_DWORD /f
:: Prevent “welcome to the best windows ever”
REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-310093Enabled" /d 0 /t REG_DWORD /f
:: Disable “This App is Preventing Shutdown or Restart” Screen
REG ADD "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /d "4000" /t REG_SZ /f
REG ADD "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /d "5000" /t REG_SZ /f
REG ADD "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /d "1" /t REG_SZ /f
:: Turn Off pop-up blocker IE
REG ADD "HKCU\Software\Microsoft\Internet Explorer\New Windows" /v "PopupMgr" /d 0 /t REG_DWORD /f
