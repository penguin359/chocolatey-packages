$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'http://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Release-6-3-9-58205_Setup.exe'
  checksum       = '33b023910ec333f1b73ea7ec8204582783d25137cd79a303419a777709b3345e'
  checksumType   = 'sha256'

  url64          = 'http://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Releasex64-6-3-9-58205_Setup.exe'
  checksum64     = '912264ab4797b9e04507508f98db2e994442c601d965e81f1532e2adea89cc99'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
