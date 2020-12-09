$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/WebexTeams.msi'
  checksum     = 'bb948976f5f2f696770e49b69e6ea4cb2e45bfd4b30a19ad2df525ffacf62dd2'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
