$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = Get-RedirectedURL 'https://www.dropbox.com/s/n661tz0nd3zah9m/GridTracker-Installer.1.19.1026.exe?dl=1'
  checksum     = '139c50f269a90949ae7748c9ad67833c33a0eba4501ff5498c99fb233d4a5416'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
