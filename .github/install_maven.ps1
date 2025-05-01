# Download and install Maven
Invoke-WebRequest -Uri "https://dl.bintray.com/apache/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.zip" -OutFile "C:\Maven\apache-maven-3.8.6-bin.zip"
Expand-Archive -Path "C:\Maven\apache-maven-3.8.6-bin.zip" -DestinationPath "C:\Maven"
# Add Maven to the system's PATH environment variable
$env:PATH += ";C:\Maven\bin"