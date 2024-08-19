# DumpSpirits
Dump local hives using scheduled tasks and forfiles. 

```powershell
#Import Module
Import-Module .\DumpSpirits.ps1

#Start scheduled tasks with proxy execution (wait 1 minute) - No Clean, Better for Decorrelation
Invoke-DumpSpirits

#Cleaner :
Invoke-DumpSpirits -Cleaner

#Start the scheduled tasks immediately (tasks will be cleaned)
Invoke-DumpSpirits -Hurry

```
