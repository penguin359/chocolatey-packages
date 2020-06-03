$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
   
  url           = 'https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio-win32-install.exe?utm_source=nexus&utm_medium=nexus'
  checksum      = 'f3d7e132b6af8a30710e5733d6bd65662d419f5a7c94dec83d85e2b3b00160cb'
  checksumType  = 'sha256'

  url64bit      = 'https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio-win64-install.exe?utm_source=nexus&utm_medium=nexus'
  checksum64    = '83755fba7237ceb977ac15b7216e8377e9256c75ceb2822e9c3c8e47ea4ed418'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
