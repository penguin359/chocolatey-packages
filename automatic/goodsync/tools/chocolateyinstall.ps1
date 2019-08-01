$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = "MSI"

  url          = 'https://www.goodsync.com/download/GoodSync-v10-Setup.msi'
  checksum     = '153fd5598df51bb7daf9261616b7e9e4c574ca3a65396545d6417a760e5e0b9a'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs