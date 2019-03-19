$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://download.savannah.gnu.org/releases/klog/win/KLog-0.9.7.2-windows-installer.exe'

  softwareName  = 'KLog'

  checksum      = '5eacce503b07a20e67f3292d2b61b29dcfd4a97e4c7c02269051e747c78eb5cd'
  checksumType  = 'sha256'
  
  silentArgs    = "--mode unattended"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
