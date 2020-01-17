$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'msi'

  url            = 'http://download.mp3skyperecorder.com/MP3SkypeRecorderSetup.exe?version=6.0.8'
  checksum       = '601b0d0072141f9bbb44afbca82afdd136ef020c46ff9d8d5138d409d26b5ad2'
  checksumType   = 'sha256'

  silentArgs	 = "/qn /norestart /l*v `"$env:Temp\$env:ChocolateyPackageName.MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
