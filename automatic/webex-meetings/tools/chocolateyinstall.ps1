$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '8f2d33e04bb6008d7e9218905e7b2db3983131626d35de130d4c7f8f95f0ba466bf8b17c3fe81395f6a8e246e3ad8198bf2e615bcd8ba7ceff7d7547242e3eb1'  
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
