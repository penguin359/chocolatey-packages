$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://download.xnview.com/XnShellEx.zip'
  checksum      = 'E17DEFAEB3A5E1C081B7EB27AACF049DD07CBC48DF63477904AAA571037EA0E0'
  checksumType  = 'sha256'
  
  url64bit      = 'https://download.xnview.com/XnShellEx64.zip'
  checksum64    = 'F4041EFD70B95EC53ADA9A6006A7565F92F2DCBFA2995F7030E2FCD91920E0BA'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Start-Process 'regsvr32' -ArgumentList "/s $toolsDir\XnShellEx\XnViewShellExt64.dll"