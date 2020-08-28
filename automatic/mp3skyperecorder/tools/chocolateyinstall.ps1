$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'msi'

  url            = 'http://download.mp3skyperecorder.com/MP3SkypeRecorderSetup.exe?version=6.1.3'
  checksum       = '4156ad44f854451dd0c127d389427e7d4932608fd8fbc86de9c3f6c7b3014fcd'
  checksumType   = 'sha256'

  silentArgs	 = "/qn /norestart /l*v `"$env:Temp\$env:ChocolateyPackageName.MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
