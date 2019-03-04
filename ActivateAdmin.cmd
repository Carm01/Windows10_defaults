net user administrator /active:yes
net user  Administrator apple2pie
wmic USERACCOUNT WHERE Name='administrator' SET PasswordExpires=FALSE
net user localadmin L0c4ladmin /add /passwordchg:NO
net localgroup "Administrators" "localadmin" /add
netsh interface ip set dns "local area connection" dhcp
