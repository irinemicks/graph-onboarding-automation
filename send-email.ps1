. ./auth.ps1

# Compose the welcome email
$body = @{
    message = @{
        subject = "Welcome to the Team!"
        body = @{
            contentType = "Text"
            content = "Hi John, welcome to the company! Let's meet tomorrow at 10 AM."
        }
        toRecipients = @(
            @{ emailAddress = @{ address = "johndoe@quonosdatahq.onmicrosoft.com" } }
        )
    }
    saveToSentItems = $true
}

$json = $body | ConvertTo-Json -Depth 10

# Replace with your own sender email address
$senderEmail = "DamilolaAremu@quonosdatahq.onmicrosoft.com"

# Send the email with error handling
try {
    $response = Invoke-RestMethod -Headers @{ Authorization = "Bearer $accessToken" } `
        -Uri "https://graph.microsoft.com/v1.0/users/$senderEmail/sendMail" `
        -Method POST -Body $json -ContentType "application/json"

    Write-Host "`n✅ Email sent successfully!" -ForegroundColor Green
}
catch {
    Write-Host "❌ ERROR SENDING EMAIL:" -ForegroundColor Red
    Write-Host $_.Exception.Message
    Write-Host $_.ErrorDetails.Message
}
