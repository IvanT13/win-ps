# win-ps
Repo with variety of PowerShell scripts for Windows environment

## Windows Defender Firewall Rules

This PowerShell script is useful when you have applications that install in user context, and you can't add exception rules to Firewall via Group Policy Object.
This script is written for adding Firewall expections for Microsoft Teams - app that install in the users AppData folder.
Customize this script for any other application that install in user context by following inline comments.