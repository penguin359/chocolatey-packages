$ErrorActionPreference = 'Stop';
$installdir = "$env:APPDATA\ACEStream"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Ace Stream Media *'
  fileType      = 'exe'
  file          = "$installdir\uninstall.exe"
  silentArgs	= '/S'
}

# Close remaining acestream processes
foreach ( $processName in 'ace_update', 'ace_engine', 'ace_player' ) {
  $process = Get-Process $processName -ErrorAction SilentlyContinue
  if ($process) {
    $process | Stop-Process
    $process | Wait-Process
  }
}

$uninstalled = $false
[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -eq 1) {
  $key | % {     
    Uninstall-ChocolateyPackage @packageArgs
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $($_.DisplayName)"}
}

# Remove installation directory and its remaining content.
if (Test-Path $installdir) { Remove-Item -Recurse $installdir }

Write-Warning "Remaining files in `"$env:APPDATA\.ACEStream`", to remove if needed."