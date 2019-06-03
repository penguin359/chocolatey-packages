$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://cdn.theunarchiver.com/downloads/unarWindows.zip'
  checksum      = '61A6B299606282F72F51C278801EAC11D3DCCFAC83E2D68BCCCE33539912E0DD'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs