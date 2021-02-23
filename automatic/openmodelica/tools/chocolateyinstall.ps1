$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.16/4/32bit/OpenModelica-v1.16.4-32bit.exe'
  checksum      = '3de7014d701c7af8523b24e52723bd22b9f682bba12b55eb9c8320370155d9cb'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.16/4/64bit/OpenModelica-v1.16.4-64bit.exe'
  checksum64    = 'fbe020f27edbb015bb4d7e519a0a6caa5139cfa6b730919ae2803990c5a86e3c'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
