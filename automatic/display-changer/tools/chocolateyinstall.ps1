$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  destination  = "$toolsDir"

  url          = 'https://12noon.com/files/dc.zip'
  checksum     = '01FAF70A4640E3AD89AE1DB78AA6B95F4FDC0CF162FCC92CF279442FBFFF20CB'
  checksumType = 'sha256'

  # silentArgs   = '/S'
}

# Install-ChocolateyPackage @packageArgs
Install-ChocolateyZipPackage @packageArgs