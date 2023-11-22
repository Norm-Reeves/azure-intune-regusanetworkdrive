# azure-intune-regusanetworkdrive
PowerShell scripts that apply or remove scheduled tasks that create a network drive I: which points to $env:USERPROFILE\RegUSA. It is packaged as a Windows App (.intunewin) to be managed by Intune Apps.

Scheduled Tasks Created:
1.) RegUSA Mapped Drive - Create Folder
2.) RegUSA Mapped Drive - Create Share
3.) RegUSA Mapped Drive - Create Drive

This was created to automate the setup of RegUSA network drive needed for integration.

Download .intunewin
=========
https://github.com/Norm-Reeves/azure-intune-regusanetworkdrive/releases/download/v1.0/azure-intune-regusanetworkdrive.intunewin

Change Log:
============
1.0:

  • Created working scripts and .intunewin file.
