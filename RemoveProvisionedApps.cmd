:: this has to be done on a per user basis as a profile is initially created. This script is good for single users.
powershell -Command "Get-AppxPackage *candycrush* -allusers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *xbox* -allusers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *hiddencity* -allusers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Feedbackhub* -allusers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *officehub* -allusers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *BingNews* -allusers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *GameBar* -allusers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *SolitaireCollection* -allusers | Remove-AppxPackage"
