$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.17/0/32bit/OpenModelica-v1.17.0-32bit.exe'
  checksum      = '01746f1bf3ffdc2ceb4670093d9834734467618062fa40d58d0420b0054e3431'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.17/0/64bit/OpenModelica-v1.17.0-64bit.exe'
  checksum64    = 'a8c8918ff1d27532b2366d8163ff468dadf2b7a33dddd80cf3f37c957ea0bf1a'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
