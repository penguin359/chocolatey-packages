$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir
    
  file          = "$toolsDir\smtube-18.11.0-win32.exe"
  checksum      = 'CBC15A26411E531D9AEA75B9B0577117DEE93A8656EE4CE6CD7A22848E64E6C3'
  checksumType  = 'sha256'
  
  file64        = "$toolsDir\smtube-18.11.0-x64.exe"
  checksum64    = 'DB97AB247F1C391C16AA16057C6FDE34EFB827344E8D8E402C620869889B5A81'
  checksumType64= 'sha256'
  
  silentArgs	= "/S"
}

Install-ChocolateyInstallPackage @packageArgs