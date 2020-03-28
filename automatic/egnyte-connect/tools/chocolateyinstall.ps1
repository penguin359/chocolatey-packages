$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'https://egnyte-cdn.egnyte.com/egnytedrive/win/en-us/3.7.1/EgnyteConnect_3.7.1_11.msi'
  checksum     = '8561295d56c5506ba039d2fdabf9f6d35a10d60a89a7ae5ce16fc7d6e01582ed'
  checksumType = 'sha256'  

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
