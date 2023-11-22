#Create task "RegUSA Mapped Drive - Create Folder"
$Action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-WindowStyle hidden -ExecutionPolicy Bypass New-Item -Path $env:USERPROFILE\RegUSA -ItemType Directory;New-Item -Path "C:\Temp" -ItemType Directory;New-Item "C:\Temp\userProfile.txt" -ItemType File -Value "$env:USERPROFILE" -Force;New-Item "C:\Temp\userName.txt" -ItemType File -Value "$env:UserName" -Force'
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Tsettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit (New-TimeSpan -Hours 1) -MultipleInstances IgnoreNew -DontStopOnIdleEnd -RestartCount 3 -RestartInterval (New-TimeSpan -Minutes 1) -StartWhenAvailable
$Tsettings.CimInstanceProperties.Item('MultipleInstances').Value = 3   # 3 corresponds to 'Stop the existing instance'
$Principal = New-ScheduledTaskPrincipal -GroupId "INTERACTIVE"
$Task = Register-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Tsettings -Principal $Principal -TaskName "RegUSA Mapped Drive - Create Folder" -Force
$Task | Set-ScheduledTask

#Create task "RegUSA Mapped Drive - Create Share"
$Action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-WindowStyle hidden -ExecutionPolicy Bypass Start-Sleep -Seconds 30;$userProfile = Get-Content -Path C:\Temp\userProfile.txt;$userName = Get-Content -Path C:\Temp\userName.txt;Remove-SmbShare -Name "RegUSA" -Force;New-SmbShare -Name "RegUSA" -Path $userProfile\RegUSA\ -FullAccess normreeves.com\$userName'
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Tsettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit (New-TimeSpan -Hours 1) -MultipleInstances IgnoreNew -DontStopOnIdleEnd -RestartCount 3 -RestartInterval (New-TimeSpan -Minutes 1) -StartWhenAvailable
$Tsettings.CimInstanceProperties.Item('MultipleInstances').Value = 3   # 3 corresponds to 'Stop the existing instance'
$Principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
$Task = Register-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Tsettings -Principal $Principal -TaskName "RegUSA Mapped Drive - Create Share" -Force
$Task | Set-ScheduledTask

#Create task "RegUSA Mapped Drive - Create Drive"
$Action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-WindowStyle hidden -ExecutionPolicy Bypass Start-Sleep -Seconds 60;net use I: /delete;net use I: \\$env:computername\RegUSA /Persistent:Yes'
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Tsettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit (New-TimeSpan -Hours 1) -MultipleInstances IgnoreNew -DontStopOnIdleEnd -RestartCount 3 -RestartInterval (New-TimeSpan -Minutes 1) -StartWhenAvailable
$Tsettings.CimInstanceProperties.Item('MultipleInstances').Value = 3   # 3 corresponds to 'Stop the existing instance'
$Principal = New-ScheduledTaskPrincipal -GroupId "INTERACTIVE"
$Task = Register-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Tsettings -Principal $Principal -TaskName "RegUSA Mapped Drive - Create Drive" -Force
$Task | Set-ScheduledTask