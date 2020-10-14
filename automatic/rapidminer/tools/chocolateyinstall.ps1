$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
   
  url           = 'https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio-win32-install.exe?utm_source=nexus&utm_medium=nexus'
  checksum      = '2916e8d699cce758d8b11bdb69a4decfc1de45cae890966bbb73dd3ca2ec00f5'
  checksumType  = 'sha256'

  url64bit      = 'https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio-win64-install.exe?utm_source=nexus&utm_medium=nexus'
  checksum64    = 'c61e0323d2a0cf8a08783f0a114960400c774bb4c27ce3c6c4081080928bd189'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
