$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'KLog'
  fileType      = 'exe'

  url           = 'https://download.savannah.gnu.org/releases/klog/win/KLog-0.9.7.2-windows-installer.exe'
  checksum      = '2979BF01310905D48661FE96B38222D3471CF60D6A4BC0C8636FF1A4C53F9761'
  checksumType  = 'sha256'

  silentArgs    = "--mode unattended"
}

Install-ChocolateyPackage @packageArgs