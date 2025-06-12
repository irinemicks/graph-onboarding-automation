. ./auth.ps1

$teamId = "<team-id>"
$userId = "johndoe@**.onmicrosoft.com"

$body = @{
    "@odata.type" = "#microsoft.graph.aadUserConversationMember"
    roles = @("member")
    "user@odata.bind" = "https://graph.microsoft.com/v1.0/users('$userId')"
}

$json = $body | ConvertTo-Json -Depth 10

Invoke-RestMethod -Headers @{Authorization = "Bearer $accessToken"} `
    -Uri "https://graph.microsoft.com/v1.0/teams/$teamId/members" `
    -Method POST -Body $json -ContentType "application/json"
