param(
    [Parameter(Mandatory = $true)]
    [string]$Version,

    [Parameter(Mandatory = $true)]
    [string]$Destination,

    [Parameter(Mandatory = $true)]
    [string]$Url,

    [string]$Sha256
)

$timestamp = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH-mm-ssZ')
$destinationPath = Resolve-Path -Path $Destination -ErrorAction SilentlyContinue
if (-not $destinationPath) {
    New-Item -ItemType Directory -Path $Destination | Out-Null
    $destinationPath = Resolve-Path -Path $Destination
}

$logFile = Join-Path $destinationPath "jetpack-$Version-download.log"
$fileName = "Jetson_Orin_Nano_Developer_Kit_SD_Card_Image_$Version.zip"
$targetPath = Join-Path $destinationPath $fileName

function Write-Log {
    param([string]$Message)
    $entry = "[$(Get-Date -AsUTC -Format 'yyyy-MM-ddTHH:mm:ssZ')] $Message"
    $entry | Tee-Object -FilePath $logFile -Append
}

Write-Log "Starting JetPack $Version download"

try {
    Write-Log "Downloading $Url"
    Invoke-WebRequest -Uri $Url -OutFile $targetPath -UseBasicParsing
    Write-Log "Download complete: $targetPath"
}
catch {
    Write-Log "Download failed: $($_.Exception.Message)"
    throw
}

$computed = (Get-FileHash -Path $targetPath -Algorithm SHA256).Hash.ToLower()
Write-Log "Computed SHA-256: $computed"

if ($Sha256) {
    if ($computed -eq $Sha256.ToLower()) {
        Write-Log "Checksum verification succeeded."
    }
    else {
        Write-Log "Checksum verification FAILED. Expected $Sha256"
        throw "Checksum verification failed."
    }
}
else {
    Write-Log "No expected hash provided; verification skipped."
}

Write-Log "All tasks completed."
