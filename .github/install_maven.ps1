param (
    [string]$sourcesDirectory
)

Write-Host "Installing Java..."
$javaDownloadUrl = "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.6+10/OpenJDK17U-jdk_x64_windows_hotspot_17.0.6_10.msi"
$javaInstallerPath = "$sourcesDirectory\OpenJDK17U-jdk_x64_windows_hotspot_17.0.6_10.msi"

Invoke-WebRequest -Uri $javaDownloadUrl -OutFile $javaInstallerPath

Write-Host "Installing Java..."
Start-Process -FilePath $javaInstallerPath -ArgumentList "/qn" -Wait

Write-Host "Installing Maven..."
$downloadUrl = "https://archive.apache.org/dist/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.zip"
$destinationPath = "$sourcesDirectory\Maven"

Write-Host "Creating Maven directory..."
New-Item -ItemType Directory -Path $destinationPath -Force

Write-Host "Downloading Maven..."
Invoke-WebRequest -Uri $downloadUrl -OutFile "$destinationPath\apache-maven-3.8.6-bin.zip"

Write-Host "Extracting Maven..."
Expand-Archive -Path "$destinationPath\apache-maven-3.8.6-bin.zip" -DestinationPath "$destinationPath" -Force

Write-Host "Setting environment variables..."
$env:JAVA_HOME = "C:\Program Files\AdoptOpenJDK\jdk-17.0.6+10"
$env:PATH += ";$env:JAVA_HOME\bin"
$env:PATH += ";$destinationPath\apache-maven-3.8.6\bin"

Write-Host "Verifying Maven installation..."
mvn --version