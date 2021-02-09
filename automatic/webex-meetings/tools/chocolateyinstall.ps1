$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '2c1ab55aed80d2ffe4ce79a5990354dddf5074b724aa1dcd92f37579ee8956059c6d4bf25e9b58faef14cd10541eaf55d316e7d4cead5a5f50059c46769a98f5'  
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
