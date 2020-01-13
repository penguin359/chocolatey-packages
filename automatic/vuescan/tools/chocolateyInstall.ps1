$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
 
  url            = 'https://www.hamrick.com/files/vuex3297.exe'
  checksum       = '00552eebee362ec1dfb863253411c4069aeca2c257678ad7816991d0e67423c0'
  checksumType   = 'sha256'
 
  url64          = 'https://www.hamrick.com/files/vuex6497.exe'
  checksum64     = 'c6f8f0ba18d3c5fa0c055ffaf70308204bc1edf1ea9999784e9957cbeffbbb18'
  checksumType64 = 'sha256'
}

if (Get-ChildItem Cert:\CurrentUser\TrustedPublisher\|Where subject -eq "CN=Hamrick Software, O=Hamrick Software, L=Sunny Isles Beach, S=Florida, C=US") {
  Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
} else {
  Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyInstallCertificate.ahk`""
}
Install-ChocolateyPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "VueScan.lnk"
$targetPath = Join-Path $env:ProgramFiles "VueScan\vuescan.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
