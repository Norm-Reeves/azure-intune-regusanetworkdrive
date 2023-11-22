# azure-intune-regusanetworkdrive
PowerShell scripts that apply or remove scheduled tasks that create a network drive I: that points to $env:USERPROFILE\RegUSA. Packaged as a Windows App (.intunewin) to be managed by Intune Apps.

Scheduled Tasks Created:
1.) RegUSA Mapped Drive - Create Folder
2.) RegUSA Mapped Drive - Create Share
3.) RegUSA Mapped Drive - Create Drive

This was created to automate setup of RegUSA network drive needed for intergration.

Download .intunewin
=========


Change Log:
============
1.0:

  • Created working scripts and .intunewin file.
