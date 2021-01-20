$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '845067ed80a8f5b87d6a43fc3f6c6e067b8691d78885116f82cef2ac551d3bf1'
  url64        = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum64   = '845067ed80a8f5b87d6a43fc3f6c6e067b8691d78885116f82cef2ac551d3bf1'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
