$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  
  url           = 'https://www.vanheusden.com/httping/httping-2.5-win64.zip'
  checksum      = '767EDAC1DE2328618357630DE60B2B4FCA05F19A554EF4FBD2C4974C4516D27C'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs