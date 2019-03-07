# Windows 10 default settings

Scripts for Windows 10 default settings without sysprep audit mode. Some sysAdmins think AuditMode, Copy Profile or Mandatory profiles is the shit; it is not! It is a antiquated, manual, time consuming, and clunky process. For example if you try and use AuditMode to make some of the changes in settings, sysprep will make about 20,000 additional lines in the file: 'C:\Users\Default\NTUSER.DAT', and increasing its size by 10X. The normal size is 256KB. In addition to that the time it takes to initially log onto the machine is increased due to bloated C:\Users\Default\AppData. This should be a SMALL as possible. for Example on a Fresh Windows 10 installed from an ISO from Microsoft the C:\Users\Default\AppData is only 163KB and 53 files.

By editing the default profile directly you target each setting precisely instead of some obscure unknown process which you really do not know how it works behind the scenes. That is how this method of editing the default profile directly works. Furthermore, you KNOW EVERY setting being applied to the machine doing it this way, and it is the SAME every time you create an image. You have documentation to give to end users or technical support staff so they know exactly what settings are applied instead some vague and/or non-existent list of applications and setting you apply, or forgot to apply in many cases. Lastly, this method is FAST as all machine setting literally only take a few seconds to apply.

Below is a list of files and their basic description:

ActivateAdmin.cmd - scripted to activate the built in Admin account and an example of how to add an account.

settings.cmd - is are the settings applied to the machine designed to replace sysprep Audit mode and copy profile mode as a way to effectively target individual settings. The hive modifications will take place upon the next NEW user login. 
IMPORTANT: Line 39 sets Time Zone Information.

settings_Current_USER.cmd - is an alternate to settings.cmd with a few changes to be run on current user logged in. if this is just a one off machine not being used by multiple people.
IMPORTANT: LIne 40 is TimeZone information.

Tweeks.au3 is the autoIT version that is designed to be compiled to an exe to replace the settings.cmd. This can be run at the end of the sysprep process when a machine is finished imaging.
IMPORTANT: Line 116 sets TimeZone Information.

RemoveProvisionedApps.cmd - is designed to remove a lot of the bloat ware on the start menu AFTER a user logs in to the machine. This is good for a per user basis. I DO NOT RECCOMEND using this one as a start up script. Use the one below.

ProvisionedApps_Removal.au3 - is an AUTOIT version that is designed to be compiled and ran as a delayed start up scrip on a per user basis. The timing is set to run 60 seconds after a person logs on to allow the profile to build itself. This compiled script is non-intrusive and will show no signs of running and will automatically exit when done. In its current iteration it will run upon every user login and uses very low resources and will not interfere with the startup or profile creation process. 

References: https://stealthpuppy.com/customize-the-windows-default-profile/#.XEfajs17mUm
