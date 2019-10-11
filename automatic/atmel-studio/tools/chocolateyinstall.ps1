$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://studio.download.atmel.com/7.0.2389/as-installer-7.0.2389-full.exe'
  checksum     = 'ea39ce68ac597c8c3cd0addf6d2f54a4eea124c23603f429045d9d44d0621f38'
  checksumType = 'sha256'

  silentArgs   = '-q'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs

# Close AutoHotKey
$autohotkey = Get-Process AutoHotKey -ErrorAction SilentlyContinue
if ($autohotkey) { $autohotkey | Stop-Process }

Write-Warning @'
Notes:
  - atmel-studio needs a reboot to finish automatically the installation. After the restart, you will be prompted to install 2 certificates from:
    - Microchip Technology, Inc.
    - Atmel Corporation.
  - atmel-studio shortcut icon will appear on the desktop after about 5/10 minutes after the restart.
'@
