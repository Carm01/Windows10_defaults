:: turn off Activity history log off required( top most check box
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /d 0 /t REG_DWORD /f
:: Disable Activity Feed
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed /d 0 /t REG_DWORD /f
:: Disable Upload user activities
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities /d 0 /t REG_DWORD /f
:::: Next statements will deny access to the following apps under Privacy - - Setting anyone of these back to allow allows toggle functionality
:: App access turn off camera
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v Value /d Deny /t REG_SZ /f
:: Disable app diag info about your other apps
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v Value /d Deny /t REG_SZ /f
:: do not allow apps to access your file system
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v Value /d Deny /t REG_SZ /f
:: do not allow apps to access your contacts
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v Value /d Deny /t REG_SZ /f
:: Do not allow apps to access microphone
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v Value /d Deny /t REG_SZ /f
:: Do not allow apps to access Notifications
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v Value /d Deny /t REG_SZ /f
:: Do not allow apps to access Account Information
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v Value /d Deny /t REG_SZ /f
:: Do not allow apps to access calendar
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v Value /d Deny /t REG_SZ /f
:: Do not allow apps to access call history
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v Value /d Deny /t REG_SZ /f
:: Do not Allow apps to access email 
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v Value /d Deny /t REG_SZ /f
:: Do not allow apps to access tasks
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v Value /d Deny /t REG_SZ /f
:: Do not allow apps to access messaging
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v Value /d Deny /t REG_SZ /f
:: Do Not allow apps to access radio
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v Value /d Deny /t REG_SZ /f
:: do not allow apps to access other devices
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v Value /d Deny /t REG_SZ /f
:: do not allow apps to access Documents
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v Value /d Deny /t REG_SZ /f
:: do not allow apps to access Pictures
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v Value /d Deny /t REG_SZ /f
:: do not allow apps to access Videos
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v Value /d Deny /t REG_SZ /f
:: turn off game-bar
:: https://www.top-password.com/blog/disable-game-bar-and-game-dvr-in-windows-10/
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowgameDVR /d 0 /t REG_DWORD /f




:: Per user settings 
REG LOAD HKU\DefaultUser %SystemDrive%\Users\Default\NTUSER.DAT
:: Adjust for best performance - Control Panel\System and Security\System - Advanced system Settings - Performance Settings - Adjust for best performance
::check your values to make sure they are in line just as a precaution as this process was a bit tricky
:: :: https://www.tenforums.com/tutorials/6377-change-visual-effects-settings-windows-10-a.html
REG ADD HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects /v "VisualFXSetting" /d 2 /t REG_DWORD /f
REG ADD "HKU\DefaultUser\Control Panel\Desktop" /v "UserPreferencesMask" /d "9012038010000000" /t REG_BINARY /f
:: Turn off background apps
:: https://www.tenforums.com/tutorials/7225-turn-off-background-apps-windows-10-a.html
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /d 1 /t REG_DWORD /f
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /d 0 /t REG_DWORD /f
:: Do not let Website Access of Language List in Settings
:: https://www.tenforums.com/tutorials/82980-turn-off-website-access-language-list-windows-10-a.html
REG ADD "HKU\DefaultUser\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /d 1 /t REG_DWORD /f
:: Turn Off Suggested Content in Settings app
:: https://www.tenforums.com/tutorials/100541-turn-off-suggested-content-settings-app-windows-10-a.html
REG ADD HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-338393Enabled" /d 0 /t REG_DWORD /f
REG ADD HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-353694Enabled" /d 0 /t REG_DWORD /f
REG ADD HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-353696Enabled" /d 0 /t REG_DWORD /f
:: Inking and typing personalization turn off
:: https://www.tenforums.com/tutorials/118127-turn-off-inking-typing-personalization-windows-10-a.html
REG ADD HKU\DefaultUser\Software\Microsoft\InputPersonalization /v "RestrictImplicitInkCollection" /d 1 /t REG_DWORD /f
REG ADD HKU\DefaultUser\Software\Microsoft\InputPersonalization /v "RestrictImplicitTextCollection" /d 1 /t REG_DWORD /f
REG ADD HKU\DefaultUser\Software\Microsoft\Personalization\Settings /v "AcceptedPrivacyPolicy" /d 0 /t REG_DWORD /f

:: Disable Gamebar
:: https://www.top-password.com/blog/disable-game-bar-and-game-dvr-in-windows-10/
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled"  /d 0 /t REG_SZ /f
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled "  /d 0 /t REG_SZ /f
:: https://www.tenforums.com/tutorials/76094-turn-off-game-bar-tips-windows-10-a.html
REG ADD "HKU\DefaultUser\Software\Microsoft\GameBar" /v "ShowStartupPanel"  /d 0 /t REG_SZ /f
:: https://www.windowscentral.com/how-disable-and-remove-game-bar-windows-10-creators-update
REG ADD "HKU\DefaultUser\SYSTEM\CurrentControlSet\Services\xbgm" /v "Start"  /d 4 /t REG_SZ /f

REG UNLOAD HKU\DefaultUser
