$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'MSI'

  url64          = 'http://www.gcndevelopment.com/gnuradio/downloads/installers/v1.7.0/gnuradio_3.8.1.0_win64.msi'
  checksum64     = '32223e46e3e8136689a6b6f64238607abb66fe7e272c38a5acc9043bbf6da241'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
