$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://studio.download.atmel.com/7.0.1931/as-installer-7.0.1931-full.exe'
  checksum      = '4815F78C642968E8727E0B84AC79E8C0D9C8486678BD48224B72685CA4D695AB'
  checksumType  = 'sha256'
  
  silentArgs    = "-q"
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs

# Close AutoHotKey
$autohotkey = Get-Process AutoHotKey -ErrorAction SilentlyContinue
if ($autohotkey) { $autohotkey | Stop-Process }

Write-Warning @'
Notes:
  - atmel-studio needs a reboot to finish automatically the installation.
  - atmel-studio shortcut icon will appear on the desktop after about 5/10 minutes after the restart.
'@