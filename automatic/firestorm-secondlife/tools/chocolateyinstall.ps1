$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'http://downloads.firestormviewer.org/windows/Phoenix-Firestorm-release-6-2-4-57588_Setup.exe'
  checksum       = 'AA80ECAFD22AB262BBD6A02318B4603FF3D5E27FEA9A61A5B6DDF38DDBE9DDD9'
  checksumType   = 'sha256'

  url64          = 'http://downloads.firestormviewer.org/windows/Phoenix-Firestorm-releasex64-6-2-4-57588_Setup.exe'
  checksum64     = 'F41B827191AC2C3DFB131F5397F5E741A37282289A61A37AC8ADC5E47AE07FDD'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs