$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://download.mirillis.com/files/splash_2_7_0_setup.exe'
  checksum      = '85408a916c456c4adcc02a6b9824daa9b8ff12e2efef6e0a430ccdef59cdba05'
  checksumType  = 'sha256'
  
  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs