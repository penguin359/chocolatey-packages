$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'MSI'

  url64          = 'http://www.gcndevelopment.com/gnuradio/downloads/installers/v3.8.2.1/gnuradio_3.8.2.0_win64.msi'
  checksum64     = 'db3ef3077e144b85ddaa8d0fb2b0fe6f759010c01efc265a9dd1e295bd5d849d'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
