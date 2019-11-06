$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
   
  url           = 'https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio-win32-install.exe?utm_source=nexus&utm_medium=nexus'
  checksum      = '9f64d20f84e125084237ddf6db6eade87ec917f234614512d66b0876bf3a7a7c'
  checksumType  = 'sha256'

  url64bit      = 'https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio-win64-install.exe?utm_source=nexus&utm_medium=nexus'
  checksum64    = 'd50e4077ab98f821709640008559c658cd430c413554750c3c5a68a0387494b2'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
