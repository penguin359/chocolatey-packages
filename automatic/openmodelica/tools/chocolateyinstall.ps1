$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.13/2/32bit/OpenModelica-v1.13.2-32bit.exe'
  checksum      = '0B882076FC8D84BB418EA69CB73BD7A4176C78D7903BEBFB6E61F4C230BB19F2'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.13/2/64bit/OpenModelica-v1.13.2-64bit.exe'
  checksum64    = 'CF94107E61B5E340D861AD6F4F4951CCB4AD58CAEF4BE43EEFA44F8536E4F5BC'
  checksumType64= 'sha256'
  
  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs