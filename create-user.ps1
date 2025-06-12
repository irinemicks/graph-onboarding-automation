. ./auth.ps1
$user = @{
    accountEnabled = $true
    displayName = "John Doe"
    mailNickname = "johndoe"
    userPrincipalName = "johndoe@**.onmicrosoft.com"
    passwordProfile = @{
        forceChangePasswordNextSignIn = $true
        password = "TemporaryPass@123"
    }
}

$json = $user | ConvertTo-Json -Depth 10

Invoke-RestMethod -Headers @{Authorization = "Bearer $accessToken"} `
    -Uri "https://graph.microsoft.com/v1.0/users" `
    -Method POST -Body $json -ContentType "application/json"
