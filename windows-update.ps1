# Windows Update Script ❤️
# This script checks, downloads, and installs Windows updates automatically.
# Requires administrator rights and PowerShell 5.1+

# Check if the PSWindowsUpdate module is installed
if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    Write-Output "Installing PSWindowsUpdate module..."
    Install-PackageProvider -Name NuGet -Force
    Install-Module -Name PSWindowsUpdate -Force
} else {
    Write-Output "PSWindowsUpdate module is already installed."
}

# Import the module
Import-Module PSWindowsUpdate

# Check for available updates
Write-Output "Checking for available updates..."
$updates = Get-WindowsUpdate

if ($updates) {
    Write-Output "Updates found:"
    $updates | Format-Table -Property Title, KB, Size

    # Install all available updates and reboot automatically if needed
    Write-Output "Installing updates..."
    Install-WindowsUpdate -AcceptAll -AutoReboot -Verbose
} else {
    Write-Output "Your system is already up to date. ✅"
}

Write-Output "Update process finished!"
