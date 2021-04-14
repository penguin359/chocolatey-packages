$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'https://egnyte-cdn.egnyte.com/egnytedrive/win/en-us/3.8.3/EgnyteConnect_3.8.3_29.msi'
  checksum     = 'a4a84c1eebf216c5da2c2a76a6c910542452f355293e619a549e311912ff6c7f'
  checksumType = 'sha256'  

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
