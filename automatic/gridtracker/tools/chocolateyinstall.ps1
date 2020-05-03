$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc0e6466898ca26db13ce1916d5b.dl.dropboxusercontent.com/cd/0/get/A3CRdE6KIzN0go-zeKy0FiMPWL4E66p2Zk7265P2d2Pmu95joab0LWK6IyD51oKQhDO2yUcKS2sBmQ9u8CdTqcmiuZ-Fe0U22JOCicLfsviboRKWOk3c138addhmolij3rQ/file?dl=1#'
  checksum     = '8981fe2c533e0cb13e090da4e48bae97b515c6bb7758e93a103c04fb6bcc8dd8'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
