$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://download.mirillis.com/files/splash_2_6_1_setup.exe'
  checksum      = 'C81C5D1DCC18CD52C0A3B77836FDAC12B74CBDD4E6EC08C798D80B5FA143A82E'
  checksumType  = 'sha256'
  
  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs