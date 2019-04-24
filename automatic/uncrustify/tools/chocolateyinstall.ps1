$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
    
  url           = 'https://sourceforge.net/projects/uncrustify/files/uncrustify/uncrustify-0.68.1/uncrustify-0.68.1-win32.zip/download'
  checksum      = 'C7EA58B9059E8AE0691AB80D80DAE413EEF02E04895609E4BA08F901B8FDD801'
  checksumType  = 'sha256'
  
  url64bit      = 'https://sourceforge.net/projects/uncrustify/files/uncrustify/uncrustify-0.68.1/uncrustify-0.68.1-win64.zip/download'
  checksum64    = '3C027D5E33C24A7EE5956084C2F1A26F419412C38DAF30A55A428CABBE84ED30'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs