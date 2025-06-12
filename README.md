# Graph Onboarding Automation 

This project automates the process of onboarding a new Microsoft 365 user using the Microsoft Graph API. It creates the user in Azure AD, assigns a license, adds them to a Team, and sends a welcome email — all from a PowerShell script.

Features
- Creates a new Azure AD user via Microsoft Graph
- Assigns Microsoft 365 licenses
- Adds user to a specific Microsoft Team
- Sends onboarding email and calendar invite
- Uses PowerShell and OAuth2 authentication flow

Project Structure
- `/scripts`: All automation scripts using Microsoft Graph
- `requirements.md`: What you need to run it locally

How to Run
1. Register an app in Azure AD
2. Grant required API permissions: `User.ReadWrite.All`, `Group.ReadWrite.All`, `Mail.Send`, etc.
3. Clone this repo
4. Update the client credentials in `auth.ps1`
5. Run `./scripts/onboard-user.ps1`

Authentication
Uses client credential flow for app-only permissions. Instructions provided in `requirements.md`.

📷 Screenshots
![image](https://github.com/user-attachments/assets/a7a84ddc-e421-4205-a674-f8b6dd227c85)


Author
[Damilola Aremu
