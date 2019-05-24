$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'msi'

  url            = 'https://voipcallrecording.com/old/MP3SkypeRecorderSetup452.msi'
  checksum       = 'b81195aeadb06d9e087dfa34c14e79665d3f67af5ba8d4c9e47f47a48b09cc37'
  checksumType   = 'sha256'

  silentArgs	 = "/qn /norestart /l*v `"$env:Temp\$env:ChocolateyPackageName.MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs