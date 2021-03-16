$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Release-6-4-13-63251_Setup.exe'
  checksum       = '9859dee31b1c5f5199a0a16762f26993d6838682691a3e055cfea7b449f935d4'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Releasex64-6-4-13-63251_Setup.exe'
  checksum64     = 'a34630ecde168740be663313a608ad755f6bb84bf283019b191e32546f965303'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
