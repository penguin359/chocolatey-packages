$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/WebexTeams.msi'
  checksum     = '63746eba64093a1a5ff514bccbe05bdc16959c9b83de63dc6cd2a0f934339ac2'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
