# DumpShot
Dump local hives using scheduled tasks and forfiles. 


               [~]
               |=|
             .-' '-.
             |-----|
             | ~~~ |
             | ~~~ |
             | XXX |
             |-----|
             '-----'

```powershell
#Import Module
Import-Module .\DumpShot.ps1

#Start scheduled tasks with proxy execution (wait 1 minute) - No Clean, Better for Decorrelation
Invoke-DumpShot

#Cleaner :
Invoke-DumpShot -Cleaner

#Start the scheduled tasks immediately (tasks will be cleaned)
Invoke-DumpShot -Hurry

```
