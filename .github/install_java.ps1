param (
    [string]$sourcesDirectory
)

Write-Host "Installing Java..."
$javaDownloadUrl = "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.6+10/OpenJDK17U-jdk_x64_windows_hotspot_17.0.6_10.msi"
$javaInstallerPath = "$sourcesDirectory\OpenJDK17U-jdk_x64_windows_hotspot_17.0.6_10.msi"

Invoke-WebRequest -Uri $javaDownloadUrl -OutFile $javaInstallerPath

Write-Host "Installing Java silently..."
Start-Process -FilePath msiexec.exe -ArgumentList "/i $javaInstallerPath /qn" -Wait

Write-Host "Setting environment variables..."
$javaHomePath = "C:\Program Files\AdoptOpenJDK\jdk-17.0.6+10"
if (Test-Path $javaHomePath) {
    [Environment]::SetEnvironmentVariable("JAVA_HOME", $javaHomePath, "Machine")
    [Environment]::SetEnvironmentVariable("PATH", $env:PATH + ";$javaHomePath\bin", "Machine")
    Write-Host "JAVA_HOME environment variable set to $javaHomePath"
} else {
    Write-Host "JAVA_HOME environment variable not set. Java installation failed."
}