$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://download.kugou.com/download/kugou_pc'
  checksum     = 'd2dcd35229f960026e18ee0c524a38e361a5c5fe7bba14c86b5566b4bb87059f'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs