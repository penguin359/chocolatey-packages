$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = Get-RedirectedURL 'https://forum.xda-developers.com/attachment.php?attachmentid=397939&d=1284039287'
  checksum      = '5AD7934660E589CD6739204FB461AFCA35496D87ED05D594648EF9540D0AB139'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs
