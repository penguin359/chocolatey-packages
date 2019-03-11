$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://download.savannah.gnu.org/releases/klog/win/KLog-0.9.7.1-windows-installer.exe'

  softwareName  = 'KLog'

  checksum      = 'edd47310f8df5211a25473cf9c1718390d384c78f83b1c6ef316338e0e49af7b'
  checksumType  = 'sha256'
  
  silentArgs    = "--mode unattended"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
