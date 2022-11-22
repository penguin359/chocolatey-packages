$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.remotehams.com/download.php?dir=orb&file=RCForb_0.7.8014.exe'
$checksum   = 'AF325EE785B567BE61D715F07DC547DFFC89B1367BA5FFB33A10EAAA5A5CA90D'

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
