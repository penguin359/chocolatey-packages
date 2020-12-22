$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.16/2/32bit/OpenModelica-v1.16.2-32bit.exe'
  checksum      = '4d7ac59d037a2f966397f9978e4a67ecf450e48433ecf47cef4c01cac679386b'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.16/2/64bit/OpenModelica-v1.16.2-64bit.exe'
  checksum64    = 'e472f8561c377c2b039fbd38b17fdcad0b1670a071ebe1b9b187aaf22b681db6'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
