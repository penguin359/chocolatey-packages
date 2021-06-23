$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = 'a72d2df1a9614f6a5c1dad42ab7a64e07cd58fe4a6e5a14677228eac3fa786181e64f819a50baf2f7ae0a15078b8ecc884276a54309b43e0ab1ed4b7df7d600e'  
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
