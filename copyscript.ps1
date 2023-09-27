# Get the build definition name and build number from predefined variables
$buildDefinitionName = $env:BUILD_DEFINITIONNAME
$buildNumber = $env:BUILD_BUILDNUMBER

# Check if the source and destination paths are correctly formed
$sourcePath = "\\localhost\builds\$buildDefinitionName\$buildNumber\drop\aspdotnetapp\aspdotnetapp"
$destinationPath = "C:\inetpub\wwwroot\mywebsite"

# Check if the source directory exists
if (Test-Path -Path $sourcePath -PathType Container) {
    # Check if the destination directory exists, and if not, create it
    if (-not (Test-Path -Path $destinationPath -PathType Container)) {
        New-Item -Path $destinationPath -ItemType Directory
    }

    # Copy the files from the source to the destination
    Copy-Item -Path $sourcePath\* -Destination $destinationPath -Recurse -Force

    Write-Host "Files copied successfully."
} else {
    Write-Host "Source directory does not exist: $sourcePath"
}
