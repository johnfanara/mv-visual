$exportPath = Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "..\assets\DiscordChatExporter.Cli.win-x64\DiscordChatExporter.Cli.exe"
$exportPath = Resolve-Path $exportPath

$configPath = "..\assets\discord\config.json"
$config = Get-Content $configPath | ConvertFrom-Json

$token = "-"
$channel = "-"

$outputPath = "..\assets\list"

$dateString = Get-Date -Format "yyyy-MM-dd"
$outputFile = Join-Path $outputPath "movie_list_$dateString.json"

$cmd = "`"$exportPath`" export --channel $channel --token $token --format Json --output `"$outputFile`""

Write-Host "Running DiscordChatExporter..."

cmd /c $cmd

Write-Host "Chat exported to $outputFile"
Write-Host "Resolved path: $exportPath"
