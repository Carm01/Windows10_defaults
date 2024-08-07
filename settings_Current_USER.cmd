:: https://stealthpuppy.com/customize-the-windows-default-profile/#.XEfajs17mUm
:: remove the double colon to activate the code if it is commented out
:: disable Cortana
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /d 0 /t REG_DWORD /f
:: Disable Defender
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /d 1 /t REG_DWORD /f
:: Prevent "how do you want to open this file"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoNewAppAlert /d 1 /t REG_DWORD /f
:: Prevent EDGE ICON from appearing
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v DisableEdgeDesktopShortcutCreation /d 1 /t REG_DWORD /f
:: Defer updates current branch 365 days
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DeferFeatureUpdates /d 1 /t REG_DWORD /f
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v BranchReadinessLevel /d 32 /t REG_DWORD /f
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DeferFeatureUpdatesPeriodInDays /d 365 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v PauseFeatureUpdatesStartTime /d 0 /t REG_DWORD /f
:: Prevent IE first run Wizard
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /v DisableFirstRunCustomize /d 1 /t REG_DWORD /f
:: Do not launch the privacy setting experience upon first time user login 1809
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE" /v DisablePrivacyExperience /d 1 /t REG_DWORD /f
:: Set telemetry to basic
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /d 0 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /d 0 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /d 0 /t REG_DWORD /f
:: Disable text collection and handwriting data
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /d 1 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /d 1 /t REG_DWORD /f
:: Turn off location services
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /d 1 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /d 1 /t REG_DWORD /f
:: Enable RDP
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /d 0 /t REG_DWORD /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /d 0 /t REG_DWORD /f
::  sets kills background services in 4 seconds to be inline with the per users app settings
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
:: disable UAC setting on line 47 could break windows spotlight
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /d 0 /t REG_DWORD /f
::REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /d 0 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /d 0 /t REG_DWORD /f
:: turn off Advertising ID
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /d 1 /t REG_DWORD /f
:: Disable update and restart
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /d 1 /t REG_DWORD /f
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAUAsDefaultShutdownOption" /d 1 /t REG_DWORD /f
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAUShutdownOption" /d 1 /t REG_DWORD /f
:: Disable Windows Update Power Management to automatically wake up the system to install scheduled updates
:: https://www.windows-security.org/7a4c63be93b3df9fb0ed372d008cd4fd/enabling-windows-update-power-management-to-automatically-wake-up
:: REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUPowerManagement /d 0 /t REG_DWORD /f
::  Remove Lock in Account Picture Menu in Windows 10 but allows WINKEY + L
:: https://www.tenforums.com/tutorials/61721-add-remove-lock-account-picture-menu-windows-10-a.html
::REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v ShowLockOption  /d 0 /t REG_DWORD /f
:: Disable Hibernation 
::REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v HibernteEnabled  /d 0 /t REG_DWORD /f
:: hide hibernation from menu 
::REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v HibernteEnabled  /d 0 /t REG_DWORD /f
:: Disable Choose where to get apps in Windows 11 || Application Installation Control || App recommendation warnings. In other words, if you download an exe or msi you can install as you normally do without being nagged.
:: https://www.elevenforum.com/t/choose-where-to-get-apps-in-windows-11.7370/
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v AicEnabled /d "Anywhere" /t REG_SZ /f
:: Disable/Remove Copilot icon from Search on Windows 11. Microsoft is finding new was to infest windows with AI. ref: https://www.thewindowsclub.com/how-to-remove-copilot-icon-from-search-on-windows
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions  /d 1 /t REG_DWORD /f



:: HKCU setting applied to current user of machine
:: Current user setting applied

:: Hide Microsoft Office Upload icon systray display
REG ADD HKCU\Software\Microsoft\Office\16.0\Common\FileIO /v "DisableNotificationIcon" /d 1 /t REG_DWORD /f
:: Remove People icon from system tray
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People /v "PeopleBand" /d 0 /t REG_DWORD /f
:: Enable NumLOck
REG ADD "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /d 2 /t REG_SZ /f
:: Disallow WebSearch in search bar
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v "BingSearchEnabled" /d 0 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v "AllowSearchToUseLocation" /d 0 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v "CortanaConsent" /d 0 /t REG_DWORD /f
REG ADD HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer /v "DisableSearchBoxSuggestions" /d 1 /t REG_DWORD /f
:: remove ads in searchbar
REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds\DSB /v "ShowDynamicContent" /d 0 /t REG_DWORD /f

