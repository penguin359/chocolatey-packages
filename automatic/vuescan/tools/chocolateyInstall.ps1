$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://www.hamrick.com/files/vuex3297.exe'
  checksum       = '0de6b5ef09d3ca53a3f5ef0aace52832f10030b542a87dad32744a28d8be269a'
  checksumType   = 'sha256'

  url64          = 'https://www.hamrick.com/files/vuex6497.exe'
  checksum64     = '5609cd480a6ea53e4245b5ebe0269612c4ad2b4a54478199a0dffdc538dd9f0f'
  checksumType64 = 'sha256'
}

if (Get-ChildItem Cert:\CurrentUser\TrustedPublisher\|Where subject -eq "CN=Hamrick Software, O=Hamrick Software, L=Sunny Isles Beach, S=Florida, C=US") {
  Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
} else {
  Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyInstallCertificate.ahk`""
}
Install-ChocolateyPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'VueScan.lnk'
$targetPath = Join-Path $env:ProgramFiles 'VueScan\vuescan.exe'
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutFilePath" -TargetPath "$targetPath"
