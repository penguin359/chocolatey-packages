$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url64bit      = 'http://www.gcndevelopment.com/gnuradio/downloads/installers/v1.7.0Beta/gnuradio_3.8.0.0_win64.msi'
  checksum64    = '6251F99B166BE2DA5C82ACCB3CC1E1D3CAA7A8A4E573C54DD79F4F51D47C8E77'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs