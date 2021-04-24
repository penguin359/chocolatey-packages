$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '258aebe5162b49deae766bdabd436903e3c1436e0a2eb8a146420d84a21fd5b298f7681759b72cc1f42c52f90478e1555b2385ba60c1a39e555337c17b942056'  
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
