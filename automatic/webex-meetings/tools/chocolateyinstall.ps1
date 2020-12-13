$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/WBXclient-40.12.5-14/webexapp.msi'
  checksum     = '81ad583b78ffff5323800dcdd4918d75308ad98a40f0a92e414268d752287a55'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
