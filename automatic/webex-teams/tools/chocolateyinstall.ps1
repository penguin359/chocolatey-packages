$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/WebexTeams.msi'
  checksum     = 'bf465b9ec8872be6d71c764042c663262bdd31a4cd5b98986d5936d0f8eb1d6c'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
