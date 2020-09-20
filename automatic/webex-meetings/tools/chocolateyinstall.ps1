$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/WBXclient-40.9.6-11/webexapp.msi'
  checksum     = '93d26d68b47b0a34a306395be2235e61c7b60241eaa469cfc9bcde1d2449544e'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
