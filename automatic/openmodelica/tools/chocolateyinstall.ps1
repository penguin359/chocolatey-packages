$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.16/5/32bit/OpenModelica-v1.16.5-32bit.exe'
  checksum      = '974fd34301051800f562e3ac6ad4a3756cf84e4eb58e13b7c5eae3652ff98411'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.16/5/64bit/OpenModelica-v1.16.5-64bit.exe'
  checksum64    = 'f8543022c448a29588a903d5af6ebc1514a1218c3aafdd2a978ece22f6e27176'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
