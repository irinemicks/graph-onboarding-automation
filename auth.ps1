# auth.ps1
$clientId = "Client-ID"
$tenantId = "Tenant-ID"
$clientSecret = "ClientValue"
$scope = "https://graph.microsoft.com/.default"

$body = @{
    client_id     = $clientId
    scope         = $scope
    client_secret = $clientSecret
    grant_type    = "client_credentials"
}

$tokenResponse = Invoke-RestMethod -Method POST -Uri "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token" -Body $body
$accessToken = $tokenResponse.access_token


