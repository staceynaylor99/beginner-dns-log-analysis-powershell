param(
    [int]$MinutesBack = 15,
    [int]$MaxEvents   = 200
)

# Look back this many minutes from now
$startTime = (Get-Date).AddMinutes(-$MinutesBack)

# Filter DNS Client Operational log for common DNS event IDs on Windows 10/11
$filterHash = @{
    LogName   = "Microsoft-Windows-DNS-Client/Operational"
    StartTime = $startTime
    Id        = 3008,3010,3011,3012,3020
}

Write-Host "Collecting DNS events from the last $MinutesBack minutes..." 

$events = Get-WinEvent -FilterHashtable $filterHash -MaxEvents $MaxEvents |
    Select-Object `
        TimeCreated,
        Id,
        @{Name="Provider"; Expression = { $_.ProviderName }}, `
        @{Name="Message";  Expression = { $_.Message }}

# Figure out project root folder (one level up from 'scripts')
$projectRoot = Split-Path -Parent $PSScriptRoot
$logDir      = Join-Path $projectRoot "logs"

if (-not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir | Out-Null
}

# Build log file name
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$logFile   = Join-Path $logDir "dns-events-$timestamp.csv"

$events | Export-Csv -Path $logFile -NoTypeInformation -Encoding UTF8

Write-Host ""
Write-Host "Saved $($events.Count) DNS events to:"
Write-Host "  $logFile"
