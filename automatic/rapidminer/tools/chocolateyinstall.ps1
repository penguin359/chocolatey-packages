$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
   
  url           = 'https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio-win32-install.exe?utm_source=nexus&utm_medium=nexus'
  checksum      = 'c80a0a35566c3af74080114eb0f70741765a17240e7083668e004c8c2b25615a'
  checksumType  = 'sha256'

  url64bit      = 'https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio-win64-install.exe?utm_source=nexus&utm_medium=nexus'
  checksum64    = 'b3e2cea2ecd1bb6b0bb9f9d1e39915207739c8778c05f80d0cd968ad0aeba54a'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
