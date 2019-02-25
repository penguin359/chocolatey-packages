$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://mirrors.up.pt/pub/nongnu/klog/win/KLog-0.9.6-windows-installer.exe'
$url64      = $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'klog*'

  checksum      = 'E772C161FA55124FE258F73A3154846BE671960F2A06803495BC03E961905673'
  checksumType  = 'sha256'
  
  silentArgs    = "--mode unattended"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs