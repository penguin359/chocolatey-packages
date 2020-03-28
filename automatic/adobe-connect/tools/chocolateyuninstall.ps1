$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Adobe Connect'
  fileType      = 'EXE'
  silentArgs    = "/qn /uninstall"
}

$uninstalled = $false
[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -eq 1) {
  $key | % {
    $packageArgs['file'] = "$($_.UninstallString)" -replace '/uninstall', ''
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

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Adobe Connect application'
  fileType      = 'MSI'
  silentArgs    = "{2E306F90-BAFA-484B-A9D2-0BEE698C6C46} /qn /norestart"
}

$uninstalled = $false
[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -eq 1) {
  $key | % {
    $packageArgs['file'] = "$($_.UninstallString)"
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