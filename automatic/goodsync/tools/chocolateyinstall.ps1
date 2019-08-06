$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = "MSI"

  url          = 'https://www.goodsync.com/download/GoodSync-v10-Setup.msi'
  checksum     = 'd51d758be742e202c6865d0bb2c8ec37ce740a74e188a546a43d79ee9cd526af'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
