$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '706ee82c263b185c28b523900674b38a622a3e76c3678a043c00b39a0cc8e965'
  url64        = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum64   = '706ee82c263b185c28b523900674b38a622a3e76c3678a043c00b39a0cc8e965'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
