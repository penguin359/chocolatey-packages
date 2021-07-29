$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'
  file          = "$toolsDir\EVGA_Flow_Control_Setup.exe"

  url           = 'https://cdn.evga.com/utilities/EVGA_Flow_Control_Setup_v2.0.9.zip'
  options       = @{ Headers = @{ "Accept-Encoding"="gzip, deflate, br"; } }
  checksum      = '67D2FECD03820DD1F5DF51A83536B43108E3A433F3F5190F1558FAFE0735C048'
  checksumType  = 'sha256'

  silentArgs    = '/S /v/qn'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs