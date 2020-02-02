$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
 
  url            = 'https://www.hamrick.com/files/vuex3297.exe'
  checksum       = '809c30c7c3e5dee229abecb792615baa290c761674907352b4ff866dd0f37d37'
  checksumType   = 'sha256'
 
  url64          = 'https://www.hamrick.com/files/vuex6497.exe'
  checksum64     = '7a371eec305a5de0209842ece7800701ed64bf00de83189032b2f1aeb69c2f52'
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
