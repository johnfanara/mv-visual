$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

$exportPath = Join-Path $scriptDir "..\assets\DiscordChatExporter.Cli.win-x64\DiscordChatExporter.Cli.exe"
$outputFolder = Join-Path $scriptDir "..\assets\list\"

$config = Get-Content "$scriptDir\..\assets\discord\config.json" | ConvertFrom-Json
$channelId = $config.channel
$token = $config.token

$dateString = Get-Date -Format "MMddyyyy"
$outputFile = Join-Path $outputFolder "movie-list-$dateString.json"

$args = @(
    "export"
    "-c", $channelId
    "-t", $token
    "-f", "Json"
    "-o", $outputFile
)

Write-Host "Running DiscordChatExporter"
& @exportPath @args
Write-Host "Export complete: $outputFile"