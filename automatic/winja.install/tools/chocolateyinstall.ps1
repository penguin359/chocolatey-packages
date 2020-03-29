$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'
  file          = "$toolsDir\setup.exe"
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

  url           = 'https://www.phrozen.io/bin/winja7-1.zip'
  checksum      = 'DD3685B45F833E10DACCC85EA7D1838E4DD0E99E7C32812C06DD0BDAEBA9A6C6'
  checksumType  = 'sha256'
  
}

Install-ChocolateyZipPackage @packageArgs

Remove-Item -Recurse "$toolsDir\Portable Version"

Install-ChocolateyInstallPackage @packageArgs
