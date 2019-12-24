$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
 
  url            = 'https://www.hamrick.com/files/vuex3297.exe'
  checksum       = '9f6df76d1a540838dd9f36f2abc970ab9b8f569e44431821d0d11e9dba46c7b1'
  checksumType   = 'sha256'
 
  url64          = 'https://www.hamrick.com/files/vuex6497.exe'
  checksum64     = '2eb282df2360a302b05b14cdcc37919b159e718861493ace0ce80a7d35dc936a'
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
