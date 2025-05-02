param (
    [string]$sourcesDirectory
)

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
$env:PATH += ";$destinationPath\apache-maven-3.8.6\bin"

Write-Host "Verifying Maven installation..."
if ($env:JAVA_HOME) {
    mvn --version
} else {
    Write-Host "JAVA_HOME environment variable not set. Maven installation failed."
    exit 1
}