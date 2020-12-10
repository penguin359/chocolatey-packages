$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Release-6-4-12-62831_Setup.exe'
  checksum       = '71ae44511b45c46c7f544695b7e07534cd52cac028dd2be62885777d62a39b6b'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Releasex64-6-4-12-62831_Setup.exe'
  checksum64     = 'd3500bba256bd51a5c89abc9ca57578596cd7d51846a90071dee4d3b84fde40b'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
