$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://download.savannah.gnu.org/releases/klog/win/KLog-0.9.6-windows-installer.exe'

  softwareName  = 'klog*'

  checksum      = 'e772c161fa55124fe258f73a3154846be671960f2a06803495bc03e961905673'
  checksumType  = 'sha256'
  
  silentArgs    = "--mode unattended"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
