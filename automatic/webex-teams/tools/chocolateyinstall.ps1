$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/WebexTeams.msi'
  checksum     = 'd7c80af85305facf7f0cd587f5c273e91bc69e60856394419850cdbadfb0ec3f'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
