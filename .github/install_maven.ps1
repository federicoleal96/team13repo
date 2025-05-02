param (
    [string]$sourcesDirectory
)

$downloadUrl = "https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.zip"
$destinationPath = "$sourcesDirectory\Maven"

# Create the Maven directory if it doesn't exist
New-Item -ItemType Directory -Path $destinationPath -Force

# Download Maven
Invoke-WebRequest -Uri $downloadUrl -OutFile "$destinationPath\apache-maven-3.8.6-bin.zip"

# Extract Maven
Expand-Archive -Path "$destinationPath\apache-maven-3.8.6-bin.zip" -DestinationPath "$destinationPath" -Force

# Set environment variables
$env:PATH += ";$destinationPath\apache-maven-3.8.6\bin"

# Verify Maven installation
mvn --version