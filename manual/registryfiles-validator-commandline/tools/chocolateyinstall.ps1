$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = Get-RedirectedURL 'https://forum.xda-developers.com/attachment.php?attachmentid=397962&d=1284040833'
  checksum      = 'FC6A2C54B92494B4230943260151107322E6233D9F4759B9884EB7C578AB143D'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs