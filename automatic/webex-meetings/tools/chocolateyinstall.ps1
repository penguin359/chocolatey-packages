$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '3f7dad759db5130dd0c6db257c5383ff515320013256b4a2ba73f03b5d729ae0'
  url64        = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum64   = '3f7dad759db5130dd0c6db257c5383ff515320013256b4a2ba73f03b5d729ae0'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
