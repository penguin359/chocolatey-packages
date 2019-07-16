$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = "MSI"

  url           = 'https://www.goodsync.com/download/GoodSync-v10-Setup.msi'
  checksum      = 'C2538C9601F0A8B863B819992DFE64C45A2E51919A5C0AE737BDC95832D9E718'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs