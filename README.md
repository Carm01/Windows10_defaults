# Windows 10 default settings

Scripts for Windows 10 default settings without sysprep audit mode. Some sysAdmins think AuditMode, Copy Profile, or Mandatory profiles is the shit; it is not! It is a antiquated, manual, time consuming, and clunky process. For example if you try and use AuditMode to make some of the changes in settings, sysprep will make about 20,000 additional lines in the file: `C:\Users\Default\NTUSER.DAT`, and increasing its size by 10X. The normal size is 256KB. In addition to that the time it takes to initially log onto the machine is increased due to bloated C:\Users\Default\AppData. This should be a SMALL as possible. for Example on a Fresh Windows 10 installed from an ISO from Microsoft the C:\Users\Default\AppData is only 163KB and 53 files. Admin adds additional bulk to your image. I have seen our sysadmin who is suppose to be an expert leave as much as 1 GIG in the users folder. 

## Editing the default profile directly
Sadly, I have found that a lot of sysadmins do not know what this actually means despite the title of SystemAdmin. By editing the default profile directly you target each setting precisely instead of some obscure unknown process which you really do not know how it works behind the scenes. That is how this method of editing the default profile directly works. Furthermore, you know __every__ setting being applied to the machine, and it is the __same__ every time you create an image with no guessing games on if you missed anything. You have documentation to give to end users, or technical support staff so they know exactly what settings are applied instead some vague, and/or non-existent list of applications, setting you apply, or forgot to apply in many cases during audit mode. Lastly, this method is __fast__ as all machine setting literally only take a few seconds to apply with a script.

### How it works
Listed under the `:: Per user settings ` in the __settings.cmd__ script is how this process works. 
- `REG LOAD HKU\DefaultUser %SystemDrive%\Users\Default\NTUSER.DAT` Opens or loads the default hive, and gives it a name of `DefaultUser`. If you open up `regedit.exe` and expand the key `HKEY_USERS` you will see that reflected. Any changes made under that will take effect for all user next _new_ user login. You must unload it as well. 
There is nothing wrong with putting all your settings in once big script, just be sure you place all your `HKU\DefaultUser` settings within the _load_ and _unload_ section. 

_I would recommend to ___not___ activate the Admin account as it could jack up your sysprep process and do not use copy profile setting in your unattend.xml file._

### Below is a file list and what they do, which will explain the process a little better.

- __ActivateAdmin.cmd__ - Scripted to activate the built in Administrator account and an example of how to add an account. _Not recommended before sysprep._

- __settings.cmd__ - Are the settings applied to the machine designed to replace sysprep Audit mode and copy profile mode as a way to effectively target individual settings. The hive modifications will take place upon the next NEW user login. Any preexisting profiles will not be effected. _Listed under per user setting is how one edits the default profile directly._ 
__IMPORTANT: Line 39 sets Time Zone Information.__

- __settings_Current_USER.cmd__ - An alternate to settings.cmd with a few changes to be run on current user logged in. If this is just a one off machine not being used by multiple people. _hint: you can modify the per user settings for the default hive to add to the script to change with the current user as well if that is important._
__IMPORTANT: LIne 40 is TimeZone information.__

- __Tweeks.au3__ - AutoIT version that is designed to be compiled to an exe to replace the settings.cmd. This can be run at the end of the sysprep process when a machine is finished imaging.
__IMPORTANT: Line 116 sets TimeZone Information.__

- __RemoveProvisionedApps.cmd__ - Designed to remove a lot of the bloat ware on the start menu AFTER a user logs in to the machine. This is good for a per user basis. I DO NOT RECCOMEND using this one as a start up script. Use the one below. It shows how to pull this process off as well.

- __ProvisionedApps_Removal.au3__ - AUTOIT version that is designed to be compiled and ran as a delayed start up scrip on a per user basis. The timing is set to run 60 seconds after a person logs on to allow the profile to build itself. This compiled script is non-intrusive and will show no signs of running and will automatically exit when done. In its current iteration it will run upon every user login and uses very low resources and will not interfere with the startup or profile creation process. 

- __AdditionalSettings.cmd__ - Mostly app permissions from the location Settings -> Privacy, however there is a performance tweak in that file too. ___It is very important to understand the `VisualFXSetting` and `UserPreferencesMask` setting as it controls the settings under: `Right click this PC - properties - Advanced system Settings - Performance Settings`. Most people might want want to changes these and just let windows manage it, however some want to optimize performance.___

- __Officetweaks.cmd__ - Takes care of some common annoyances. Each setting has an explanation. You might have to change the path if you are on Office3665.

References: https://stealthpuppy.com/customize-the-windows-default-profile/#.XEfajs17mUm
