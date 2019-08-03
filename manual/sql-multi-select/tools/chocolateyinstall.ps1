$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://www.yohz.com/downloads/sqlmultiselect/SQLMultiSelectSetup.zip'
  checksum      = '7C2ED11FC376C395B1F5E0F473725B478D4AFC9361AF58D56AFF238B7F5572CB'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  fileType      = 'exe'
  file          = "$toolsDir\SQLMultiSelectSetup.exe"  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyInstallPackage @packageArgs