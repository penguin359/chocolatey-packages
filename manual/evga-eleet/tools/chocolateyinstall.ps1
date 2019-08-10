$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  
  url           = 'http://storage.cdn.evga.com/software/eleet.zip'
  checksum      = '3760912FE4DA4C244EB56BF1642B96A38A538311F054F24B51CD3230D21E7B76'
  checksumType  = 'sha256'
  
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  file          = "$toolsDir\ELeetTune_1104_setup.exe"
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'   
}

Install-ChocolateyInstallPackage @packageArgs