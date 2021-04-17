$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.photosync-app.com/tl_files/photosync/publish/win/photosync_setup.404/photosync_setup.exe'
  checksum      = '87765769CCC5376CFF424D51017BC115EB1910791D5000112E2697AFFEAD2674'
  checksumType  = 'sha256'

  silentArgs    = '/S /allusers'
}

Install-ChocolateyPackage @packageArgs
