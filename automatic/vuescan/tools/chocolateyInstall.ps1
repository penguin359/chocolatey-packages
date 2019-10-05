$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
 
  url            = 'https://www.hamrick.com/files/vuex3297.exe'
  checksum       = '97d990acd822a8af230197a9b7b15fd8c5caedc0d77454c6192e79394624874f'
  checksumType   = 'sha256'
 
  url64          = 'https://www.hamrick.com/files/vuex6497.exe'
  checksum64     = '1cdc4ff86df5fec5376d0f791fea76bdc1ab6987533f754cff48343d6b4c8725'
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
