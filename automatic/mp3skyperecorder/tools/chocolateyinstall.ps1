$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'msi'

  url            = 'http://download.mp3skyperecorder.com/MP3SkypeRecorderSetup.exe?version=6.0.11'
  checksum       = 'fa5993ed60a30a33b74cbfed8d4d68a4b87c817d1752a5e3094ce4fdfea6fc36'
  checksumType   = 'sha256'

  silentArgs	 = "/qn /norestart /l*v `"$env:Temp\$env:ChocolateyPackageName.MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
