$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = "MSI"

  url          = 'https://www.goodsync.com/download/GoodSync-v10-Setup.exe'
  checksum     = 'B1E93D32F3104C9BB9F472F7196EEC2D52488C1522897AE73139FEDF256AD4FE'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