:: additional disable cortana
REG ADD HKCU\SOFTWARE\Microsoft\Personalization\Settings /v "AcceptedPrivacyPolicy" /d 0 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v "RestrictImplicitTextCollection" /d 1 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v "RestrictImplicitInkCollection" /d 1 /t REG_DWORD /f
REG ADD HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore /v "HarvestContacts" /d 0 /t REG_DWORD /f
:: Show hidden files
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /d 1 /t REG_DWORD /f
:: Show Show File extensions
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /d 0 /t REG_DWORD /f
:: Show Protected Operating System Files and folders
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /d 1 /t REG_DWORD /f
:: Show this PC on all users desktop
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 0 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 0 /t REG_DWORD /f
::  Set IE HomePage
REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /d "https://eu.startpage.com/do/mypage.pl?prfe=36c84513558a2d34bf0d89ea505333ad92934a7f254bccb70c1c89932309a9bc818f1bb4bea737976c85d1fa017f7a45" /t REG_SZ /f
:: Disable Sync Provider Notifications
REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "ShowSyncProviderNotifications" /d 0 /t REG_DWORD /f
:: Turn On or Off App Suggestions on Start in Windows 10
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SystemPaneSuggestionsEnabled" /d 0 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-338388Enabled" /d 0 /t REG_DWORD /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SilentInstalledAppsEnabled" /d 0 /t REG_DWORD /f
:: Turn off "Get tips, tricks and suggestions as you use Windows"
:: WARNING, THIS COULD BREAK WINDOWS 10 SPOTLIGHT. LEAVE SET TO 1 IF YOU WANT WINDOWS SPOTLIGHT TO WORK
::REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SoftLandingEnabled" /d 0 /t REG_DWORD /f
:: Prevent “welcome to the best windows ever”
REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-310093Enabled" /d 0 /t REG_DWORD /f
:: Disable “This App is Preventing Shutdown or Restart” Screen
REG ADD "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /d "4000" /t REG_SZ /f
REG ADD "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /d "5000" /t REG_SZ /f
REG ADD "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /d "1" /t REG_SZ /f
:: Turn Off pop-up blocker IE
REG ADD "HKCU\Software\Microsoft\Internet Explorer\New Windows" /v "PopupMgr" /d 0 /t REG_DWORD /f
:: Turn Off check boxes to select items
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AutoCheckSelect" /d "0" /t REG_SZ /f
:: Show More Details in File Transfer Dialog
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v "EnthusiastMode" /d 1 /t REG_DWORD /f
:: Do not let Windows manage your Printer
REG ADD "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows" /v "LegacyDefaultPrinterMode" /d 1 /t REG_DWORD /f
:: Set Control Panel view to Large icons (Classic)
::REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" /v "StartupPage" /d "1" /t REG_SZ /f
::REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" /v "AllItemsIconView" /d "0" /t REG_SZ /f
::Disable creation of Thumbs.db thumbnail cache files
:: IF these keys are left in the registry regardless of the values, windows display thunbnail view will not work
:: Thumbs cache is located here -> C:\Users\%username%\AppData\Local\Microsoft\Windows\Explorer
::REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbnailCache" /d "1" /t REG_SZ /f
::REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbsDBOnNetworkFolders" /d "1" /t REG_SZ /f
::REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnails" /d "1" /t REG_DWORD /f
:: disable 'Get even more out of Windows' reg value does not normally exist so deleting it is default
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /d 0 /t REG_DWORD /f
:: Stops the Windows Feedback Experience from sending anonymous data
REG ADD "HKCU\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /d 0 /t REG_DWORD /f
:: Disabled Windows Copilot 
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /d 1 /t REG_DWORD /f
:: disable search highlights
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDynamicSearchBoxEnabled" /d 0 /t REG_DWORD /f
:: disable Suggested actions
:: https://allthings.how/how-to-disable-suggested-actions-in-windows-11/
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\SmartActionPlatform\SmartClipboard" /v "Disabled" /d 1 /t REG_DWORD /f
:: Turn Off Typing Insights
:: https://www.tenforums.com/tutorials/113073-turn-off-typing-insights-windows-10-a.html
REG ADD "HKCU\Software\Microsoft\input\Settings\" /v "InsightsEnabled" /d 0 /t REG_DWORD /f

