$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.remotehams.com/download.php?dir=orb&file=RCForb_0.7.8322.exe'
$checksum   = '8b411f5eef566f6c64b18c24909c9526f7cbae6de6269a7257deb05d34ae0811'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'RCForb (Server)*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
