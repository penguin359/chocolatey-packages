$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
 
  url            = 'https://www.hamrick.com/files/vuex3297.exe'
  checksum       = 'da84c236d6c3e3850c432bbc7676b0f860b4c8ee41ec54fc93c95a95221e01ab'
  checksumType   = 'sha256'
 
  url64          = 'https://www.hamrick.com/files/vuex6497.exe'
  checksum64     = 'e9097a691af09801c5332bbf47a2391f7d404814f6d95da592217ccdfdf947c0'
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
