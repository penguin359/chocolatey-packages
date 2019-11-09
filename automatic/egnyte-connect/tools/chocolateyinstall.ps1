$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'https://egnyte-cdn.egnyte.com/egnytedrive/win/en-us/3.5.3/EgnyteConnect_3.5.3_1.msi'
  checksum     = '1a9e2275f1392874f1d979a23d531c4d0526b6b324f2a401176c55f0b4be7f2d'
  checksumType = 'sha256'  

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
