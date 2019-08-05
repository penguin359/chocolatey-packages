$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = "MSI"

  url          = 'https://www.goodsync.com/download/GoodSync-v10-Setup.exe'
  checksum     = '6da94e5f8a41880178e1ccf4f5160ebbcbd51b1c14f37383a2f2146c557bf1cd'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
