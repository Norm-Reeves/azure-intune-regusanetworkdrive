#Remove all scheduled tasks
Unregister-ScheduledTask -TaskName "RegUSA Mapped Drive - Create Folder" -Confirm:$false
Unregister-ScheduledTask -TaskName "RegUSA Mapped Drive - Create Share" -Confirm:$false
Unregister-ScheduledTask -TaskName "RegUSA Mapped Drive - Create Drive" -Confirm:$false

#Removing network drive not possible as it is in user context.