This is an AutoIT file/script. I do not know how to do this in a BAT file.
This will go through all existing profiles, except the ones you choose to ignore, and modify registry settings for existing users where that profile is NOT in use. meaning is user JOE is currently logged in, it will ignore that profile, write a log file to the root of the C drive stating that it was not able to modify the existing Hive/User Joe. 
If you want to successfully hit all existing profiles, then at least one reboot is necessary. In some cases I have seen two reboots necessary to clear out existing profiles.
You can compile this script to an exe and run it from whatever location you want
There is an example of a self destruct piece where the exe will delf delete upon running IF placed in a certain directory. 

The included script is an example to disable extended displays for MS powerpoint.

**These are HKCU hive entries ONLY. DO NOT USE HKLM or anything else!**
