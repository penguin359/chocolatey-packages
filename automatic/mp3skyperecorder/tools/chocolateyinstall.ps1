$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'msi'

  url            = 'http://download.mp3skyperecorder.com/MP3SkypeRecorderSetup.exe?version=6.0.12'
  checksum       = '2500f3e59eda7ad4d70dc3119c2895d5a1037b54a77907b76b8394e8108a658c'
  checksumType   = 'sha256'

  silentArgs	 = "/qn /norestart /l*v `"$env:Temp\$env:ChocolateyPackageName.MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
