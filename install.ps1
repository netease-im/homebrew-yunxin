[CmdletBinding()]
param(
    [string]$ManifestUri = "https://raw.githubusercontent.com/netease-im/homebrew-yunxin/main/Casks/tokbox.json",
    [string]$ManifestPath,
    [switch]$Quiet,
    [switch]$SkipSignatureCheck
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

function Write-Step {
    param([string]$Message)
    Write-Host "==> $Message" -ForegroundColor Cyan
}

function Stop-Install {
    param([string]$Message)
    throw "Tokbox installation failed: $Message"
}

function Assert-X64Architecture {
    $values = @(
        $env:PROCESSOR_ARCHITEW6432
        $env:PROCESSOR_ARCHITECTURE
    ) | Where-Object { $_ }

    if ($values -contains "AMD64") {
        return
    }

    Stop-Install "Only 64-bit Windows on x64 is supported."
}

if ($env:OS -ne "Windows_NT") {
    Stop-Install "This script can only run on Windows."
}

# Windows PowerShell 5.1 may otherwise negotiate an obsolete TLS version.
[Net.ServicePointManager]::SecurityProtocol = `
    [Net.ServicePointManager]::SecurityProtocol -bor `
    [Net.SecurityProtocolType]::Tls12

$installerPath = $null

try {
    if ($ManifestPath) {
        Write-Step "Reading manifest from $ManifestPath"
        $manifestJson = Get-Content -LiteralPath $ManifestPath -Raw
    } else {
        Write-Step "Downloading installation manifest"
        $manifestJson = (Invoke-WebRequest -Uri $ManifestUri -UseBasicParsing).Content
    }

    $manifest = $manifestJson | ConvertFrom-Json
    if ($manifest.schemaVersion -ne 1) {
        Stop-Install "Unsupported manifest schema version '$($manifest.schemaVersion)'."
    }
    if (-not $manifest.product -or -not $manifest.version) {
        Stop-Install "The manifest must define product and version."
    }

    Assert-X64Architecture
    $architecture = "x64"
    $package = $manifest.architectures.x64
    if (-not $package) {
        Stop-Install "No package is configured for $architecture."
    }
    if (-not $package.url) {
        Stop-Install "The download URL for $architecture has not been configured."
    }
    if ($package.sha256 -notmatch '^[0-9a-fA-F]{64}$') {
        Stop-Install "The SHA-256 value for $architecture is missing or invalid."
    }
    if ($package.installerType -notin @("exe", "msi")) {
        Stop-Install "installerType must be either 'exe' or 'msi'."
    }

    $extension = "." + $package.installerType
    $installerPath = Join-Path ([IO.Path]::GetTempPath()) `
        ("{0}-{1}-{2}{3}" -f $manifest.product, $manifest.version, $architecture, $extension)

    Write-Step "Downloading $($manifest.product) $($manifest.version) for $architecture"
    Invoke-WebRequest -Uri $package.url -OutFile $installerPath -UseBasicParsing

    Write-Step "Verifying SHA-256"
    $actualHash = (Get-FileHash -LiteralPath $installerPath -Algorithm SHA256).Hash
    if ($actualHash -ne $package.sha256) {
        Stop-Install "SHA-256 mismatch. Expected $($package.sha256), got $actualHash."
    }

    if (-not $SkipSignatureCheck) {
        if (-not $manifest.signaturePublisher) {
            Stop-Install "signaturePublisher has not been configured. Use -SkipSignatureCheck only for local testing."
        }

        Write-Step "Verifying digital signature"
        $signature = Get-AuthenticodeSignature -LiteralPath $installerPath
        if ($signature.Status -ne "Valid") {
            Stop-Install "The installer signature is not valid: $($signature.Status)."
        }
        if ($signature.SignerCertificate.Subject -notlike "*$($manifest.signaturePublisher)*") {
            Stop-Install "The installer signer does not match '$($manifest.signaturePublisher)'."
        }
    }

    $configuredArgs = if ($Quiet) { @($package.silentArgs) } else { @($package.interactiveArgs) }
    if ($package.installerType -eq "msi") {
        $executable = Join-Path $env:SystemRoot "System32\msiexec.exe"
        $arguments = @("/i", ('"{0}"' -f $installerPath)) + $configuredArgs
    } else {
        $executable = $installerPath
        $arguments = $configuredArgs
    }

    Write-Step "Installing $($manifest.product)"
    $process = Start-Process -FilePath $executable -ArgumentList $arguments -Wait -PassThru
    if ($process.ExitCode -notin @(0, 3010)) {
        Stop-Install "The installer exited with code $($process.ExitCode)."
    }

    Write-Host "$($manifest.product) $($manifest.version) installed successfully." -ForegroundColor Green
    if ($process.ExitCode -eq 3010) {
        Write-Host "Windows must be restarted to complete the installation." -ForegroundColor Yellow
    }
} finally {
    if ($installerPath -and (Test-Path -LiteralPath $installerPath)) {
        Remove-Item -LiteralPath $installerPath -Force -ErrorAction SilentlyContinue
    }
}
