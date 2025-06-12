. ./auth.ps1

$userId = "johndoe@**.onmicrosoft.com"
$skuId = "skuID"

$body = @{
    addLicenses = @(@{ skuId = $skuId })
    removeLicenses = @()
}

$json = $body | ConvertTo-Json -Depth 10

try {
    $response = Invoke-RestMethod -Headers @{Authorization = "Bearer $accessToken"} `
        -Uri "https://graph.microsoft.com/v1.0/users/$userId/assignLicense" `
        -Method POST -Body $json -ContentType "application/json"
    
    Write-Host "License assigned successfully!" -ForegroundColor Green
    $response
} catch {
    Write-Host "Error occurred:" -ForegroundColor Red
    Write-Host $_.Exception.Message
    
    if ($_.Exception.Response) {
        $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
        $errorDetails = $reader.ReadToEnd()
        Write-Host "Error Details: $errorDetails" -ForegroundColor Yellow
        $reader.Close()
    }
}