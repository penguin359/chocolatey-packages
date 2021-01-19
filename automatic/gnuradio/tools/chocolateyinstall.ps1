$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'MSI'

  url64          = 'http://www.gcndevelopment.com/gnuradio/downloads/installers/v3.8.2.1/gnuradio_3.8.2.0_win64.msi'
  checksum64     = '70ac41aa584ea47b281f3dfae834149cddaf02c9bc85b8a37b5b3134ec0436c0'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
