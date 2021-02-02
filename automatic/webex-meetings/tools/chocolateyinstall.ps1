$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '92e39e83c9de7c6e885ecd14e5a9b340adcbb56544e2366ba189e837ee3b8e63d5edd7730478000eed3dd4785159ba445f95a587acafcb332aff610876af0eca'
  url64        = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum64   = '3f7dad759db5130dd0c6db257c5383ff515320013256b4a2ba73f03b5d729ae0'
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
