$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'http://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Release-6-3-2-58052_Setup.exe'
  checksum       = '3c01e818a94e1365d32184d138e3f83a23ff319e9a68dd08ed81f6be9f41bb61'
  checksumType   = ''

  url64          = 'http://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Releasex64-6-3-2-58052_Setup.exe'
  checksum64     = '08a9c5d6eb187414e69a05d0848bb577cc64eedb911ca492ce8479f69b0347aa'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
