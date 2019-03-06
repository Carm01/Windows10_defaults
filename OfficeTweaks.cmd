:: Per user settings for office tweaks
REG LOAD HKU\DefaultUser %SystemDrive%\Users\Default\NTUSER.DAT

:: Hide Microsoft Office Upload icon sys tray display
REG ADD HKU\DefaultUser\Software\Microsoft\Office\16.0\Common\FileIO /v "DisableNotificationIcon" /d 1 /t REG_DWORD /f

:: Do not show office start screen for all apps
REG ADD HKU\DefaultUser\Software\Microsoft\Office\16.0\Common\General /v "DisableBootToOfficeStart" /d 1 /t REG_DWORD /f
REG ADD HKU\DefaultUser\Software\Microsoft\Office\16.0\Common\General /v "FirstRun" /d 0 /t REG_DWORD /f

:: Do not alert if excel is not default app
REG ADD HKU\DefaultUser\SSoftware\Microsoft\Office\16.0\Excel\Options /v "AlertIfNotDefault" /d 0 /t REG_DWORD /f

:: Do not alert if Power point is not default app
REG ADD HKU\DefaultUser\Software\Microsoft\Office\16.0\PowerPoint\Options /v "AlertIfNotDefault" /d 0 /t REG_DWORD /f
:: Disable extend the display when presenting on tablet of laptop
REG ADD HKU\DefaultUser\Software\Microsoft\Office\16.0\PowerPoint\Options /v "DisableSetTopology" /d 1 /t REG_DWORD /f

:: WODD Set default format to .docx
REG ADD HKU\DefaultUser\Software\Microsoft\Office\16.0\Word\Options /v "DefaultFormat" /d "" /t REG_SZ /f

REG UNLOAD HKU\DefaultUser
