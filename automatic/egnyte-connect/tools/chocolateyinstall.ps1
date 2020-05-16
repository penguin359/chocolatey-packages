$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'https://egnyte-cdn.egnyte.com/egnytedrive/win/en-us/3.7.3/EgnyteConnect_3.7.3_18.msi'
  checksum     = '86ede9feb22d7c2b8bf9d3e73b8f8ade0448b6c099ff08e4ce9356ad2f3fb0c9'
  checksumType = 'sha256'  

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
