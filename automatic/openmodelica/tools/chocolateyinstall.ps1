$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.14/final/32bit/OpenModelica-v1.14.0-32bit.exe'
  checksum      = '7689bfcb07abd1dbd285ea55bc249b86accfddf9dd56d0b59dfee1c4b36b6cf5'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.14/final/64bit/OpenModelica-v1.14.0-64bit.exe'
  checksum64    = '998afeab4b6530537c1f5e4821d46756f2c0ca1e806ef94b54bac8624ab216ea'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
