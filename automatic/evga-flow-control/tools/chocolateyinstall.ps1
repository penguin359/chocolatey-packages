$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'
  file          = "$toolsDir\EVGA_Flow_Control_Setup.exe"

  url           = 'https://cdn.evga.com/utilities/EVGA_Flow_Control_Setup_v2.0.9.zip'
  options       = @{ Headers = @{ "Accept-Encoding"="gzip, deflate, br" } }
  checksum      = '67D2FECD03820DD1F5DF51A83536B43108E3A433F3F5190F1558FAFE0735C048'
  checksumType  = 'sha256'

  silentArgs    = '/S /v/qn'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs



$options =
@{
  Headers = @{
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
    'Accept-Charset' = 'ISO-8859-1,utf-8;q=0.7,*;q=0.3';
    'Accept-Language' = 'en-GB,en-US;q=0.8,en;q=0.6';
    Cookie = 'requiredinfo=info';
    Referer = 'https://somelocation.com/';
  }
}